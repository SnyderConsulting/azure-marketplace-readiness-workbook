targetScope = 'resourceGroup'

@sys.description('Optional. Display name for the workbook.')
param displayName string = 'Microsoft Marketplace Readiness Auditor'

@sys.description('Optional. Location for the workbook resource.')
param location string = resourceGroup().location

@sys.description('Optional. Workbook description.')
param workbookDescription string = 'Assesses measured Azure platform readiness and manual marketplace readiness checklists.'

@sys.description('Optional. Tags to apply to the workbook resource.')
param tags object = {
  solution: 'azure-marketplace-readiness'
}

var version = ''
var workbookJson = string(loadJsonContent('workbook.json'))

resource workbook 'Microsoft.Insights/workbooks@2022-04-01' = {
  name: guid(resourceGroup().id, 'Microsoft.Insights/workbooks', displayName)
  location: location
  kind: 'shared'
  tags: tags
  properties: {
    category: 'workbook'
    description: workbookDescription
    displayName: displayName
    serializedData: workbookJson
    sourceId: 'Azure Monitor'
    version: version
  }
}

output workbookId string = workbook.id
output workbookUrl string = '${environment().portal}/#view/AppInsightsExtension/UsageNotebookBlade/ComponentId/Azure%20Monitor/ConfigurationId/${uriComponent(workbook.id)}/Type/${workbook.properties.category}/WorkbookTemplateName/${uriComponent(workbook.properties.displayName)}'
