// Key Account Manager — Templates 1-5
// Run via: sf apex run --file scripts/key_account_manager_templates_1.apex
String ts = String.valueOf(System.currentTimeMillis());
List<ActionPlanTemplateItemValue> vals = new List<ActionPlanTemplateItemValue>();

// ---- 1: IDN Formulary Submission (US) ----
String n1 = 'KAM_IDN_Formulary_US_' + ts;
ActionPlanTemplate t1 = new ActionPlanTemplate(Name=n1, UniqueName=n1, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t1;
ActionPlanTemplateVersion v1 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t1.Id LIMIT 1];
List<ActionPlanTemplateItem> i1 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Prepare Economic Dossier', UniqueName='Econ_Dossier_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Submit P&T Application Materials', UniqueName='PT_Application_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Coordinate Clinical Presentation', UniqueName='Clin_Pres_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Negotiate Contracting Terms', UniqueName='Contract_Terms_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4),
    new ActionPlanTemplateItem(Name='Monitor P&T Decision', UniqueName='PT_Decision_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=5)
};
insert i1;
List<List<String>> m1 = new List<List<String>>{new List<String>{'Prepare Economic Dossier','High','14'}, new List<String>{'Submit P&T Application Materials','High','7'}, new List<String>{'Coordinate Clinical Presentation','High','10'}, new List<String>{'Negotiate Contracting Terms','High','21'}, new List<String>{'Monitor P&T Decision','Normal','30'}};
for(Integer x=0;x<i1.size();x++){Id iid=i1[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m1[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m1[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m1[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m1[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v1.Status='Final';update v1;
System.debug('Created: '+n1);

// ---- 2: Hospital Tender Response (EU) ----
String n2 = 'KAM_Hospital_Tender_EU_' + ts;
ActionPlanTemplate t2 = new ActionPlanTemplate(Name=n2, UniqueName=n2, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t2;
ActionPlanTemplateVersion v2 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t2.Id LIMIT 1];
List<ActionPlanTemplateItem> i2 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Review Tender Requirements', UniqueName='Tender_Reqs_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Prepare Pricing Proposal', UniqueName='Pricing_Prop_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Compile Regulatory Documentation', UniqueName='Reg_Docs_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Submit Tender Response', UniqueName='Tender_Submit_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i2;
List<List<String>> m2 = new List<List<String>>{new List<String>{'Review Tender Requirements','High','3'}, new List<String>{'Prepare Pricing Proposal','High','7'}, new List<String>{'Compile Regulatory Documentation','High','5'}, new List<String>{'Submit Tender Response','High','10'}};
for(Integer x=0;x<i2.size();x++){Id iid=i2[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m2[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m2[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m2[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m2[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v2.Status='Final';update v2;
System.debug('Created: '+n2);

// ---- 3: Value-Based Contract Negotiation (US) ----
String n3 = 'KAM_Value_Based_Contract_US_' + ts;
ActionPlanTemplate t3 = new ActionPlanTemplate(Name=n3, UniqueName=n3, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t3;
ActionPlanTemplateVersion v3 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t3.Id LIMIT 1];
List<ActionPlanTemplateItem> i3 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Define Performance Metrics', UniqueName='Perf_Metrics_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Model Financial Scenarios', UniqueName='Fin_Scenarios_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Draft Contract Terms', UniqueName='Draft_Terms_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Obtain Legal Approval', UniqueName='Legal_Approval_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4),
    new ActionPlanTemplateItem(Name='Finalize Agreement', UniqueName='Finalize_Agmt_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=5)
};
insert i3;
List<List<String>> m3 = new List<List<String>>{new List<String>{'Define Performance Metrics','High','14'}, new List<String>{'Model Financial Scenarios','High','10'}, new List<String>{'Draft Contract Terms','High','21'}, new List<String>{'Obtain Legal Approval','High','14'}, new List<String>{'Finalize Agreement','High','7'}};
for(Integer x=0;x<i3.size();x++){Id iid=i3[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m3[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m3[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m3[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m3[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v3.Status='Final';update v3;
System.debug('Created: '+n3);

// ---- 4: GPO Contract Renewal (US) ----
String n4 = 'KAM_GPO_Contract_Renewal_US_' + ts;
ActionPlanTemplate t4 = new ActionPlanTemplate(Name=n4, UniqueName=n4, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t4;
ActionPlanTemplateVersion v4 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t4.Id LIMIT 1];
List<ActionPlanTemplateItem> i4 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Analyze Current Contract Performance', UniqueName='Analyze_Contract_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Prepare Renewal Proposal', UniqueName='Renewal_Prop_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Negotiate Pricing and Rebates', UniqueName='Negotiate_Rebates_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Execute Contract Amendment', UniqueName='Execute_Amendment_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i4;
List<List<String>> m4 = new List<List<String>>{new List<String>{'Analyze Current Contract Performance','High','10'}, new List<String>{'Prepare Renewal Proposal','High','14'}, new List<String>{'Negotiate Pricing and Rebates','High','21'}, new List<String>{'Execute Contract Amendment','High','7'}};
for(Integer x=0;x<i4.size();x++){Id iid=i4[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m4[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m4[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m4[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m4[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v4.Status='Final';update v4;
System.debug('Created: '+n4);

// ---- 5: NHS Pricing Agreement (EU) ----
String n5 = 'KAM_NHS_Pricing_EU_' + ts;
ActionPlanTemplate t5 = new ActionPlanTemplate(Name=n5, UniqueName=n5, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t5;
ActionPlanTemplateVersion v5 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t5.Id LIMIT 1];
List<ActionPlanTemplateItem> i5 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Prepare HTA Submission', UniqueName='HTA_Submit_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Conduct Budget Impact Analysis', UniqueName='Budget_Impact_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Present to Pricing Authority', UniqueName='Pricing_Auth_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Negotiate Reimbursement Rate', UniqueName='Reimb_Rate_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i5;
List<List<String>> m5 = new List<List<String>>{new List<String>{'Prepare HTA Submission','High','21'}, new List<String>{'Conduct Budget Impact Analysis','High','14'}, new List<String>{'Present to Pricing Authority','High','10'}, new List<String>{'Negotiate Reimbursement Rate','High','30'}};
for(Integer x=0;x<i5.size();x++){Id iid=i5[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m5[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m5[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m5[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m5[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v5.Status='Final';update v5;
System.debug('Created: '+n5);


System.debug('=== KEY ACCOUNT MANAGER: Templates 1-5 created ===');
