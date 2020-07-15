#!/bin/sh -v

oc delete pod my-cluster-kafka-0 -n cdc-source --force --grace-period=0
