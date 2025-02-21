# create a namespace
kubectl create namespace emp-loki
# add helm repo
helm repo add grafana https://grafana.github.io/helm-charts
# Update chart
helm repo update

# install
helm install --values loki/values.yaml loki grafana/loki --namespace emp-loki

# Uninstall
# helm delete loki