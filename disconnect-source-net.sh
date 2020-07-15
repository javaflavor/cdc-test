#!/bin/sh -v

oc get svc my-cluster-kafka-lb -o yaml -n cdc-source | sed 's/targetPort: 9092/targetPort: 9992/' | oc apply -f - -n cdc-source
