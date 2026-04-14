// Field Sales Rep — Templates 6-10
// Run via: sf apex run --file scripts/field_sales_rep_templates_2.apex
String ts = String.valueOf(System.currentTimeMillis());
List<ActionPlanTemplateItemValue> vals = new List<ActionPlanTemplateItemValue>();

// ---- 6: Formulary Win Implementation (US) ----
String n6 = 'FSR_Formulary_Win_US_' + ts;
ActionPlanTemplate t6 = new ActionPlanTemplate(Name=n6, UniqueName=n6, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t6;
ActionPlanTemplateVersion v6 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t6.Id LIMIT 1];
List<ActionPlanTemplateItem> i6 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Meet with Pharmacy Director', UniqueName='Meet_Pharm_Dir_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Conduct Prescriber Education', UniqueName='Prescriber_Ed_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Coordinate Pull-Through Campaign', UniqueName='Pull_Through_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Monitor Formulary Utilization', UniqueName='Monitor_Form_Util_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i6;
List<List<String>> m6 = new List<List<String>>{new List<String>{'Meet with Pharmacy Director','High','7'}, new List<String>{'Conduct Prescriber Education','High','14'}, new List<String>{'Coordinate Pull-Through Campaign','Normal','21'}, new List<String>{'Monitor Formulary Utilization','Low','30'}};
for(Integer x=0;x<i6.size();x++){Id iid=i6[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m6[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m6[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m6[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m6[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v6.Status='Final';update v6;
System.debug('Created: '+n6);

// ---- 7: Clinical Trial Site Recruitment (EU) ----
String n7 = 'FSR_Trial_Site_Recruit_EU_' + ts;
ActionPlanTemplate t7 = new ActionPlanTemplate(Name=n7, UniqueName=n7, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t7;
ActionPlanTemplateVersion v7 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t7.Id LIMIT 1];
List<ActionPlanTemplateItem> i7 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Identify Investigator Sites', UniqueName='ID_Inv_Sites_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Submit Site Referral Form', UniqueName='Site_Referral_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Facilitate MSL Introduction', UniqueName='MSL_Intro_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3)
};
insert i7;
List<List<String>> m7 = new List<List<String>>{new List<String>{'Identify Investigator Sites','Normal','10'}, new List<String>{'Submit Site Referral Form','High','3'}, new List<String>{'Facilitate MSL Introduction','Normal','14'}};
for(Integer x=0;x<i7.size();x++){Id iid=i7[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m7[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m7[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m7[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m7[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v7.Status='Final';update v7;
System.debug('Created: '+n7);

// ---- 8: Account Objection Management (US) ----
String n8 = 'FSR_Objection_Mgmt_US_' + ts;
ActionPlanTemplate t8 = new ActionPlanTemplate(Name=n8, UniqueName=n8, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t8;
ActionPlanTemplateVersion v8 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t8.Id LIMIT 1];
List<ActionPlanTemplateItem> i8 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Document Objection Details', UniqueName='Doc_Objection_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Request MSL Clinical Support', UniqueName='Req_MSL_Support_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Schedule Follow-up Meeting', UniqueName='Followup_Mtg_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Update Account Strategy', UniqueName='Update_Acct_Strat_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i8;
List<List<String>> m8 = new List<List<String>>{new List<String>{'Document Objection Details','High','1'}, new List<String>{'Request MSL Clinical Support','High','3'}, new List<String>{'Schedule Follow-up Meeting','High','7'}, new List<String>{'Update Account Strategy','Normal','10'}};
for(Integer x=0;x<i8.size();x++){Id iid=i8[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m8[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m8[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m8[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m8[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v8.Status='Final';update v8;
System.debug('Created: '+n8);

// ---- 9: GDPR Consent Refresh Campaign (EU) ----
String n9 = 'FSR_GDPR_Consent_Refresh_EU_' + ts;
ActionPlanTemplate t9 = new ActionPlanTemplate(Name=n9, UniqueName=n9, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t9;
ActionPlanTemplateVersion v9 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t9.Id LIMIT 1];
List<ActionPlanTemplateItem> i9 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Review Expired Consent Records', UniqueName='Review_Consent_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Conduct Consent Renewal Calls', UniqueName='Consent_Calls_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Update CRM Consent Status', UniqueName='CRM_Consent_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3)
};
insert i9;
List<List<String>> m9 = new List<List<String>>{new List<String>{'Review Expired Consent Records','High','5'}, new List<String>{'Conduct Consent Renewal Calls','High','14'}, new List<String>{'Update CRM Consent Status','High','7'}};
for(Integer x=0;x<i9.size();x++){Id iid=i9[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m9[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m9[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m9[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m9[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v9.Status='Final';update v9;
System.debug('Created: '+n9);

// ---- 10: Territory Realignment Transition (US) ----
String n10 = 'FSR_Territory_Realignment_US_' + ts;
ActionPlanTemplate t10 = new ActionPlanTemplate(Name=n10, UniqueName=n10, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t10;
ActionPlanTemplateVersion v10 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t10.Id LIMIT 1];
List<ActionPlanTemplateItem> i10 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Complete Account Handoff Docs', UniqueName='Acct_Handoff_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Conduct Joint Calls with New Rep', UniqueName='Joint_Calls_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Transfer Pending Sample Orders', UniqueName='Transfer_Samples_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3)
};
insert i10;
List<List<String>> m10 = new List<List<String>>{new List<String>{'Complete Account Handoff Docs','High','5'}, new List<String>{'Conduct Joint Calls with New Rep','High','10'}, new List<String>{'Transfer Pending Sample Orders','High','3'}};
for(Integer x=0;x<i10.size();x++){Id iid=i10[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m10[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m10[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m10[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m10[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v10.Status='Final';update v10;
System.debug('Created: '+n10);

System.debug('=== FIELD SALES REP: Templates 6-10 created ===');
