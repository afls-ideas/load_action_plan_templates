# Life Sciences Action Plan Template Examples

40 pre-built Action Plan Templates across 4 Life Sciences Commercial personas, representing realistic US and EU pharma/biotech field workflows. Each script creates 5 templates and can be pasted directly into the Developer Console anonymous Apex window.

## Usage

Scripts are split into pairs of 5 templates each (for Developer Console compatibility). Run them via CLI or paste into Developer Console:

```bash
# Field Sales Rep
sf apex run --file scripts/field_sales_rep_templates_1.apex
sf apex run --file scripts/field_sales_rep_templates_2.apex

# Medical Science Liaison
sf apex run --file scripts/medical_science_liaison_templates_1.apex
sf apex run --file scripts/medical_science_liaison_templates_2.apex

# Key Account Manager
sf apex run --file scripts/key_account_manager_templates_1.apex
sf apex run --file scripts/key_account_manager_templates_2.apex

# Field Reimbursement Manager
sf apex run --file scripts/field_reimbursement_manager_templates_1.apex
sf apex run --file scripts/field_reimbursement_manager_templates_2.apex
```

---

## Field Sales Rep (FSR)

Field Sales Reps are the primary commercial interface with healthcare providers. They promote products, manage sample distribution, and coordinate with internal teams to address clinical questions.

| # | Template | Region | Tasks | Business Context |
|---|----------|--------|-------|-----------------|
| 1 | New HCP Onboarding | US | 4 | Establishing relationship with newly assigned HCP — initial meeting, sample attestation (PDMA compliance), CRM profiling, and product education |
| 2 | Product Launch Territory Rollout | EU | 5 | Launching a new product under EMA regulations — reviewing approved promotional materials, completing mandatory training certification, and scheduling detail calls |
| 3 | Quarterly Business Review Preparation | US | 3 | End-of-quarter territory performance analysis — compiling sales data, market share trends, and QBR presentation for regional leadership |
| 4 | Speaker Program Coordination | US | 4 | Organizing peer-to-peer educational events with contracted physician speakers — requires Sunshine Act compliance for HCP payments and meal reporting |
| 5 | Adverse Event Follow-up | EU | 3 | Triggered when an HCP reports a suspected adverse drug reaction — must be documented within 24 hours and reported to EudraVigilance per EU pharmacovigilance regulations |
| 6 | Formulary Win Implementation | US | 4 | After product is added to a hospital/health system formulary — driving utilization through pharmacy director engagement, prescriber education, and pull-through campaigns |
| 7 | Clinical Trial Site Recruitment | EU | 3 | Supporting medical affairs by identifying potential clinical trial investigator sites — leveraging field relationships to facilitate MSL introductions |
| 8 | Account Objection Management | US | 4 | When a key prescriber raises clinical or formulary objections — documenting concerns, coordinating MSL scientific support, and updating account strategy |
| 9 | GDPR Consent Refresh Campaign | EU | 3 | Annual or triggered refresh of HCP communication consent records to maintain GDPR compliance — expired consents must be renewed before any promotional contact |
| 10 | Territory Realignment Transition | US | 3 | Smooth handoff during territory restructuring — account documentation, joint calls with incoming rep, and sample inventory transfer |

---

## Medical Science Liaison (MSL)

MSLs are the scientific bridge between the company and the medical community. They engage KOLs, support clinical research, and ensure balanced scientific communication — all independent from commercial promotion.

| # | Template | Region | Tasks | Business Context |
|---|----------|--------|-------|-----------------|
| 1 | KOL Initial Engagement | US | 4 | First contact with a high-priority Key Opinion Leader — researching publications, scheduling scientific exchange, and assessing fit for advisory boards or speaker programs |
| 2 | Congress Medical Booth Support | EU | 4 | Major medical congress preparation — reviewing accepted abstracts, scheduling 1:1 KOL meetings at the booth, preparing scientific materials, and capturing competitive intelligence |
| 3 | Investigator-Initiated Study Request | US | 4 | When an external researcher requests company support for independent clinical research — feasibility assessment, medical affairs submission, and legal coordination |
| 4 | Clinical Data Response | EU | 4 | Responding to KOL or institutional requests for detailed clinical data — scoping the request, coordinating with medical information, and delivering a compliant scientific response |
| 5 | Advisory Board Recruitment | US | 4 | Organizing advisory boards to gather expert clinical insights — identifying KOL candidates, managing fair market value consultant contracts, and preparing pre-read materials |
| 6 | Phase III Data Dissemination | EU | 4 | After major clinical trial results are published — proactive education of KOLs through scientific exchanges to ensure balanced understanding of new efficacy/safety data |
| 7 | Treatment Guideline Update Response | US | 4 | When NCCN, AHA, or other bodies update clinical practice guidelines — analyzing changes, identifying affected institutions, and conducting targeted KOL education |
| 8 | Safety Signal Communication | EU | 4 | Proactive outreach when new safety data or label changes require prescriber notification — urgent 1-day turnaround for safety review, followed by structured communication |
| 9 | Medical Education Program | US | 4 | Creating accredited CME programs through independent education providers — needs assessment, grant submission, and content review while maintaining independence from promotion |
| 10 | Post-Marketing Study Site Monitoring | EU | 4 | Ongoing liaison support for Phase IV or real-world evidence study sites — enrollment monitoring, site question resolution, and visit documentation |

---

## Key Account Manager (KAM)

KAMs manage relationships with large institutional accounts — IDNs, hospital systems, GPOs, and payers. They negotiate contracts, drive formulary inclusion, and develop strategic account plans.

| # | Template | Region | Tasks | Business Context |
|---|----------|--------|-------|-----------------|
| 1 | IDN Formulary Submission | US | 5 | Submitting product for Integrated Delivery Network P&T Committee review — preparing economic dossiers, coordinating clinical presentations, and negotiating contract terms |
| 2 | Hospital Tender Response | EU | 4 | Responding to public hospital procurement tenders under EU public procurement directives — pricing proposals, regulatory documentation, and formal submission |
| 3 | Value-Based Contract Negotiation | US | 5 | Negotiating outcomes-based or risk-sharing agreements with large health systems — defining performance metrics, financial modeling, and legal review |
| 4 | GPO Contract Renewal | US | 4 | Renewing Group Purchasing Organization contracts to maintain member access and pricing tier status — performance analysis, rebate negotiation, and amendment execution |
| 5 | NHS Pricing Agreement | EU | 4 | Negotiating reimbursement pricing with national health authorities — HTA submission, budget impact analysis, and pricing authority presentation |
| 6 | Specialty Pharmacy Partnership | US | 4 | Establishing distribution partnerships with specialty pharmacy networks for complex therapies — SLA negotiation, hub services integration, and performance monitoring |
| 7 | Hospital Protocol Integration | EU | 4 | Working with hospital medical boards to integrate product into institutional treatment pathways — presenting clinical/economic value and coordinating MSL education |
| 8 | Payer Medical Policy Appeal | US | 4 | Responding when a major payer implements restrictive coverage policy — compiling clinical evidence, submitting formal appeal, and presenting to payer medical director |
| 9 | Regional Tender Consortium | EU | 4 | When multiple hospitals form regional purchasing consortiums — mapping decision structures, developing regional pricing strategy, and executing coordinated proposals |
| 10 | Biosimilar Competitive Response | US | 4 | Defending formulary position when biosimilar competition threatens market share — competitive assessment, differentiation strategy, contract updates, and retention campaigns |

---

## Field Reimbursement Manager (FRM)

FRMs help healthcare providers and patients navigate the complex US payer landscape and EU reimbursement systems. They support prior authorizations, appeals, patient assistance, and billing education.

| # | Template | Region | Tasks | Business Context |
|---|----------|--------|-------|-----------------|
| 1 | Prior Authorization Escalation | US | 4 | When multiple patients face PA denials — documenting denial patterns, preparing appeal letters, coordinating physician peer-to-peer reviews, and submitting medical necessity documentation |
| 2 | Patient Assistance Program Enrollment | US | 4 | Enrolling uninsured or underinsured patients in manufacturer PAP — eligibility verification, application completion, specialty pharmacy coordination, and fulfillment tracking |
| 3 | Buy-and-Bill Reimbursement Training | US | 4 | Educating physician practices on medical benefit billing for specialty products — workflow assessment, J-code/billing training, and ongoing support |
| 4 | European Market Access Support | EU | 4 | Supporting patients navigating national reimbursement systems — verifying coverage status, identifying access pathways, and coordinating named patient/compassionate use programs |
| 5 | Co-Pay Card Program Launch | US | 4 | Launching commercial co-pay assistance to reduce out-of-pocket costs — provider training, material distribution, pharmacy network setup, and utilization monitoring |
| 6 | Medicare Part D Coverage Gap | US | 3 | When beneficiaries enter the donut hole — identifying affected patients, reviewing foundation assistance options, and coordinating with prescribers on alternative coverage |
| 7 | Hospital Inpatient Coding Optimization | EU | 4 | Supporting hospitals with DRG coding and national tariff optimization for inpatient drug administration — coding review, guidance, and reimbursement impact calculation |
| 8 | Payer Policy Change Communication | US | 4 | Urgent response when a major payer implements new coverage restrictions — impact analysis, provider communication, practice webinars, and reimbursement hotline updates |
| 9 | Bridge Program Emergency Access | US | 3 | When a patient loses insurance coverage mid-therapy — verifying coverage interruption, submitting bridge program request, and expediting temporary free drug supply |
| 10 | Reimbursement Hub Integration | EU | 4 | Establishing connections between hospital pharmacies and centralized reimbursement support hubs — referral processes, pharmacy staff training, and activity monitoring |
