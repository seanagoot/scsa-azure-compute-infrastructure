#!/bin/bash

# SCSA Company - Project 2
# Network Security Group and inbound rules

# Replace ADMIN_PUBLIC_IP with the administrator's public IPv4 address.
ADMIN_PUBLIC_IP="ADMIN_PUBLIC_IP"

az network nsg create \
  --resource-group rg-scsa-compute-krc \
  --name nsg-compute \
  --location koreacentral

az network nsg rule create \
  --resource-group rg-scsa-compute-krc \
  --nsg-name nsg-compute \
  --name Allow-SSH-MyPublicIP \
  --priority 100 \
  --direction Inbound \
  --access Allow \
  --protocol Tcp \
  --source-address-prefixes "${ADMIN_PUBLIC_IP}/32" \
  --source-port-ranges '*' \
  --destination-address-prefixes '*' \
  --destination-port-ranges 22

az network nsg rule create \
  --resource-group rg-scsa-compute-krc \
  --nsg-name nsg-compute \
  --name Allow-HTTP-Internet \
  --priority 110 \
  --direction Inbound \
  --access Allow \
  --protocol Tcp \
  --source-address-prefixes Internet \
  --source-port-ranges '*' \
  --destination-address-prefixes '*' \
  --destination-port-ranges 80

az network vnet subnet update \
  --resource-group rg-scsa-compute-krc \
  --vnet-name vnet-scsa-compute-krc \
  --name snet-compute \
  --network-security-group nsg-compute
