#!/bin/bash

# SCSA Company - Project 2
# Virtual Network and Compute Subnet

az network vnet create \
  --resource-group rg-scsa-compute-krc \
  --name vnet-scsa-compute-krc \
  --location koreacentral \
  --address-prefixes 10.20.0.0/16 \
  --subnet-name snet-compute \
  --subnet-prefixes 10.20.1.0/24
