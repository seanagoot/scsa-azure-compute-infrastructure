#!/bin/bash

# SCSA Company - Project 2
# Public IP and Network Interface

az network public-ip create \
  --resource-group rg-scsa-compute-krc \
  --name pip-scsa-app01 \
  --location koreacentral \
  --sku Standard \
  --allocation-method Static

az network nic create \
  --resource-group rg-scsa-compute-krc \
  --name nic-scsa-app01 \
  --location koreacentral \
  --vnet-name vnet-scsa-compute-krc \
  --subnet snet-compute \
  --public-ip-address pip-scsa-app01
