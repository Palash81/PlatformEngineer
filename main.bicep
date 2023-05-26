param location string = 'swedencentral'
param rgName string = 'welcome2022'
param vnetName string = 'welcomeVirtualNetwork'
param vnetAddressPrefix string = '10.0.0.0/16'
param subnetName string = 'wwelcomesubnet'
param subnetAddressPrefix string = '10.0.0.0/24'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
  }
  resourceGroup: rg
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: subnetName
  properties: {
    addressPrefix: subnetAddressPrefix
  }
  parent: vnet
}
