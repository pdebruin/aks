# https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/aks/kubernetes-walkthrough.md

#az account list
#az account set --subscription

az group create --name aksrg201907 --location westeurope

az aks create --resource-group aksrg201907 --name aks201907 --node-count 1 --enable-addons monitoring --generate-ssh-keys --kubernetes-version 1.14.0 --node-vm-size Standard_D2s_v3 --load-balancer-sku standard 

#--enable-managed-identity


az aks get-credentials --resource-group rgaks --name myAKSCluster
#az aks get-credentials -g=resourcegroupname -n=clustername -f=- >kube.config

#az aks install-cli
kubectl get nodes

az aks browse --resource-group rgaks --name myAKSCluster #--listen-port 8002
#kubectl proxy --port 8002
#api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/

# or hpa
az aks scale --resource-group akwrg --name myaks --node-count 4

az vm list-skus --location westeurope

az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService')].{Name:name,State:properties.state}"

#configure features signing egress 
