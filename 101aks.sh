#!/bin/bash

export region=westeurope
export resourcegroupname=aksrg2009
export aksname=aks2009
#az aks get-versions --location $region --output table
export kubernetesversion=1.17.9
#az vm list-skus --location $region
export vmsize=Standard_B2ms

#create a resource group
az group create --name $resourcegroupname --location $region

#create aks
az aks create --resource-group $resourcegroupname --name $aksname --node-count 2 --generate-ssh-keys --kubernetes-version $kubernetesversion --node-vm-size $vmsize 

#az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService')].{Name:name,State:properties.state}"
