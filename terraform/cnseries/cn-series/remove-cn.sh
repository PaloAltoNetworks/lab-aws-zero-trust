#!/bin/bash

kubectl delete -f plugin-serviceaccount.yaml
kubectl delete -f pan-cni-serviceaccount.yaml
kubectl delete -f pan-mgmt-serviceaccount.yaml
kubectl delete -f pan-cni-configmap.yaml
kubectl delete -f pan-cn-ngfw-svc.yaml
kubectl delete -f pan-cni.yaml
kubectl delete -f pan-cn-mgmt-secret.yaml
kubectl delete -f pan-cn-mgmt-configmap.yaml
kubectl delete -f pan-cn-mgmt-slot-cr.yaml
sleep 1 # This ensures the CRD is created before we create a resource of that kind
kubectl delete -f pan-cn-mgmt-slot-crd.yaml
kubectl delete -f pan-cn-mgmt.yaml
kubectl delete -f pan-cn-ngfw-configmap.yaml
kubectl delete -f pan-cn-ngfw.yaml
