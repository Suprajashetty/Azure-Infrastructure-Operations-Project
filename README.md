Introduction
------------
'Deploying a Web Server in Azure' project is part of the 'Cloud DevOps using Microsoft Azure'. Here, we create Insfrustructure as Code.
The project consists of the following:
•	Deploying a policy
•	Creating a Packer template
•	Creating a Terraform template
•	Deploying the infrastructure
•	Creating documentation in the form of a README

Instructions
------------
Deploy the policy
-----------------
Created 3 files for azure policy:
AzureTagPolicy.json - policy ensures that all indexed resources in the subscription have tags and deny deployment if they do not.
AzurepolicyParam.json – Passes the parameter tagname
AzureParamValue.json – Passes the parameter values

Create the policy definitition and assignment:

*az policy definition create --name tagging-policy --mode All --rules AzureTagPolicy.json --param AzurepolicyParam.json

*az policy assignment create --name tagging-policy --policy tagging-policy --param  AzureParamValue.json 

Create a template using packer
------------------------------
Login to azure:

*az login

Before running packer, ensure that resource group is created

Create a server.json template file for packer

Execute below command in azure CLI:

*packer build server.json

Provision resources using terraform
-----------------------------------
Download plugins:
Create main.tf and vars.tf file for provisioning resourses and execute below command in CLI

*terraform init

*terraform validate

The following settings can be customized by editing the variables in the vars.tf file:

•	prefix - The prefix which should be used for all resources in this project

•	location - The Azure Region in which all resources in this project should be created.

•	number_of_vms - Number of VMs to provision

•	username - The username for VM.

•	password - The password for VM.

Ensure that VM image to deploy should match the name of the image created by packer
Provison the resources:
To create the plan ececute below command:
 
 *terraform plan -out solution.plan

 *terraform apply solution.plan

Once your resources are no longer required, delete them:

*terraform destroy

