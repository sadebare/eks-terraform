env_name              = "uat"
region                = "us-east-1"
vpc_cidr              = "172.53.0.0/16"
number_of_nat         = 3
private_subnet_cidr   = ["172.53.1.0/24", "172.53.2.0/24", "172.53.3.0/24"]
public_subnet_cidr    = ["172.53.4.0/24", "172.53.5.0/24", "172.53.6.0/24"]
bucket_name           = "shittu-barry-terraform-state"
statefile_bucket_path = "dev/terraform.tfstate"
