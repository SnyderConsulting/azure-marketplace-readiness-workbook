# Azure Marketplace Readiness Workbook

Deploy an Azure Workbook that scores Azure-visible platform signals for marketplace readiness. The workbook is meant to help a product or engineering team understand whether its current Azure footprint looks more like a viable marketplace offer, a services-led implementation, or an immature product surface.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSnyderConsulting%2Fazure-marketplace-readiness-workbook%2Fmain%2Fazuredeploy.json)

## What it checks

- Observable offer surface such as App Service, Container Apps, AKS, or managed application assets
- Presence of an endpoint or orchestration layer such as API Management, Function Apps, Logic Apps, or Container Apps
- Observability footprint via Application Insights or Log Analytics
- Security signals like Key Vault and managed identity
- Operational backbone resources like storage, Service Bus, Event Grid, SQL, or Cosmos DB

## What it does not check

- Microsoft Partner Center enrollment
- Marketplace agreements or listing state
- Source code, packaging logic, or SaaS Fulfillment API implementation
- Microsoft Entra application registrations
- Pricing plans, private offers, or publisher-side GTM assets

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
4. Open `Marketplace Readiness Auditor`.
5. Use the `Subscriptions` filter inside the workbook to scope the assessment.

Each chart and table exposes the Azure pin action, so a user can pin the score, the check distribution, or any other visual directly to an Azure Dashboard after deployment.

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
- Tighten or expand the KQL checks based on the exact marketplace motion you want to sell.
- Add branding or supporting docs if you want to use the repo as a lead magnet.
