# terraformecs
ECS Module using Terraform, with NGINX task and service.
## Prerequisites

Required software:
- AWS CLI
- Terraform

AWS credentials configured properly (https://www.terraform.io/docs/providers/aws/index.html)


## Starting the Infrastructure

Got execute init command
```sh
terraform init
```
To Plan and review the changes made in the Cluster:

```sh
terraform plan -out "planfile"  
```

**__Review the Plan of Execution BEFORE executing it__**

To execute the changes:
```sh
terraform apply -input=false "planfile" 
```
The application can be accessed on Load Balancer`s URL.

> To Change the settings edit the file listed on ./terraform.tfvars

## Updating the Infrastructure

To Change the settings edit the file listed on ./terraform.tfvars

To Plan and review the changes made in the Cluster:

```sh
terraform plan -out "planfile"  
```

**__Review the Plan of Execution BEFORE executing it__**

To execute the changes:
```sh
terraform apply -input=false "planfile" 
```


