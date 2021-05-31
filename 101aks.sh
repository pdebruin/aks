#!/bin/bash

export resourcegroupname=aks2106rg
export aksname=aks2106
export region=westeurope
#az aks get-versions --location $region --output table
export kubernetesversion=1.20.5
#az vm list-skus --location $region
export vmsize=Standard_B2ms

#create a resource group
az group create --name $resourcegroupname --location $region

#az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService')].{Name:name,State:properties.state}"

#create aks
az aks create --resource-group $resourcegroupname --name $aksname --node-count 2 --generate-ssh-keys --kubernetes-version $kubernetesversion --node-vm-size $vmsize
