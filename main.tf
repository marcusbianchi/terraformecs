module "ecs_nginx" {
  source                   = "./modules"
  aws_region               = "us-east-1"
  vpc_cidr_block           = "200.0.0.0/16"
  subnet1_cidr_block       = "200.0.0.0/28"
  sunet1_availability_zone = "us-east-1a"
  subnet2_cidr_block       = "200.0.16.0/28"
  sunet2_availability_zone = "us-east-1b"
  subnet3_cidr_block       = "200.0.32.0/28"
  sunet3_availability_zone = "us-east-1c"
  cluster_name             = "ecs-cluster"
  ec2_instance_type        = "t2.small"
  ec2_key_name             = "cratedb-key"
  ec2_count                = "3"
  ec2_count_max            = "5"
  ec2_count_min            = "2"


}