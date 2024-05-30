# Call VPC module
module "vpc" {
    
  source = "../modules/vpc"

}


# Call RDS module
module "rds" {
  source = "../modules/rds"
  # Pass VPC details to RDS module
  vpc_id = module.vpc.vpc_id
  availability_zones = module.vpc.availability_zones
}