// Medical Science Liaison — Templates 1-5
// Run via: sf apex run --file scripts/medical_science_liaison_templates_1.apex
String ts = String.valueOf(System.currentTimeMillis());
List<ActionPlanTemplateItemValue> vals = new List<ActionPlanTemplateItemValue>();

// ---- 1: KOL Initial Engagement (US) ----
String n1 = 'MSL_KOL_Initial_Engagement_US_' + ts;
ActionPlanTemplate t1 = new ActionPlanTemplate(Name=n1, UniqueName=n1, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t1;
ActionPlanTemplateVersion v1 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t1.Id LIMIT 1];
List<ActionPlanTemplateItem> i1 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Research KOL Publications', UniqueName='KOL_Pubs_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Schedule Scientific Exchange', UniqueName='Sci_Exchange_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Complete KOL Interaction Report', UniqueName='KOL_Report_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Assess Advisory Board Fit', UniqueName='Assess_AdBoard_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i1;
List<List<String>> m1 = new List<List<String>>{new List<String>{'Research KOL Publications','High','5'}, new List<String>{'Schedule Scientific Exchange','High','10'}, new List<String>{'Complete KOL Interaction Report','High','2'}, new List<String>{'Assess Advisory Board Fit','Normal','7'}};
for(Integer x=0;x<i1.size();x++){Id iid=i1[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m1[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m1[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m1[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m1[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v1.Status='Final';update v1;
System.debug('Created: '+n1);

// ---- 2: Congress Medical Booth Support (EU) ----
String n2 = 'MSL_Congress_Booth_EU_' + ts;
ActionPlanTemplate t2 = new ActionPlanTemplate(Name=n2, UniqueName=n2, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t2;
ActionPlanTemplateVersion v2 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t2.Id LIMIT 1];
List<ActionPlanTemplateItem> i2 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Review Congress Abstracts', UniqueName='Congress_Abs_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Schedule KOL Meetings', UniqueName='KOL_Mtgs_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Prepare Scientific Discussion Materials', UniqueName='Sci_Materials_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Submit Post-Congress Insights Report', UniqueName='Congress_Report_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i2;
List<List<String>> m2 = new List<List<String>>{new List<String>{'Review Congress Abstracts','High','7'}, new List<String>{'Schedule KOL Meetings','High','10'}, new List<String>{'Prepare Scientific Discussion Materials','High','5'}, new List<String>{'Submit Post-Congress Insights Report','High','3'}};
for(Integer x=0;x<i2.size();x++){Id iid=i2[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m2[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m2[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m2[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m2[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v2.Status='Final';update v2;
System.debug('Created: '+n2);

// ---- 3: Investigator-Initiated Study Request (US) ----
String n3 = 'MSL_IIS_Request_US_' + ts;
ActionPlanTemplate t3 = new ActionPlanTemplate(Name=n3, UniqueName=n3, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t3;
ActionPlanTemplateVersion v3 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t3.Id LIMIT 1];
List<ActionPlanTemplateItem> i3 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Conduct Feasibility Assessment', UniqueName='Feasibility_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Submit IIS Request to Med Affairs', UniqueName='IIS_Submit_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Facilitate Legal Review', UniqueName='Legal_Review_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Track Study Approval Status', UniqueName='Track_Approval_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i3;
List<List<String>> m3 = new List<List<String>>{new List<String>{'Conduct Feasibility Assessment','High','7'}, new List<String>{'Submit IIS Request to Med Affairs','High','5'}, new List<String>{'Facilitate Legal Review','Normal','14'}, new List<String>{'Track Study Approval Status','Low','21'}};
for(Integer x=0;x<i3.size();x++){Id iid=i3[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m3[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m3[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m3[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m3[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v3.Status='Final';update v3;
System.debug('Created: '+n3);

// ---- 4: Clinical Data Response (EU) ----
String n4 = 'MSL_Clinical_Data_Response_EU_' + ts;
ActionPlanTemplate t4 = new ActionPlanTemplate(Name=n4, UniqueName=n4, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t4;
ActionPlanTemplateVersion v4 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t4.Id LIMIT 1];
List<ActionPlanTemplateItem> i4 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Clarify Information Request Scope', UniqueName='Clarify_Scope_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Coordinate with Medical Information', UniqueName='Coord_Med_Info_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Prepare Scientific Response', UniqueName='Sci_Response_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Deliver and Document Response', UniqueName='Deliver_Response_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i4;
List<List<String>> m4 = new List<List<String>>{new List<String>{'Clarify Information Request Scope','High','2'}, new List<String>{'Coordinate with Medical Information','High','5'}, new List<String>{'Prepare Scientific Response','High','7'}, new List<String>{'Deliver and Document Response','Normal','3'}};
for(Integer x=0;x<i4.size();x++){Id iid=i4[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m4[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m4[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m4[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m4[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v4.Status='Final';update v4;
System.debug('Created: '+n4);

// ---- 5: Advisory Board Recruitment (US) ----
String n5 = 'MSL_Advisory_Board_US_' + ts;
ActionPlanTemplate t5 = new ActionPlanTemplate(Name=n5, UniqueName=n5, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t5;
ActionPlanTemplateVersion v5 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t5.Id LIMIT 1];
List<ActionPlanTemplateItem> i5 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Identify and Prioritize KOL Candidates', UniqueName='ID_KOL_Cand_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Submit Consultant Contracts', UniqueName='Consultant_Contracts_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Coordinate Meeting Logistics', UniqueName='Mtg_Logistics_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Prepare Advisory Board Materials', UniqueName='AdBoard_Mats_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i5;
List<List<String>> m5 = new List<List<String>>{new List<String>{'Identify and Prioritize KOL Candidates','High','10'}, new List<String>{'Submit Consultant Contracts','High','7'}, new List<String>{'Coordinate Meeting Logistics','Normal','14'}, new List<String>{'Prepare Advisory Board Materials','High','5'}};
for(Integer x=0;x<i5.size();x++){Id iid=i5[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m5[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m5[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m5[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m5[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v5.Status='Final';update v5;
System.debug('Created: '+n5);


System.debug('=== MEDICAL SCIENCE LIAISON: Templates 1-5 created ===');
