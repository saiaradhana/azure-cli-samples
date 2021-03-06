#!/bin/bash

# Set variables for the new Cassandra API account, database, and table
resourceGroupName='myResourceGroup'
location='southcentralus'
accountName='myaccountname' #needs to be lower case
keysetName='myKeysetName'


# Create a resource group
az group create \
    --name $resourceGroupName \
    --location $location


# Create a Cassandra API Cosmos DB account with consistent prefix (LOCAL_ONE) consistency and multi-master enabled
az cosmosdb create \
    --resource-group $resourceGroupName \
    --name $accountName \
    --capabilities EnableCassandra \
    --locations "South Central US"=0 "North Central US"=1 \
    --default-consistency-level "ConsistentPrefix" \
    --enable-multiple-write-locations true


# Create a database
az cosmosdb database create \
    --resource-group $resourceGroupName \
    --name $accountName \
    --db-name $keysetName
