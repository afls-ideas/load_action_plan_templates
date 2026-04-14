// =============================================================================
// Create Action Plan Template, Publish, and Generate Action Plan
// Run via: sf apex run --file scripts/create_action_plan_template.apex
// =============================================================================

// Step 1: Create Action Plan Template
ActionPlanTemplate tmpl = new ActionPlanTemplate(
    Name = 'My Template',
    UniqueName = 'My_Template_' + System.currentTimeMillis(),
    ActionPlanType = 'Industries',
    TargetEntityType = 'Account',
    IsAdHocItemCreationEnabled = false
);
insert tmpl;
System.debug('Created ActionPlanTemplate: ' + tmpl.Id);

// Step 2: Query auto-created version (platform creates Version 1 automatically)
ActionPlanTemplateVersion ver = [
    SELECT Id FROM ActionPlanTemplateVersion
    WHERE ActionPlanTemplateId = :tmpl.Id LIMIT 1
];
System.debug('Auto-created ActionPlanTemplateVersion: ' + ver.Id);

// Step 3: Create template item (Task type)
ActionPlanTemplateItem item = new ActionPlanTemplateItem(
    Name = 'Follow-up Call',
    UniqueName = 'Follow_Up_Call_' + System.currentTimeMillis(),
    ActionPlanTemplateVersionId = ver.Id,
    ItemEntityType = 'Task',
    IsRequired = true,
    IsActive = true,
    DisplayOrder = 1
);
insert item;
System.debug('Created ActionPlanTemplateItem: ' + item.Id);

// Step 4: Create required field values for the Task item
// Note: Task.ActivityDate is NOT set here — it is computed at runtime from the
// Action Plan's StartDate. Only Subject and Priority are required.
insert new List<ActionPlanTemplateItemValue>{
    new ActionPlanTemplateItemValue(
        Name = 'Subject',
        ActionPlanTemplateItemId = item.Id,
        ItemEntityFieldName = 'Task.Subject',
        ValueLiteral = 'Follow-up Call',
        IsActive = true
    ),
    new ActionPlanTemplateItemValue(
        Name = 'Priority',
        ActionPlanTemplateItemId = item.Id,
        ItemEntityFieldName = 'Task.Priority',
        ValueLiteral = 'Normal',
        IsActive = true
    )
};
System.debug('Created ActionPlanTemplateItemValue records');

// Step 5: Publish the template (Draft → Final)
// This also sets the parent ActionPlanTemplate.Status to Final automatically.
ver.Status = 'Final';
update ver;
System.debug('Published template version to Final');

// Step 6: Select a random PersonAccount
List<Account> personAccounts = [
    SELECT Id, Name FROM Account
    WHERE IsPersonAccount = true
    LIMIT 200
];
if (personAccounts.isEmpty()) {
    System.debug('ERROR: No PersonAccount records found in org');
} else {
    Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), personAccounts.size());
    Account target = personAccounts[idx];
    System.debug('Selected PersonAccount: ' + target.Name + ' (' + target.Id + ')');

    // Step 7: Create Action Plan from the published template
    ActionPlan ap = new ActionPlan(
        Name = 'Action Plan for ' + target.Name,
        ActionPlanTemplateVersionId = ver.Id,
        ActionPlanType = 'Industries',
        TargetId = target.Id,
        ActionPlanState = 'Not Started',
        StartDate = Date.today(),
        IsUsingHolidayHours = false
    );
    insert ap;
    System.debug('Created ActionPlan: ' + ap.Id);

    System.debug('=== SUMMARY ===');
    System.debug('Template Id:  ' + tmpl.Id);
    System.debug('Version Id:   ' + ver.Id);
    System.debug('Item Id:      ' + item.Id);
    System.debug('ActionPlan Id: ' + ap.Id);
    System.debug('Target Account: ' + target.Name);
}
