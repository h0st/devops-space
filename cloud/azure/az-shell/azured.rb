#!/usr/bin/env ruby

RG="ResourceGroup"
VMNAME="testvm"

provider = MsRestAzure::ApplicationTokenProvider.new(
       'YOUR TENANT ID',
       'YOUR CLIENT ID',
       'YOUR CLIENT SECRET')
credentials = MsRest::TokenCredentials.new(provider)

options = {
    tenant_id: ENV['AZURE_TENANT_ID'],
    client_id: ENV['AZURE_CLIENT_ID'],
    client_secret: ENV['AZURE_CLIENT_SECRET'],
    subscription_id: ENV['AZURE_SUBSCRIPTION_ID']
    credentials: credentials
}


# Target profile built for Latest Compute
profile_client = Azure::Compute::Profiles::Latest::Mgmt::Client.new(options)

# To access the operations associated with Compute
profile_client.virtual_machines.get 'RESOURCE_GROUP_NAME', 'VIRTUAL_MACHINE_NAME'

# Option 1: To access the models associated with Compute
purchase_plan_obj = profile_client.model_classes.purchase_plan.new

# Option 2: To access the models associated with Compute
# Notice Namespace: Azure::<Service Name>::Profiles::<Profile Name>::Mgmt::Models::<Model Name>
purchase_plan_obj = Azure::Compute::Profiles::Latest::Mgmt::Models::PurchasePlan.new