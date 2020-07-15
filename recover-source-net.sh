#!/bin/sh -v

oc get svc my-cluster-kafka-lb -o yaml -n cdc-source | sed 's/targetPort: 9992/targetPort: 9092/' | oc apply -f - -n cdc-source
