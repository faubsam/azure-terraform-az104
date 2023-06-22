## General Terraform Workflow
##### terraform init
initializes a working directory with terraform init files. Downloads providers. This must be done before other terraform commands can be used in the directory.
##### terraform validate
Checks the syntax and consistency of the terraform configs
##### terraform plan -out <plan-file-name>
Determines what is required to achieve the desired state in the config files
##### terraform apply -auto-approve
creates the resources 
##### terraform destroy
Deletes resources created by the apply command
##### terraform show
Show active resources
