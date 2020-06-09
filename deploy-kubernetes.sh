#!/usr/bin/env bash
set -e

mkdir -p ~/.kube
cp $KUBERNETES_CONFIG ~/.kube/config

kubectl delete deploy repsy-landing --ignore-not-found=true

echo "
apiVersion: apps/v1
kind: Deployment
metadata:
  name: repsy-landing
spec:
  replicas: 1
  selector:
    matchLabels:
      app: repsy-landing
  template:
    metadata:
      labels:
        app: repsy-landing
    spec:
      containers:
        - name: repsy-landing
          image: registry.gitlab.com/fria/repsy/repsy-landing:latest
          ports:
            - containerPort: 80
      imagePullSecrets:
        - name: gitlab-auth
" | kubectl apply -f -
