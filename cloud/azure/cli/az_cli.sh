# RG:
#   VNets, Subnets, NSG, RouteTables, StorageAccounts, Virtual Machines, Disks, Images, NICs, Public IP

# Deployments 
az deployment group create -g $RG -n deploy --template-file template.json
