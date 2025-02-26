# create a namespace
kubectl create namespace emp-loki
# add helm repo
helm repo add grafana https://grafana.github.io/helm-charts
# Update chart
helm repo update

# install
helm install --values loki/values.yaml loki grafana/loki --namespace emp-loki

# fw port to access on web browser
# kubectl port-forward --namespace emp-loki svc/loki-gateway 3100:80 &

# Uninstall
# helm delete loki -n emp-loki