#!/bin/bash

doctl kubernetes cluster kubeconfig save do-kubernetes-challenge
kubectl apply -f namespace.yml
kubectl apply -f elastic_svc.yml
kubectl apply -f elastic_statefulset.yml
kubectl apply -f fluentd.yml
kubectl apply -f kibana.yml
