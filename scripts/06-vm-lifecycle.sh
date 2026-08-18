#!/bin/bash

# SCSA Company - Project 2
# VM Lifecycle Operations

# Show current VM status
az vm get-instance-view \
  --resource-group rg-scsa-compute-krc \
  --name vm-scsa-app01 \
  --query "{VM:name,PowerState:instanceView.statuses[1].displayStatus}" \
  --output table

# Deallocate the VM to stop compute charges
az vm deallocate \
  --resource-group rg-scsa-compute-krc \
  --name vm-scsa-app01

# Start the VM again
az vm start \
  --resource-group rg-scsa-compute-krc \
  --name vm-scsa-app01
