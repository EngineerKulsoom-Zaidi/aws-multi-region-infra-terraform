# Provider for Region 1 (N. Virginia)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# Provider for Region 2 (Mumbai)
provider "aws" {
  alias  = "ap_south_1"
  region = "ap-south-1"
}

# VPC in US-East-1
module "vpc_us_east" {
  source   = "./modules/vpc"
  providers = {
    aws = aws.us_east_1
  }
  vpc_cidr           = "10.1.0.0/16"
  vpc_name           = "Primary-VPC-US"
  region             = "us-east-1"
  public_subnet_cidr = "10.1.1.0/24" 
}

# VPC in AP-South-1
module "vpc_ap_south" {
  source   = "./modules/vpc"
  providers = {
    aws = aws.ap_south_1
  }
  vpc_cidr           = "10.2.0.0/16"
  vpc_name           = "Secondary-VPC-India"
  region             = "ap-south-1"
  public_subnet_cidr = "10.2.1.0/24" 
}
