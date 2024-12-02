#!/bin/bash


helm install mimir grafana/mimir-distributed -f /home/ec2-user/LGMT/lgtm-distributed/charts/mimir-distributed/values.yaml -n mimir --create-namespace

helm install loki grafana/loki-distributed -f /home/ec2-user/LGMT/lgtm-distributed/charts/loki-distributed/main.yaml -n loki --create-namespace

helm install tempo grafana/tempo-distributed -f /home/ec2-user/LGMT/lgtm-distributed/charts/tempo-distributed/main.yaml -n tempo --create-namespace

helm install grafana grafana/grafana -f /home/ec2-user/LGMT/lgtm-distributed/charts/grafana/values.yaml

#helm install otel open-telemetry/opentelemetry-collector -f /home/ec2-user/LGMT/otel/values.yaml -n otel --create-namespace 

helm install opentelemetry-operator open-telemetry/opentelemetry-operator   --set "manager.collectorImage.repository=otel/opentelemetry-collector-contrib"   --set admissionWebhooks.certManager.enabled=false   --set admissionWebhooks.autoGenerateCert.enabled=true


# kubectl apply -f /home/ec2-user/LGMT/otel/col.yaml

# kubectl apply -f /home/ec2-user/LGMT/otel/instrumetation.yaml

# kubectl apply -f /home/ec2-user/LGMT/otel/sample.yaml
