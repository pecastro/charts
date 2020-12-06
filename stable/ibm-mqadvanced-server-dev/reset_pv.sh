#!/usr/bin/env bash

kubectl get pvc | grep -v "^NAME" | grep -v "^efs" | awk '{ print $1 }' | xargs -r -n1 kubectl delete pvc

kubectl get pv | grep -v "^NAME" | grep -v "^efs" | awk '{ print $1 }' | xargs -r -n1 kubectl delete pv

ls pv*.yaml | xargs -r -n1 kubectl apply -f ; kubectl apply -f pvc-mqdata0.yaml -f pvc-mqdata1.yaml
