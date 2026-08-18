#!/bin/bash

# SCSA Company - Project 2
# Linux Virtual Machine Deployment

az vm create \
  --resource-group rg-scsa-compute-krc \
  --name vm-scsa-app01 \
  --location koreacentral \
  --size Standard_B2als_v2 \
  --image Canonical:ubuntu-24_04-lts:server:latest \
  --admin-username scsaadmin \
  --nics nic-scsa-app01 \
  --generate-ssh-keys
