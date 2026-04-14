// Field Reimbursement Manager — Templates 6-10
// Run via: sf apex run --file scripts/field_reimbursement_manager_templates_2.apex
String ts = String.valueOf(System.currentTimeMillis());
List<ActionPlanTemplateItemValue> vals = new List<ActionPlanTemplateItemValue>();

// ---- 6: Medicare Part D Coverage Gap (US) ----
String n6 = 'FRM_Medicare_PartD_Gap_US_' + ts;
ActionPlanTemplate t6 = new ActionPlanTemplate(Name=n6, UniqueName=n6, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t6;
ActionPlanTemplateVersion v6 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t6.Id LIMIT 1];
List<ActionPlanTemplateItem> i6 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Identify Affected Patients', UniqueName='Affected_Patients_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Review Foundation Assistance Options', UniqueName='Foundation_Assist_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Coordinate with Prescribers', UniqueName='Coord_Prescribers_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3)
};
insert i6;
List<List<String>> m6 = new List<List<String>>{new List<String>{'Identify Affected Patients','High','3'}, new List<String>{'Review Foundation Assistance Options','High','5'}, new List<String>{'Coordinate with Prescribers','Normal','7'}};
for(Integer x=0;x<i6.size();x++){Id iid=i6[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m6[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m6[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m6[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m6[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v6.Status='Final';update v6;
System.debug('Created: '+n6);

// ---- 7: Hospital Inpatient Coding Optimization (EU) ----
String n7 = 'FRM_Hospital_Coding_EU_' + ts;
ActionPlanTemplate t7 = new ActionPlanTemplate(Name=n7, UniqueName=n7, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t7;
ActionPlanTemplateVersion v7 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t7.Id LIMIT 1];
List<ActionPlanTemplateItem> i7 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Review Hospital Coding Practices', UniqueName='Coding_Practices_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Provide DRG Assignment Guidance', UniqueName='DRG_Guidance_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Calculate Reimbursement Impact', UniqueName='Reimb_Impact_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Conduct Follow-up Validation', UniqueName='Followup_Valid_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i7;
List<List<String>> m7 = new List<List<String>>{new List<String>{'Review Hospital Coding Practices','Normal','7'}, new List<String>{'Provide DRG Assignment Guidance','High','5'}, new List<String>{'Calculate Reimbursement Impact','Normal','10'}, new List<String>{'Conduct Follow-up Validation','Low','14'}};
for(Integer x=0;x<i7.size();x++){Id iid=i7[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m7[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m7[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m7[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m7[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v7.Status='Final';update v7;
System.debug('Created: '+n7);

// ---- 8: Payer Policy Change Communication (US) ----
String n8 = 'FRM_Payer_Policy_Change_US_' + ts;
ActionPlanTemplate t8 = new ActionPlanTemplate(Name=n8, UniqueName=n8, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t8;
ActionPlanTemplateVersion v8 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t8.Id LIMIT 1];
List<ActionPlanTemplateItem> i8 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Analyze Policy Change Impact', UniqueName='Policy_Impact_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Develop Provider Communication', UniqueName='Provider_Comm_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Conduct Webinar for Practices', UniqueName='Webinar_Practices_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Update Reimbursement Hotline', UniqueName='Update_Hotline_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i8;
List<List<String>> m8 = new List<List<String>>{new List<String>{'Analyze Policy Change Impact','High','2'}, new List<String>{'Develop Provider Communication','High','3'}, new List<String>{'Conduct Webinar for Practices','High','7'}, new List<String>{'Update Reimbursement Hotline','High','1'}};
for(Integer x=0;x<i8.size();x++){Id iid=i8[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m8[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m8[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m8[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m8[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v8.Status='Final';update v8;
System.debug('Created: '+n8);

// ---- 9: Bridge Program Emergency Access (US) ----
String n9 = 'FRM_Bridge_Program_US_' + ts;
ActionPlanTemplate t9 = new ActionPlanTemplate(Name=n9, UniqueName=n9, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t9;
ActionPlanTemplateVersion v9 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t9.Id LIMIT 1];
List<ActionPlanTemplateItem> i9 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Verify Coverage Interruption', UniqueName='Verify_Coverage_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Submit Bridge Program Request', UniqueName='Bridge_Request_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Expedite Product Shipment', UniqueName='Expedite_Ship_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3)
};
insert i9;
List<List<String>> m9 = new List<List<String>>{new List<String>{'Verify Coverage Interruption','High','1'}, new List<String>{'Submit Bridge Program Request','High','2'}, new List<String>{'Expedite Product Shipment','High','3'}};
for(Integer x=0;x<i9.size();x++){Id iid=i9[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m9[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m9[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m9[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m9[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v9.Status='Final';update v9;
System.debug('Created: '+n9);

// ---- 10: Reimbursement Hub Integration (EU) ----
String n10 = 'FRM_Reimb_Hub_Integration_EU_' + ts;
ActionPlanTemplate t10 = new ActionPlanTemplate(Name=n10, UniqueName=n10, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t10;
ActionPlanTemplateVersion v10 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t10.Id LIMIT 1];
List<ActionPlanTemplateItem> i10 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Present Hub Services Overview', UniqueName='Hub_Overview_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Establish Referral Process', UniqueName='Referral_Process_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Train Pharmacy Staff', UniqueName='Train_Pharmacy_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Monitor Hub Activity', UniqueName='Monitor_Hub_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i10;
List<List<String>> m10 = new List<List<String>>{new List<String>{'Present Hub Services Overview','Normal','7'}, new List<String>{'Establish Referral Process','High','10'}, new List<String>{'Train Pharmacy Staff','Normal','5'}, new List<String>{'Monitor Hub Activity','Low','21'}};
for(Integer x=0;x<i10.size();x++){Id iid=i10[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m10[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m10[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m10[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m10[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v10.Status='Final';update v10;
System.debug('Created: '+n10);

System.debug('=== FIELD REIMBURSEMENT MANAGER: Templates 6-10 created ===');
