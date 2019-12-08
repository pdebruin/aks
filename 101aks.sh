#!/bin/bash

export resourcegroup=aksrg201912
export region=westeurope
export aksname=aks201912
export kubernetesversion=1.14.8

#create a resource group
az group create --name $resourcegroup --location $region

#create aks
az aks create --resource-group $resourcegroup --name $aksname --node-count 2 --generate-ssh-keys --kubernetes-version $kubernetesversion --node-vm-size Standard_D2s_v3 --load-balancer-sku standard 

#--enable-addons monitoring 