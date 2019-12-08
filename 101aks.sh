EXPORT $resouregroup = "aksrg201912"

#create a resource group
az group create --name $resourcegroup --location westeurope

#az aks create --resource-group aksrg201907 --name aks201907 --node-count 1 --enable-addons monitoring --generate-ssh-keys --kubernetes-version 1.14.0 --node-vm-size Standard_D2s_v3 --load-balancer-sku standard 
