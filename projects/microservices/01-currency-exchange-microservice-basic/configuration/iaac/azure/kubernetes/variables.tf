# get this values do the following:
# 1) run "az login" from terminal and get "id" value (subscription id)
# 2) create Azure SA. Run from terminal
#       az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<id>"
#    from response take "appId" and "password"
variable client_id {} # appId, to be passed as ENV-VARs
variable client_secret {} # password, to be passed as ENV-VARs

# 3) Create Private-Public Key for SSH Access
#       ssh-keygen -m PEM -t rsa -b 4096
variable ssh_public_key {}

variable environment {
  default = "dev"
}

variable location {
  default = "westeurope"
}

variable node_count {
  default = 3
}

variable dns_prefix {
  default = "k8stest"
}

variable cluster_name {
  default = "k8stest"
}

variable resource_group {
  default = "kubernetes"
}