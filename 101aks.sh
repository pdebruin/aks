#!/bin/bash

export resourcegroupname=aksrg202001
export region=westeurope
export aksname=aks202001
export kubernetesversion=1.15.5

#create a resource group
az group create --name $resourcegroupname --location $region

#create aks
#az aks create --resource-group $resourcegroupname --name $aksname --node-count 2 --generate-ssh-keys --kubernetes-version $kubernetesversion --node-vm-size Standard_B2ms --enable-addons monitoring,azure-policy

az aks create --resource-group $resourcegroupname --name $aksname --node-count 3 --generate-ssh-keys --kubernetes-version $kubernetesversion --node-vm-size Standard_B2ms --enable-addons monitoring,azure-policy --zones 3

#virtual-node,
#SLB V
#VMSS V
#MNP V
#monitoring? 
#Policies?