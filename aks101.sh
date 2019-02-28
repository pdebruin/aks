# https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/aks/kubernetes-walkthrough.md

#az account list
#az account set --subscription

az group create --name rgaks --location westeurope

az aks create --resource-group rgaks --name myAKSCluster --node-count 1 --enable-addons monitoring --generate-ssh-keys --kubernetes-version 1.12.5 --node-vm-size Standard_D2s_v3

#To install kubectl 
#az aks install-cli

az aks get-credentials --resource-group rgaks --name myAKSCluster
#az aks get-credentials -g=resourcegroupname -n=clustername -f=- >kube.config

kubectl get nodes

az aks browse --resource-group rgaks --name myAKSCluster #--listen-port 8002
#kubectl proxy --port 8002
#api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/

## https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/aks/kubernetes-helm.md
kubectl apply -f helm-rbac.yaml

helm init --service-account tiller

helm search

helm repo update

## https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/aks/istio-install.md

ISTIO_VERSION=1.0.4
curl -sL "https://github.com/istio/istio/releases/download/$ISTIO_VERSION/istio-$ISTIO_VERSION-linux.tar.gz" | tar xz
cd istio-$ISTIO_VERSION
chmod +x ./bin/istioctl
sudo mv ./bin/istioctl /usr/local/bin/istioctl

helm install install/kubernetes/helm/istio --name istio --namespace istio-system \
  --set global.controlPlaneSecurityEnabled=true \
  --set grafana.enabled=true \
  --set tracing.enabled=true \
  --set kiali.enabled=true