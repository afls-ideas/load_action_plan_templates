// Field Sales Rep — Templates 1-5
// Run via: sf apex run --file scripts/field_sales_rep_templates_1.apex
String ts = String.valueOf(System.currentTimeMillis());
List<ActionPlanTemplateItemValue> vals = new List<ActionPlanTemplateItemValue>();

// ---- 1: New HCP Onboarding (US) ----
String n1 = 'FSR_New_HCP_Onboarding_US_' + ts;
ActionPlanTemplate t1 = new ActionPlanTemplate(Name=n1, UniqueName=n1, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t1;
ActionPlanTemplateVersion v1 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t1.Id LIMIT 1];
List<ActionPlanTemplateItem> i1 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Initial HCP Meeting', UniqueName='Initial_HCP_Mtg_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Submit Sample Attestation Form', UniqueName='Sample_Attestation_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Complete HCP Profile in CRM', UniqueName='HCP_Profile_CRM_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Schedule Product Education Session', UniqueName='Prod_Education_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i1;
List<List<String>> m1 = new List<List<String>>{new List<String>{'Initial HCP Meeting','High','7'}, new List<String>{'Submit Sample Attestation Form','High','3'}, new List<String>{'Complete HCP Profile in CRM','Normal','5'}, new List<String>{'Schedule Product Education Session','Normal','14'}};
for(Integer x=0;x<i1.size();x++){Id iid=i1[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m1[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m1[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m1[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m1[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v1.Status='Final';update v1;
System.debug('Created: '+n1);

// ---- 2: Product Launch Territory Rollout (EU) ----
String n2 = 'FSR_Product_Launch_Rollout_EU_' + ts;
ActionPlanTemplate t2 = new ActionPlanTemplate(Name=n2, UniqueName=n2, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t2;
ActionPlanTemplateVersion v2 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t2.Id LIMIT 1];
List<ActionPlanTemplateItem> i2 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Review EMA-approved Materials', UniqueName='Review_EMA_Mat_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Conduct Launch Training Certification', UniqueName='Launch_Training_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Update Target HCP List', UniqueName='Update_HCP_List_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Schedule Launch Detail Calls', UniqueName='Launch_Calls_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4),
    new ActionPlanTemplateItem(Name='Submit Launch Activity Report', UniqueName='Launch_Report_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=5)
};
insert i2;
List<List<String>> m2 = new List<List<String>>{new List<String>{'Review EMA-approved Materials','High','2'}, new List<String>{'Conduct Launch Training Certification','High','3'}, new List<String>{'Update Target HCP List','Normal','5'}, new List<String>{'Schedule Launch Detail Calls','Normal','10'}, new List<String>{'Submit Launch Activity Report','Normal','14'}};
for(Integer x=0;x<i2.size();x++){Id iid=i2[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m2[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m2[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m2[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m2[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v2.Status='Final';update v2;
System.debug('Created: '+n2);

// ---- 3: Quarterly Business Review Preparation (US) ----
String n3 = 'FSR_QBR_Preparation_US_' + ts;
ActionPlanTemplate t3 = new ActionPlanTemplate(Name=n3, UniqueName=n3, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t3;
ActionPlanTemplateVersion v3 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t3.Id LIMIT 1];
List<ActionPlanTemplateItem> i3 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Compile Territory Sales Data', UniqueName='Compile_Sales_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Analyze Market Share Trends', UniqueName='Mkt_Share_Trends_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Prepare QBR Presentation', UniqueName='QBR_Pres_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3)
};
insert i3;
List<List<String>> m3 = new List<List<String>>{new List<String>{'Compile Territory Sales Data','High','5'}, new List<String>{'Analyze Market Share Trends','Normal','7'}, new List<String>{'Prepare QBR Presentation','High','10'}};
for(Integer x=0;x<i3.size();x++){Id iid=i3[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m3[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m3[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m3[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m3[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v3.Status='Final';update v3;
System.debug('Created: '+n3);

// ---- 4: Speaker Program Coordination (US) ----
String n4 = 'FSR_Speaker_Program_US_' + ts;
ActionPlanTemplate t4 = new ActionPlanTemplate(Name=n4, UniqueName=n4, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t4;
ActionPlanTemplateVersion v4 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t4.Id LIMIT 1];
List<ActionPlanTemplateItem> i4 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Submit Speaker Program Request', UniqueName='Speaker_Req_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Confirm HCP Speaker Availability', UniqueName='Confirm_Speaker_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Send Attendee Invitations', UniqueName='Send_Invites_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Complete Post-Event Documentation', UniqueName='Post_Event_Docs_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i4;
List<List<String>> m4 = new List<List<String>>{new List<String>{'Submit Speaker Program Request','High','14'}, new List<String>{'Confirm HCP Speaker Availability','High','7'}, new List<String>{'Send Attendee Invitations','Normal','10'}, new List<String>{'Complete Post-Event Documentation','High','2'}};
for(Integer x=0;x<i4.size();x++){Id iid=i4[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m4[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m4[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m4[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m4[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v4.Status='Final';update v4;
System.debug('Created: '+n4);

// ---- 5: Adverse Event Follow-up (EU) ----
String n5 = 'FSR_Adverse_Event_Followup_EU_' + ts;
ActionPlanTemplate t5 = new ActionPlanTemplate(Name=n5, UniqueName=n5, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t5;
ActionPlanTemplateVersion v5 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t5.Id LIMIT 1];
List<ActionPlanTemplateItem> i5 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Document AE in Safety System', UniqueName='Doc_AE_Safety_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Notify Medical Information Team', UniqueName='Notify_Med_Info_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Complete EudraVigilance Reporting', UniqueName='EudraVigilance_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3)
};
insert i5;
List<List<String>> m5 = new List<List<String>>{new List<String>{'Document AE in Safety System','High','1'}, new List<String>{'Notify Medical Information Team','High','1'}, new List<String>{'Complete EudraVigilance Reporting','High','2'}};
for(Integer x=0;x<i5.size();x++){Id iid=i5[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m5[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m5[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m5[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m5[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v5.Status='Final';update v5;
System.debug('Created: '+n5);


System.debug('=== FIELD SALES REP: Templates 1-5 created ===');
