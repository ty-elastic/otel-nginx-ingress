# otel-nginx-ingress

A simple example of otel distributed tracing through nginx-ingress and into a node.js microservice.

# Docs

* follow commands in [deploy.sh](deploy.sh)

# Notes

* you should match the nginx ingress controller verison installed to that of your k8s cluster
* modify [app.yaml](app.yaml):Ingress CRD accordingly (specifically, `host`)
* modify [otel.yaml](otel.yaml) to:
    * output to your Elastic cluster (set `${ELASTIC_APM_SERVER_ENDPOINT}` and `${ELASTIC_APM_SECRET_TOKEN}`)
    * comment out `exporters: [debug]`
    * uncomment `#exporters: [debug, otlphttp/elastic]`
* test by issuing a `curl` against `http://ratings.example/ratings/1` where `ratings.example` is the hostname assigned to the `Ingress` in [app.yaml](app.yaml)
