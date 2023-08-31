targetScope = 'subscription'

param resourceGroup string = 'drafttesting'
param location string = deployment().location
param kubernetesVersion string = '1.27.3'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroup
  location: location
}

module aks './modules/aks.bicep' = {
  name: '${resourceGroup}-aks'
  scope: rg
  params: {
    location: location
    kubernetesVersion: kubernetesVersion
    // clusterName:
    // nodeCount:
    // vmSize: 
  }
}

output acr_login_server_url string = aks.outputs.acr_login_server_url
output acr_name string = aks.outputs.acr_name
output aks_name string = aks.outputs.aks_name
output resource_group_name string = rg.name
