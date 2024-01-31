# sni proxy testing container

this sni proxy is intended for use for testing applications that depend on an sni proxy to reach the public internet


to build/run
```
docker build -t jon/nginx .
docker run -p 18443:18443 jon/nginx
```

to test from localhost

```
curl -k --ipv4 -v -H "host: ibm.com" --resolve ibm.com:18443:127.0.0.1 https://ibm.com:18443/healthcheck
```


to test from cluster, after deploying sni proxy to cluster

```
k exec <pod-name> -- curl -H "host: ibm.com" --resolve ibm.com:18443:<sni-proxy-svc-ip> https://ibm.com:18443/healthcheck
```

### golang example

go [here](https://github.com/jonwoodlief/sniproxy-client-go) to see example golang code to route a request through the proxy
