targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the the environment which is used to generate a short unique hash used in all resources.')
param name string

@minLength(1)
@description('Location for all resources. This region must support Availability Zones.')
@allowed([
  'brazilsouth'
  'canadacentral'
  'centralus'
  'eastus'
  'eastus2'
  'southcentralus'
  'westus2'
  'westus3'
  'mexicocentral'
  'francecentral'
  'italynorth'
  'germanywestcentral'
  'norwayeast'
  'northeurope'
  'uksouth'
  'westeurope'
  'swedencentral'
  'switzerlandnorth'
  'polandcentral'
  'spaincentral'
  'qatarcentral'
  'uaenorth'
  'israelcentral'
  'southafricanorth'
  'australiaeast'
  'centralindia'
  'japaneast'
  'japanwest'
  'southeastasia'
  'eastasia'
  'koreacentral'
  'newzealandnorth'
  'usgovvirginia'
  'chinanorth3'
  'ussecwestcentral'
])
param location string

var resourceToken = toLower(uniqueString(subscription().id, name, location))
var tags = { 'azd-env-name': name }

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${name}-rg'
  location: location
  tags: tags
}

module resources 'resources.bicep' = {
  name: 'resources'
  scope: resourceGroup
  params: {
    location: location
    resourceToken: resourceToken
    tags: tags
  }
}

output AZURE_LOCATION string = location
