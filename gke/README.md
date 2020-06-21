# Learn Terraform - Provision a GKE Cluster

## Terraform configuration files to provision an GKE cluster on GCP.

IT creates a VPC and subnet for the GKE cluster. Every variable is hardcoded here this module is not generalised.

## Install and configure GCloud

```shell
$ gcloud init
```

```shell
$ gcloud auth application-default login
```

## Initialize Terraform workspace and provision GKE Cluster

Replace `terraform.tfvars` values with your `project_id` and `region`. Your 
`project_id` must match the project you've initialized gcloud with. 

After you've done this, initalize your Terraform workspace, which will download 
the provider and initialize it with the values provided in the `terraform.tfvars` file.

```shell
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "google" (hashicorp/google) 3.13.0...
Terraform has been successfully initialized!
```


Then, provision your cluster by running `terraform apply`. This will 
take approximately 10 minutes.

```shell
$ terraform apply

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

kubernetes_cluster_name = app-devlopment
region = us-central1
```

Terraform will launch the  cluster in mentioned vpc.


