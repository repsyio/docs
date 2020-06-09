#!/usr/bin/env bash
set -e

mkdir -p ~/.kube
cp $KUBERNETES_CONFIG ~/.kube/config

kubectl delete deploy repsy-docs --ignore-not-found=true

echo "
apiVersion: apps/v1
kind: Deployment
metadata:
  name: repsy-docs
spec:
  replicas: 1
  selector:
    matchLabels:
      app: repsy-docs
  template:
    metadata:
      labels:
        app: repsy-docs
    spec:
      containers:
        - name: repsy-docs
          image: registry.gitlab.com/fria/repsy/repsy-docs:latest
          ports:
            - containerPort: 80
      imagePullSecrets:
        - name: gitlab-auth
" | kubectl apply -f -
