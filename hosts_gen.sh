#!/usr/bin/bash
echo "[aws_master]
centos_master		 ansible_host=$(cat "$1/terraform.tfstate" | grep '"public_ip"' | sed 's/://g; s/"//g; s/public_ip//g; s/,//; s/ //g' | head -n 1)

[aws_slave]
centos_slave		 ansible_host=$(cat "$1/terraform.tfstate" | grep '"public_ip"' | sed 's/://g; s/"//g; s/public_ip//g; s/,//; s/ //g' | tail -n 1)

[aws:children]
aws_master
aws_slave

[aws:vars] 
ansible_user=centos
ansible_ssh_private_key_file=/path/to/your/key.pem #path to your key