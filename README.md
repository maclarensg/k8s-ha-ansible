kubernetes playbook usage
=========================
 
## Overview

### Deploy tags and Phases

There are 6 phases of deployment:

  | Phase                  | Tag              |
  |------------------------|------------------|
  |1. Presetup             | presetup         | 
  |2. Firewall             | firewall         |
  |3. Base Installation    | installbase      |
  |4. Etcd cluster setup   | etcd             |
  |5. Bootstrap Masters    | bootstrapmasters |
  |6. Bootstrap Workers    | bootstrapworkers |
  
#### Presetup
 - Install necessary packages
 - Setup NTP *(This is important for etcd to be time sync)*
 - For Centos, ensure firewalld is enabled and used

#### Firewall
 - Open ports on firewalld 

#### Base Install
 - Install docker, kubernetes packages *(kubeadm, kubelet, kubectl)*

#### Etcd cluster setup 
 - Setup ETCD cluster

#### Bootstrap Masters  
 - kubeadm init on all masters
 - apply fannel networking

#### Bootstrap Workers
 - kubeadm join on all workers

### Playbooks

#### playbook-setup-kubernetes.yml
- Deploys Kubernetes cluster

#### playbook-setup-kubernetes.yml
- Cleanup Kubernetes cluster
  - uninstall packages like docker, kubernetes
  - purge data directories
  - remove network interfaces residue

*This will wipe all entire cluster*

 
## Deployment 
  
### Deploy all from scratch
  `ansible-playbook -i inventory/k8s-kddi.yml playbook-setup-kubernetes.yml` 
 
### Deploy only masters
  `ansible-playbook -i inventory/k8s-kddi.yml < optional: -l kube-master > playbook-setup-kubernetes.yml  -t presetup,firewall,installbase,etcd,bootstrapmasters`   
 
### Deploy only masters
  `ansible-playbook -i inventory/k8s-kddi.yml < optional: -l kube-worker > playbook-setup-kubernetes.yml  -t presetup,firewall,installbase,bootstrapworkers`
