# Azure Marketplace Readiness Workbook

Deploy an Azure Workbook that separates **measured Azure platform readiness** from **manual publishing, transaction, and GTM readiness**. The workbook is meant to help a product or engineering team understand what Azure can verify directly, what still has to be checked in Partner Center, and where the biggest readiness gaps are.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSnyderConsulting%2Fazure-marketplace-readiness-workbook%2Fmain%2Fazuredeploy.json)

## What it checks

- Measured platform readiness score based on Azure-visible signals
- Customer-facing product surface and public entry points such as Static Web Apps, App Service, Front Door, or API Management
- Integration and provisioning signals such as Functions, Logic Apps, and API Management
- Operational posture signals such as Application Insights, Log Analytics, storage, messaging, Key Vault, managed identity, and private access signals
- Manual publishing, transaction, and GTM checklists with direct links to Microsoft Learn

## What it does not check directly

- Microsoft Partner Center enrollment or agreement state
- Actual marketplace listing metadata or certification state
- Source code, fulfillment logic, or SaaS API correctness
- Microsoft Entra application registrations
- Tax, payout, co-sell, MACC, or private offer status

## Repo layout

- `main.bicep`: shared workbook resource definition
- `workbook.json`: workbook gallery JSON serialized into the resource
- `azuredeploy.json`: ARM template compiled from `main.bicep`
- `azuredeploy.parameters.json`: sample deployment parameters
- `scripts/build.sh`: rebuilds `azuredeploy.json`

## Deploy

1. Click the `Deploy to Azure` button.
2. Choose a subscription and resource group for the workbook resource.
3. Open `Azure Monitor > Workbooks`.
4. Open `Microsoft Marketplace Readiness Auditor`.
5. Use the `Subscriptions` and `Resource group scope` filters inside the workbook to scope the assessment.

The deployment resource group is only where Azure stores the workbook resource. It does not automatically limit the workbook queries to that resource group.

Each chart and table exposes the Azure pin action, so a user can pin the measured platform score, check distribution, or any other visual directly to an Azure Dashboard after deployment.

## Local maintenance

Rebuild the ARM template after editing the workbook or Bicep:

```bash
./scripts/build.sh
```

Validate the JSON assets locally:

```bash
python -m json.tool workbook.json >/dev/null
python -m json.tool azuredeploy.parameters.json >/dev/null
```

## Customization before publishing

- Replace the workbook CTA placeholder with your own booking link or lead form.
- Adjust the measured score weights if you want to emphasize a specific offer type.
- Expand the manual checklist sections if your workflow requires additional Partner Center checks.
- Add branding or supporting docs if you want to use the repo as a lead magnet.
