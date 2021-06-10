# horizons-hello-world

This is a simple hello world application integrating the use of Ansible, Terraform, Filbeat & the ELK stack using a Python application to generate logs and pass them through ELK to be displayed. This is automated using Ansible. 

A high-level description of requirements are illustrated here:

[![hello-world-stories](https://user-images.githubusercontent.com/70889354/121533560-4f091600-c9f8-11eb-94a4-a5423579f034.png)]

## Prerequisites

1. Begin by making a copy of the `.env.local.sample.yml` file and call it `.env.local.yml`. This file is used to store the
   configuration to ElasticSearch. This file is ignored by git, so you do not commit secrets into the repo.
1. You must have the following applications installed locally:
   - Terraform
   - Ansible
1. Clone this repo locally

## To run within Cloud

1. You will need the following information:
   * Cloud ID: available from the Elastic Cloud web UI
   * Cloud auth: Credentials for logging into Elastic Cloud
1. Modify `.env.local.yml` and uncomment the second entry:
   `ES_FLAG: -E "cloud.id='<cloud_id_goes_here'>" -E "cloud.auth='<cloud_credentials_go_here>'"`
1. Enter the Cloud ID and credentials appropriately

## Run the application

```bash
cd terraform
terraform init
terraform apply
cd ../ansible
ansible-playbook playbook.yml
```

The Ansible playbook will run the generated Python file and pick up the environment variable specified if it exists, passing through validation logs if true. 
