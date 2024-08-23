# delete old cluster
# minikube delete

# create new cluster
minikube start
sleep 5

# cert manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.15.3/cert-manager.yaml
sleep 5

# install nginx ingress
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update 
# install w/ otel
helm install -f nginx-controller.yaml ingress-nginx ingress-nginx/ingress-nginx
# config otel
kubectl apply -f nginx-config.yaml
sleep 5

# install otel operator
kubectl apply -f https://github.com/open-telemetry/opentelemetry-operator/releases/latest/download/opentelemetry-operator.yaml
sleep 5
# config otel operator
kubectl apply -f otel.yaml
sleep 10

# install app
kubectl apply -f app.yaml

########
# TESTING
# minikube tunnel

# curl -v --resolve "ratings.example:80:127.0.0.1" -i http://ratings.example/ratings/1
# k logs otel-collector...
