# create a namespace
kubectl create namespace emp-grafana
# apply manifest to install
kubectl apply -f grafana/grafana.yaml -n emp-grafana
# fw port to access on web browser
kubectl -n emp-grafana port-forward svc/grafana 3000:3000
