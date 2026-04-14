// Medical Science Liaison — Templates 6-10
// Run via: sf apex run --file scripts/medical_science_liaison_templates_2.apex
String ts = String.valueOf(System.currentTimeMillis());
List<ActionPlanTemplateItemValue> vals = new List<ActionPlanTemplateItemValue>();

// ---- 6: Phase III Data Dissemination (EU) ----
String n6 = 'MSL_Phase_III_Dissemination_EU_' + ts;
ActionPlanTemplate t6 = new ActionPlanTemplate(Name=n6, UniqueName=n6, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t6;
ActionPlanTemplateVersion v6 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t6.Id LIMIT 1];
List<ActionPlanTemplateItem> i6 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Develop Data Discussion Guide', UniqueName='Data_Guide_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Schedule KOL Scientific Exchanges', UniqueName='KOL_Exchanges_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Conduct Dissemination Meetings', UniqueName='Dissem_Mtgs_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Capture Medical Insights', UniqueName='Med_Insights_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i6;
List<List<String>> m6 = new List<List<String>>{new List<String>{'Develop Data Discussion Guide','High','5'}, new List<String>{'Schedule KOL Scientific Exchanges','High','14'}, new List<String>{'Conduct Dissemination Meetings','High','21'}, new List<String>{'Capture Medical Insights','Normal','7'}};
for(Integer x=0;x<i6.size();x++){Id iid=i6[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m6[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m6[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m6[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m6[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v6.Status='Final';update v6;
System.debug('Created: '+n6);

// ---- 7: Treatment Guideline Update Response (US) ----
String n7 = 'MSL_Guideline_Update_US_' + ts;
ActionPlanTemplate t7 = new ActionPlanTemplate(Name=n7, UniqueName=n7, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t7;
ActionPlanTemplateVersion v7 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t7.Id LIMIT 1];
List<ActionPlanTemplateItem> i7 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Analyze Guideline Changes', UniqueName='Analyze_Guide_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Identify Affected Institutions', UniqueName='Affected_Inst_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Conduct KOL Education Sessions', UniqueName='KOL_Education_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Monitor Guideline Adoption', UniqueName='Guide_Adoption_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i7;
List<List<String>> m7 = new List<List<String>>{new List<String>{'Analyze Guideline Changes','High','3'}, new List<String>{'Identify Affected Institutions','High','5'}, new List<String>{'Conduct KOL Education Sessions','High','14'}, new List<String>{'Monitor Guideline Adoption','Low','30'}};
for(Integer x=0;x<i7.size();x++){Id iid=i7[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m7[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m7[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m7[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m7[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v7.Status='Final';update v7;
System.debug('Created: '+n7);

// ---- 8: Safety Signal Communication (EU) ----
String n8 = 'MSL_Safety_Signal_EU_' + ts;
ActionPlanTemplate t8 = new ActionPlanTemplate(Name=n8, UniqueName=n8, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t8;
ActionPlanTemplateVersion v8 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t8.Id LIMIT 1];
List<ActionPlanTemplateItem> i8 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Review Updated Safety Information', UniqueName='Review_Safety_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Develop Communication Strategy', UniqueName='Comm_Strategy_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Conduct Prescriber Outreach', UniqueName='Prescriber_Out_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Document Communication Log', UniqueName='Comm_Log_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i8;
List<List<String>> m8 = new List<List<String>>{new List<String>{'Review Updated Safety Information','High','1'}, new List<String>{'Develop Communication Strategy','High','2'}, new List<String>{'Conduct Prescriber Outreach','High','7'}, new List<String>{'Document Communication Log','High','3'}};
for(Integer x=0;x<i8.size();x++){Id iid=i8[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m8[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m8[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m8[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m8[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v8.Status='Final';update v8;
System.debug('Created: '+n8);

// ---- 9: Medical Education Program (US) ----
String n9 = 'MSL_Medical_Education_US_' + ts;
ActionPlanTemplate t9 = new ActionPlanTemplate(Name=n9, UniqueName=n9, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t9;
ActionPlanTemplateVersion v9 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t9.Id LIMIT 1];
List<ActionPlanTemplateItem> i9 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Assess Educational Needs', UniqueName='Assess_Ed_Needs_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Identify Independent CME Provider', UniqueName='CME_Provider_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Submit Educational Grant Request', UniqueName='Ed_Grant_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Review Educational Content Plan', UniqueName='Ed_Content_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i9;
List<List<String>> m9 = new List<List<String>>{new List<String>{'Assess Educational Needs','Normal','10'}, new List<String>{'Identify Independent CME Provider','High','7'}, new List<String>{'Submit Educational Grant Request','Normal','14'}, new List<String>{'Review Educational Content Plan','Low','21'}};
for(Integer x=0;x<i9.size();x++){Id iid=i9[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m9[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m9[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m9[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m9[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v9.Status='Final';update v9;
System.debug('Created: '+n9);

// ---- 10: Post-Marketing Study Site Monitoring (EU) ----
String n10 = 'MSL_Post_Marketing_Study_EU_' + ts;
ActionPlanTemplate t10 = new ActionPlanTemplate(Name=n10, UniqueName=n10, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t10;
ActionPlanTemplateVersion v10 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t10.Id LIMIT 1];
List<ActionPlanTemplateItem> i10 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Schedule Site Visit', UniqueName='Site_Visit_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Review Enrollment Progress', UniqueName='Enrollment_Prog_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Address Site Questions', UniqueName='Site_Questions_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Submit Site Visit Report', UniqueName='Site_Report_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i10;
List<List<String>> m10 = new List<List<String>>{new List<String>{'Schedule Site Visit','Normal','7'}, new List<String>{'Review Enrollment Progress','High','3'}, new List<String>{'Address Site Questions','High','5'}, new List<String>{'Submit Site Visit Report','Normal','2'}};
for(Integer x=0;x<i10.size();x++){Id iid=i10[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m10[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m10[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m10[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m10[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v10.Status='Final';update v10;
System.debug('Created: '+n10);

System.debug('=== MEDICAL SCIENCE LIAISON: Templates 6-10 created ===');
