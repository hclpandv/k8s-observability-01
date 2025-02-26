import requests, json, time

loki_gw_pip = "50.85.115.190"
headers = {"Content-Type": "application/json", "X-Scope-OrgId": "foo"}

# Push log entry
requests.post(f"http://{loki_gw_pip}/loki/api/v1/push", headers=headers, json={
    "streams": [{"stream": {"job": "test"}, "values": [[f"{int(time.time())}000000000", "fizzbuzz"]]}]
})

# Query logs and pretty-print response
response = requests.get(f"http://{loki_gw_pip}/loki/api/v1/query_range", 
                        headers=headers, params={"query": '{job="test"}'})
print(json.dumps(response.json(), indent=4) if response.ok else response.text)
