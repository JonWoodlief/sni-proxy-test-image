## sni proxy testing container

this sni proxy is intended for use for testing applications that depend on an sni proxy to reach the public internet


to test from localhost

```
docker build -t jon/nginx . && docker run -p 18443:18443 jon/nginx

curl -k --ipv4 -v -H "host: globalcatalog.cloud.ibm.com" --resolve globalcatalog.cloud.ibm.com:18443:127.0.0.1 https://globalcatalog.cloud.ibm.com:18443/healthcheck
```


to test from cluster, after deploying sni proxy to cluster

```
k exec <pod-name> -- curl -H "host: globalcatalog.cloud.ibm.com" --resolve globalcatalog.cloud.ibm.com:18443:<sni-proxy-svc-ip> https://globalcatalog.cloud.ibm.com:18443/healthcheck
```