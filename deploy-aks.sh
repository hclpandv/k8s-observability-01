export RANDOM_ID="$(openssl rand -hex 3)"
export MY_RESOURCE_GROUP_NAME="rg-module-test-01"
export REGION="westeurope"
export MY_AKS_CLUSTER_NAME="vikicluster$RANDOM_ID"
export MY_DNS_LABEL="viki$RANDOM_ID"

# rg
az group create --name $MY_RESOURCE_GROUP_NAME --location $REGION
az aks create \
    --resource-group $MY_RESOURCE_GROUP_NAME \
    --name $MY_AKS_CLUSTER_NAME \
    --node-count 1 \
    --generate-ssh-keys

az aks get-credentials --resource-group $MY_RESOURCE_GROUP_NAME --name $MY_AKS_CLUSTER_NAME
