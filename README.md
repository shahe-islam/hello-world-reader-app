# horizons-hello-world

This application is a demonstration of using Terraform, Ansible, Filebeat, ElasticSearch, and Kibana. It uses a simple Python app as a base application that is deployed, and it's logs shipped to the Cloud.

A high-level description of requirements are illustrated here:

![requirements](./hello-world-stories.png)

This project is comprised of several Dockerfiles in order to accomplish this task with minimal installation of tools.

* /Dockerfile
  * This wraps up the hello-world python application
* /infrastructure/ansible/Dockerfile
  * Provides an image for running Ansible in
* /infrastructure/filebeat/Dockerfile
  * Extends the official Filebeat image by copying in the config file. This was done because I couldn't get volumes mounting correctly for this container when spun up via Ansible.

## Prerequisites

1. Begin by making a copy of the `.env.local.sample.yml` file and call it `.env.local.yml`. This file is used to store the
   configuration to ElasticSearch. This file is ignored by git, so you do not commit secrets into the repo.
1. You must have the following applications installed locally:
   - Docker
   - Terraform
1. Clone this repo locally

## To run with a local Elastic Stack

There is a docker-compose file that allows for testing the application locally.

1. Run the following command:
   `docker-compose -f ./infrastructure/docker-compose.yml up -d`
1. Modify `.env.local.yml` and uncomment the first entry as follows:
   `ES_FLAG: -E output.elasticsearch.hosts=['es01:9200']`
1. You can access the Kibana Dashboard here: http://localhost:5601

## To run within Cloud

1. You will need the following information:
   * Cloud ID: available from the Elastic Cloud web UI
   * Cloud auth: Credentials for logging into Elastic Cloud
1. Modify `.env.local.yml` and uncomment the second entry:
   `ES_FLAG: -E "cloud.id='<cloud_id_goes_here'>" -E "cloud.auth='<cloud_credentials_go_here>'"`
1. Enter the Cloud ID and credentials appropriately

## Run the application

```bash
cd infrastructure/terraform
terraform init
terraform apply
```

If you want to run the application again without changing any settings, you can just run `terraform apply` again

If you want to change the message that is printed:
1. Modify `infrastructure/ansible/vars/env.yml` to set the message you want to print
1. Run the following commands
   ```bash
   docker stop filebeats
   docker container prune -f
   terraform apply
   ```

If you want to modify something within Ansible:
1. Modify `infrastructure/ansible/playbook.yml`
1. Run the following commands
   ```bash
   docker stop filebeats
   docker container prune -f
   terraform destroy
   terraform apply
   ```
