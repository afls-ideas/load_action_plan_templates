// Key Account Manager — Templates 6-10
// Run via: sf apex run --file scripts/key_account_manager_templates_2.apex
String ts = String.valueOf(System.currentTimeMillis());
List<ActionPlanTemplateItemValue> vals = new List<ActionPlanTemplateItemValue>();

// ---- 6: Specialty Pharmacy Partnership (US) ----
String n6 = 'KAM_Specialty_Pharmacy_US_' + ts;
ActionPlanTemplate t6 = new ActionPlanTemplate(Name=n6, UniqueName=n6, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t6;
ActionPlanTemplateVersion v6 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t6.Id LIMIT 1];
List<ActionPlanTemplateItem> i6 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Assess SP Capabilities', UniqueName='SP_Capabilities_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Negotiate Service Level Agreement', UniqueName='SLA_Negotiate_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Implement Hub Services Integration', UniqueName='Hub_Integration_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Establish Performance Monitoring', UniqueName='Perf_Monitoring_'+ts, ActionPlanTemplateVersionId=v6.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i6;
List<List<String>> m6 = new List<List<String>>{new List<String>{'Assess SP Capabilities','Normal','10'}, new List<String>{'Negotiate Service Level Agreement','High','14'}, new List<String>{'Implement Hub Services Integration','High','21'}, new List<String>{'Establish Performance Monitoring','Normal','7'}};
for(Integer x=0;x<i6.size();x++){Id iid=i6[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m6[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m6[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m6[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m6[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v6.Status='Final';update v6;
System.debug('Created: '+n6);

// ---- 7: Hospital Protocol Integration (EU) ----
String n7 = 'KAM_Hospital_Protocol_EU_' + ts;
ActionPlanTemplate t7 = new ActionPlanTemplate(Name=n7, UniqueName=n7, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t7;
ActionPlanTemplateVersion v7 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t7.Id LIMIT 1];
List<ActionPlanTemplateItem> i7 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Map Current Treatment Protocols', UniqueName='Map_Protocols_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Present Clinical and Economic Value', UniqueName='Clin_Econ_Value_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Facilitate MSL Clinical Education', UniqueName='MSL_Clin_Ed_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Monitor Protocol Adoption', UniqueName='Protocol_Adopt_'+ts, ActionPlanTemplateVersionId=v7.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i7;
List<List<String>> m7 = new List<List<String>>{new List<String>{'Map Current Treatment Protocols','Normal','10'}, new List<String>{'Present Clinical and Economic Value','High','14'}, new List<String>{'Facilitate MSL Clinical Education','High','7'}, new List<String>{'Monitor Protocol Adoption','Low','30'}};
for(Integer x=0;x<i7.size();x++){Id iid=i7[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m7[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m7[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m7[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m7[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v7.Status='Final';update v7;
System.debug('Created: '+n7);

// ---- 8: Payer Medical Policy Appeal (US) ----
String n8 = 'KAM_Payer_Policy_Appeal_US_' + ts;
ActionPlanTemplate t8 = new ActionPlanTemplate(Name=n8, UniqueName=n8, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t8;
ActionPlanTemplateVersion v8 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t8.Id LIMIT 1];
List<ActionPlanTemplateItem> i8 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Review Policy Restriction Details', UniqueName='Policy_Restrict_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Compile Clinical Evidence Dossier', UniqueName='Clin_Evidence_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Submit Medical Policy Appeal', UniqueName='Policy_Appeal_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Present to Payer Medical Director', UniqueName='Payer_Med_Dir_'+ts, ActionPlanTemplateVersionId=v8.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i8;
List<List<String>> m8 = new List<List<String>>{new List<String>{'Review Policy Restriction Details','High','2'}, new List<String>{'Compile Clinical Evidence Dossier','High','7'}, new List<String>{'Submit Medical Policy Appeal','High','10'}, new List<String>{'Present to Payer Medical Director','High','14'}};
for(Integer x=0;x<i8.size();x++){Id iid=i8[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m8[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m8[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m8[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m8[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v8.Status='Final';update v8;
System.debug('Created: '+n8);

// ---- 9: Regional Tender Consortium (EU) ----
String n9 = 'KAM_Tender_Consortium_EU_' + ts;
ActionPlanTemplate t9 = new ActionPlanTemplate(Name=n9, UniqueName=n9, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t9;
ActionPlanTemplateVersion v9 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t9.Id LIMIT 1];
List<ActionPlanTemplateItem> i9 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Map Consortium Decision Structure', UniqueName='Consortium_Map_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Develop Regional Pricing Strategy', UniqueName='Regional_Pricing_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Coordinate Cross-Functional Support', UniqueName='Cross_Func_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Execute Consortium Proposal', UniqueName='Consortium_Prop_'+ts, ActionPlanTemplateVersionId=v9.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i9;
List<List<String>> m9 = new List<List<String>>{new List<String>{'Map Consortium Decision Structure','High','10'}, new List<String>{'Develop Regional Pricing Strategy','High','14'}, new List<String>{'Coordinate Cross-Functional Support','Normal','7'}, new List<String>{'Execute Consortium Proposal','High','21'}};
for(Integer x=0;x<i9.size();x++){Id iid=i9[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m9[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m9[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m9[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m9[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v9.Status='Final';update v9;
System.debug('Created: '+n9);

// ---- 10: Biosimilar Competitive Response (US) ----
String n10 = 'KAM_Biosimilar_Response_US_' + ts;
ActionPlanTemplate t10 = new ActionPlanTemplate(Name=n10, UniqueName=n10, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t10;
ActionPlanTemplateVersion v10 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t10.Id LIMIT 1];
List<ActionPlanTemplateItem> i10 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Assess Competitive Threat', UniqueName='Competitive_Threat_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Prepare Differentiation Strategy', UniqueName='Diff_Strategy_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Update Contract Terms', UniqueName='Update_Contract_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Execute Retention Campaign', UniqueName='Retention_Camp_'+ts, ActionPlanTemplateVersionId=v10.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i10;
List<List<String>> m10 = new List<List<String>>{new List<String>{'Assess Competitive Threat','High','5'}, new List<String>{'Prepare Differentiation Strategy','High','10'}, new List<String>{'Update Contract Terms','High','14'}, new List<String>{'Execute Retention Campaign','High','21'}};
for(Integer x=0;x<i10.size();x++){Id iid=i10[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m10[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m10[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m10[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m10[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v10.Status='Final';update v10;
System.debug('Created: '+n10);

System.debug('=== KEY ACCOUNT MANAGER: Templates 6-10 created ===');
