#!/bin/bash
# curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

export resourcegroupname=aks2310rg
export aksname=aks2310
export region=westeurope
#az aks get-versions --location $region --o table
export kubernetesversion=1.27.3
#az vm list-skus --location $region - table
export vmsize=Standard_B2ms
export admingroupid=2103f131-9cbf-4f9f-8290-0f02ad527838

az login --use-device-code
#az account list -o table
az account set --subscription <guid>

#create a resource group
az group create --name $resourcegroupname --location $region

#az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService')].{Name:name,State:properties.state}"

#create aks
az aks create --resource-group $resourcegroupname --name $aksname --node-count 2 --generate-ssh-keys --kubernetes-version $kubernetesversion --node-vm-size $vmsize --enable-aad --aad-admin-group-object-ids $admingroupid

#-monitoring
#--enable-managed-identity
#az aks update -g $resourcegroupname -n $aksname --enable-aad --aad-admin-group-object-ids $admingroupid
#az aks update -g myResourceGroup -n myAKSCluster --enable-azure-rbac


# to install kubectl and kubelogin to interact with the cluster
(sudo) az aks install-cli

az aks get-credentials --resource-group $resourcegroupname --name $aksname

kubectl version

kubectl get nodes
