#!/bin/sh
export ETCDCTL_CERT_FILE="/etc/etcd/kubernetes.pem"
export ETCDCTL_KEY_FILE="/etc/etcd/kubernetes-key.pem"
export ETCDCTL_CA_FILE="/etc/etcd/ca.pem"
export ETCDCTL_ENDPOINTS="https://127.0.0.1:2379"
