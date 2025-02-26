# k8s-observability-01
k8s playground

#### testing loki

```bash
# loki gateway quick curl test
loki_gw_pip="50.85.115.190"

curl -H "Content-Type: application/json" -XPOST -s "http://$loki_gw_pip/loki/api/v1/push"  \
--data-raw "{\"streams\": [{\"stream\": {\"job\": \"test\"}, \"values\": [[\"$(date +%s)000000000\", \"fizzbuzz\"]]}]}" \
-H X-Scope-OrgId:foo

curl "http://$loki_gw_pip/loki/api/v1/query_range" --data-urlencode 'query={job="test"}' -H X-Scope-OrgId:foo | jq .data.result
```

#### Add loki datasource to grafana dashboard

Go to: Grafana → Configuration → Data Sources → Loki

Set URL to: `http://50.85.115.190`. 
(⚠️ Do NOT add :3100 if your LoadBalancer already maps 80 → 3100 internally.)

Enable "Custom Headers" → Add:
Key: X-Scope-OrgId
Value: foo
Click "Save & Test" ✅

