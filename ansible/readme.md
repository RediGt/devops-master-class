# Ansible

## Step By Step Details
- Step 01 - Creating EC2 Instances for Ansible - Manually and with Terraform
- Step 02 - Setting Ansible Project with cfg and ansible hosts
- Step 03 - Playing with Ansible Commands
- Step 04 - Playing with Ansible Host File and Custom Groups
- Step 05 - Creating an Ansible Playbook for Ping
- Step 06 - Understanding Ansible Terminology - Control Node, Managed Nodes, Inventory
- Step 07 - Creating New Ansible Playbook for Executing Shell Commands
- Step 08 - Playing with Ansible Variables
- Step 09 - Creating New Ansible Playbook for Understanding Ansible Facts
- Step 10 - Creating New Ansible Playbook for Installing Apache and Serving HTML
- Step 11 - Reuse and Executing Multiple Ansible Playbooks
- Step 12 - Understanding Conditionals and Loops with Ansible
- Step 13 - Configuring EC2 Dynamic Inventory with Ansible
- Step 14 - Creating AWS EC2 Instances with Ansible
- Step 15 - Providing Declarative Configuration with Ansible
- Step 16 - Deleting all AWS EC2 Instances

### Prerequisites
- 3 EC2 Instances 
    - 2 using Terraform
    - 1 Manually
    - You can use which ever approach you are comfortable with

- EC2 Keys - `ls ~/aws/aws_keys/default-ec2.pem`

- AWS CLI - `aws configure`
```sh
# or
export AWS_ACCESS_KEY_ID=**************
export AWS_SECRET_ACCESS_KEY=**************
```

- boto3 and botocore - For EC2 Dynamic Inventory and Creating EC2 Instances
```sh
# TEst
python
# boto3 quick start
> import boto3
> client = boto3.client('ec2')
```

### Create EC2 Instances using Terraform

```
cd terraform/backup/09-multiple-ec2-instances
export AWS_ACCESS_KEY_ID=**************
export AWS_SECRET_ACCESS_KEY=**************
terraform init
terraform apply
ls ~/aws/aws_keys/ # Make sure that the keys file is present
```

### Generic Commands
```
1) ssh -vvv -i ~/aws/aws_keys/Stockholm-KP.pem ec2-user@13.48.42.54 # Connect to EC2 manually
2) chmod 400 ~/aws/aws_keys/Stockholm-KP.pem # Set read permissions to Private key file
```

### Ansible Commands

```
cd /in28Minutes/git/devops-master-class/ansible 
1) ansible --version
2) ansible -m ping all                          # Try to connect to EC2
3) ansible all -a "whoami"                      # Get users from EC2
4) ansible all -a "uname"                       # Operating system of EC2
5) ansible all -a "uname -a"                    # Operating system Details of EC2
6) ansible all -a "pwd"
7) ansible all -a "python --version"            # Call all EC2
   ansible dev -a "python --version"            # Call [dev] EC2 - by host group
   ansible qa -a "python --version"             # Call [qa] EC2 - by host group
   ansible first -a "python --version"          # Call [first] EC2
   ansible groupofgroups -a "python --version"  # Call [groupofgroups] EC2
   ansible devsubset -a "python --version"      # Call [devsubset] EC2
ansible --list-host all
ansible --list-host dev
ansible --list-host first
ansible --list-host \!first
ansible --list-host qa:dev
ansible-playbook playbooks/01-ping.yml
ansible-playbook playbooks/02-shell.yml 
ansible-playbook playbooks/03-variables.yml 
ansible-playbook playbooks/03-variables.yml -e variable1=CommandLineValue
ansible-playbook playbooks/04-ansible-facts.yml 
ansible-playbook playbooks/05-install-apache.yml 
ansible-playbook playbooks/06-playbooks.yml 
ansible-playbook playbooks/06-playbooks.yml --list-tasks
ansible-playbook playbooks/06-playbooks.yml --list-hosts
ansible-playbook playbooks/06-playbooks.yml --list-tags
ansible-playbook -l dev playbooks/01-ping.yml
ansible-playbook playbooks/07-conditionals-and-loops.yml 
ansible-inventory --list
ansible-inventory --graph
ansible-playbook playbooks/08-dynamic-inventory-ping.yml 
ansible-playbook playbooks/09-create-ec2.yml 

```

<!-- ansible.csg -->
[defaults]
inventory=./ansible_hosts       # Here instances will be described
remote_user=ec2-user            # Default user in EC2 Linux instances
private_key_file=~/aws/aws_keys/Stockholm-KP.pem # Key-pair for EC2
host_key_checking=False         # Make EC2 trust the Ansible
retry_files_enabled=False       # Do not create retry file
interpreter_python=auto_silent  # Disable warnings