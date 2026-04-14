// Field Reimbursement Manager — Templates 1-5
// Run via: sf apex run --file scripts/field_reimbursement_manager_templates_1.apex
String ts = String.valueOf(System.currentTimeMillis());
List<ActionPlanTemplateItemValue> vals = new List<ActionPlanTemplateItemValue>();

// ---- 1: Prior Authorization Escalation (US) ----
String n1 = 'FRM_Prior_Auth_Escalation_US_' + ts;
ActionPlanTemplate t1 = new ActionPlanTemplate(Name=n1, UniqueName=n1, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t1;
ActionPlanTemplateVersion v1 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t1.Id LIMIT 1];
List<ActionPlanTemplateItem> i1 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Document Denial Patterns', UniqueName='Denial_Patterns_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Prepare Clinical Appeal Letters', UniqueName='Appeal_Letters_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Coordinate Physician Peer-to-Peer', UniqueName='Peer_to_Peer_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Submit Medical Necessity Docs', UniqueName='Med_Necessity_'+ts, ActionPlanTemplateVersionId=v1.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=4)
};
insert i1;
List<List<String>> m1 = new List<List<String>>{new List<String>{'Document Denial Patterns','High','3'}, new List<String>{'Prepare Clinical Appeal Letters','High','5'}, new List<String>{'Coordinate Physician Peer-to-Peer','High','7'}, new List<String>{'Submit Medical Necessity Docs','High','2'}};
for(Integer x=0;x<i1.size();x++){Id iid=i1[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m1[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m1[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m1[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m1[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v1.Status='Final';update v1;
System.debug('Created: '+n1);

// ---- 2: Patient Assistance Program Enrollment (US) ----
String n2 = 'FRM_PAP_Enrollment_US_' + ts;
ActionPlanTemplate t2 = new ActionPlanTemplate(Name=n2, UniqueName=n2, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t2;
ActionPlanTemplateVersion v2 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t2.Id LIMIT 1];
List<ActionPlanTemplateItem> i2 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Verify Patient Eligibility', UniqueName='Verify_Elig_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Complete PAP Application', UniqueName='PAP_App_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Coordinate with Specialty Pharmacy', UniqueName='SP_Coord_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Track Approval and Fulfillment', UniqueName='Track_Fulfill_'+ts, ActionPlanTemplateVersionId=v2.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i2;
List<List<String>> m2 = new List<List<String>>{new List<String>{'Verify Patient Eligibility','High','2'}, new List<String>{'Complete PAP Application','High','3'}, new List<String>{'Coordinate with Specialty Pharmacy','Normal','5'}, new List<String>{'Track Approval and Fulfillment','Normal','7'}};
for(Integer x=0;x<i2.size();x++){Id iid=i2[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m2[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m2[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m2[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m2[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v2.Status='Final';update v2;
System.debug('Created: '+n2);

// ---- 3: Buy-and-Bill Reimbursement Training (US) ----
String n3 = 'FRM_Buy_Bill_Training_US_' + ts;
ActionPlanTemplate t3 = new ActionPlanTemplate(Name=n3, UniqueName=n3, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t3;
ActionPlanTemplateVersion v3 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t3.Id LIMIT 1];
List<ActionPlanTemplateItem> i3 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Assess Practice Billing Workflow', UniqueName='Billing_Workflow_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Conduct Coding and Billing Training', UniqueName='Coding_Training_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Provide Reimbursement Resources', UniqueName='Reimb_Resources_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Schedule Follow-up Support Call', UniqueName='Followup_Support_'+ts, ActionPlanTemplateVersionId=v3.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i3;
List<List<String>> m3 = new List<List<String>>{new List<String>{'Assess Practice Billing Workflow','Normal','5'}, new List<String>{'Conduct Coding and Billing Training','High','7'}, new List<String>{'Provide Reimbursement Resources','Normal','3'}, new List<String>{'Schedule Follow-up Support Call','Low','14'}};
for(Integer x=0;x<i3.size();x++){Id iid=i3[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m3[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m3[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m3[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m3[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v3.Status='Final';update v3;
System.debug('Created: '+n3);

// ---- 4: European Market Access Support (EU) ----
String n4 = 'FRM_EU_Market_Access_EU_' + ts;
ActionPlanTemplate t4 = new ActionPlanTemplate(Name=n4, UniqueName=n4, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t4;
ActionPlanTemplateVersion v4 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t4.Id LIMIT 1];
List<ActionPlanTemplateItem> i4 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Verify National Coverage Status', UniqueName='Natl_Coverage_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Identify Patient Access Pathways', UniqueName='Access_Pathways_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Coordinate Named Patient Program', UniqueName='Named_Patient_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Track Reimbursement Approval', UniqueName='Track_Reimb_'+ts, ActionPlanTemplateVersionId=v4.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i4;
List<List<String>> m4 = new List<List<String>>{new List<String>{'Verify National Coverage Status','High','3'}, new List<String>{'Identify Patient Access Pathways','High','5'}, new List<String>{'Coordinate Named Patient Program','Normal','10'}, new List<String>{'Track Reimbursement Approval','Normal','14'}};
for(Integer x=0;x<i4.size();x++){Id iid=i4[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m4[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m4[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m4[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m4[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v4.Status='Final';update v4;
System.debug('Created: '+n4);

// ---- 5: Co-Pay Card Program Launch (US) ----
String n5 = 'FRM_CoPay_Card_Launch_US_' + ts;
ActionPlanTemplate t5 = new ActionPlanTemplate(Name=n5, UniqueName=n5, ActionPlanType='Industries', TargetEntityType='Account', IsAdHocItemCreationEnabled=false);
insert t5;
ActionPlanTemplateVersion v5 = [SELECT Id FROM ActionPlanTemplateVersion WHERE ActionPlanTemplateId=:t5.Id LIMIT 1];
List<ActionPlanTemplateItem> i5 = new List<ActionPlanTemplateItem>{
    new ActionPlanTemplateItem(Name='Train Providers on Eligibility', UniqueName='Train_Providers_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=1),
    new ActionPlanTemplateItem(Name='Distribute Co-Pay Card Materials', UniqueName='CoPay_Materials_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=true, IsActive=true, DisplayOrder=2),
    new ActionPlanTemplateItem(Name='Set Up Pharmacy Network Comms', UniqueName='Pharmacy_Comms_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=3),
    new ActionPlanTemplateItem(Name='Monitor Program Utilization', UniqueName='Monitor_Util_'+ts, ActionPlanTemplateVersionId=v5.Id, ItemEntityType='Task', IsRequired=false, IsActive=true, DisplayOrder=4)
};
insert i5;
List<List<String>> m5 = new List<List<String>>{new List<String>{'Train Providers on Eligibility','High','5'}, new List<String>{'Distribute Co-Pay Card Materials','High','7'}, new List<String>{'Set Up Pharmacy Network Comms','Normal','10'}, new List<String>{'Monitor Program Utilization','Low','14'}};
for(Integer x=0;x<i5.size();x++){Id iid=i5[x].Id;vals.add(new ActionPlanTemplateItemValue(Name='Subject',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Subject',ValueLiteral=m5[x][0],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='Priority',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.Priority',ValueLiteral=m5[x][1],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ActivityDate',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ActivityDate',ValueFormula='StartDate + '+m5[x][2],IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='IsReminderSet',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.IsReminderSet',ValueLiteral='false',IsActive=true));vals.add(new ActionPlanTemplateItemValue(Name='ReminderDateTime',ActionPlanTemplateItemId=iid,ItemEntityFieldName='Task.ReminderDateTime',ValueFormula='StartDate + '+m5[x][2]+' - 0 +',IsActive=true));}
insert vals;vals.clear();v5.Status='Final';update v5;
System.debug('Created: '+n5);


System.debug('=== FIELD REIMBURSEMENT MANAGER: Templates 1-5 created ===');
