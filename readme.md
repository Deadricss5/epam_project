# EPAM external course final project 2020/Q1

## Terraform
For terraform will work correct you need to add next variables, ***secret_key***, ***access_key*** and ***region*** in **provider** section in centos.tf file or as your environment variables
```shell
provider "aws" {
access_key = "your key"
secret_key = "your key"
region = "your region"
}
```

## Bash script
You need add path to the folder that contain .tfstate file as script argument and set path to yours .pem key in bash script to allow Ansible connect to your instances via ssh.
```shell
/home/user/epam_project/hosts_gen.sh /home/user/terraform/
```

### After that all tools will work correct.
```shell
#move to terraform directory
cd /home/user/epam_project/terraform

#init terraform
terraform init

#apply (create infrastructure)
terraform apply

#gen hosts file for ansible
/home/user/epam_project/hosts_gen.sh /home/user/terraform/

#move to ansible directory
cd /home/user/ansible

#configure infrastructure with ansible
ansible-playbook project.yaml -i hosts
```
