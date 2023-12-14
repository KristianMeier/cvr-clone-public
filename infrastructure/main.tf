terraform {
  required_version = ">= 0.14.0"

  cloud {
    organization = "krme-org"

    workspaces {
      name = "kkm-terraform-development"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

########################
##  SHARED RESOURCES  ##
########################

# Networking
module "vpc" {
  source   = "./networking/vpc"
  vpc_name = "vpc-${var.domain_name}-${var.shared_resource}"
}

module "security_group" {
  source              = "./networking/security_group"
  vpc_id              = module.vpc.vpc_id
  security_group_name = "security-group-${var.shared_resource}"
}

module "internet_gateway" {
  source                = "./networking/internet_gateway"
  vpc_id                = module.vpc.vpc_id
  internet_gateway_name = "igw-${var.shared_resource}"
}

module "route_table" {
  source              = "./networking/route_table"
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  vpc_id              = module.vpc.vpc_id
  public_subnet_1_id  = module.subnet.public_subnet_1_id
  route_table_name    = "route-table-${var.shared_resource}"

}

module "subnet" {
  source               = "./networking/subnet"
  vpc_id               = module.vpc.vpc_id
  public_subnet_1_name = "public-subnet-1-${var.shared_resource}"
  public_subnet_2_name = "public-subnet-2-${var.shared_resource}"
}

module "api_gateway" {
  source            = "./networking/api_gateway"
  lambda_arn        = module.lambda.lambda_arn
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
  api_gateway_name  = "api-gateway-${var.shared_resource}"
}

# Compute
module "lambda" {
  source                    = "./compute/lambda"
  api_gateway_execution_arn = module.api_gateway.api_gateway_execution_arn
  lambda_role               = "cvr-dk-lambda-role-${var.shared_resource}"
  lambda_function_name      = "cvr-dk-lambda-function-${var.shared_resource}"
}

# Launch template
module "launch_template" {
  source                    = "./compute/launch_template"
  key_pair_name             = module.key_pair.key_pair_name
  security_group_id         = module.security_group.security_group_id
  iam_instance_profile_name = module.dynamodb.dynamodb_iam_instance_profile_name
  cloudfront_domain_name    = module.cloudfront_bucket.cloudfront_domain_name
  gateway_api_url           = module.api_gateway.api_gateway_url
  placement_group_name      = module.placement_group.spread_placement_group_name
  launch_template_name      = "launch-template-${var.shared_resource}"
}

module "placement_group" {
  source               = "./compute/placement_group"
  placement_group_name = "placement-group-${var.shared_resource}"
}

# Databases (only read)
module "dynamodb" {
  source                    = "./database/dynamodb"
  dynamodb_table_name       = "dynamodb-table-${var.shared_resource}"
  dynamodb_policy_name      = "dynamo-db-access-policy-${var.shared_resource}"
  ec2_dynamodb_role_name    = "ec2-dynamodb-access-role-${var.shared_resource}"
  ec2_dynamodb_profile_name = "ec2-dynamodb-profile-${var.shared_resource}"
}

# Storage
module "cloudfront_bucket" {
  source                       = "./storage/s3"
  bucket_name                  = "cloudfront-bucket-${var.shared_resource}"
  create_cloudfront            = true
  s3_access_policy_name        = "s3-access-policy-${var.shared_resource}"
  s3_origin_id                 = "s3-origin-${var.shared_resource}"
  cloudfront_distribution_name = "cloudfront-distribution-${var.shared_resource}"
}

# Security
module "key_pair" {
  source        = "./security/key_pair"
  key_pair_name = "key-pair-${var.shared_resource}"
}

#####################
##  DEV RESOURCES  ##
#####################

# Compute
module "ec2" {
  source             = "./compute/ec2"
  launch_template_id = module.launch_template.launch_template_id
  public_subnet_1_id = module.subnet.public_subnet_1_id
  security_group_id  = module.security_group.security_group_id
  instance_name      = "instance-${var.dev_resource}"
  instance_eip_name  = "instance-eip-${var.dev_resource}"
}

######################
##  PROD RESOURCES  ##
######################

# Compute
module "asg" {
  source                    = "./compute/asg"
  public_subnet_1_id        = module.subnet.public_subnet_1_id
  public_subnet_2_id        = module.subnet.public_subnet_2_id
  target_group_backend_arn  = module.alb_target_group.target_group_backend_arn
  target_group_frontend_arn = module.alb_target_group.target_group_frontend_arn
  launch_template_id        = module.launch_template.launch_template_id
  scale_up_policy_name      = "scale-up-policy-${var.prod_resource}"
  scale_down_policy_name    = "scale-down-policy-${var.prod_resource}"
  auto_scaling_group_name   = "auto-scaling-group-${var.prod_resource}"
}

# Storage
module "logs_bucket" {
  source                       = "./storage/s3"
  bucket_name                  = "logs-bucket-${var.prod_resource}"
  s3_access_policy_name        = "s3-access-policy-${var.prod_resource}"
  s3_origin_id                 = "s3-origin-${var.prod_resource}"
  cloudfront_distribution_name = "cloudfront-distribution-${var.prod_resource}"
}

# Notifications
module "sns" {
  source                           = "./notifications/sns"
  cpu_alarm_topic_name             = "cpu-alarm-topic-${var.prod_resource}"
  cpu_insufficient_data_topic_name = "cpu-insufficient-data-topic-${var.prod_resource}"
  cpu_ok_topic_name                = "cpu-ok-topic-${var.prod_resource}"
}

# Monitoring
module "flow_logs" {
  source                    = "./monitoring/flow_logs"
  s3_bucket_arn             = module.logs_bucket.s3_bucket_arn
  vpc_id                    = module.vpc.vpc_id
  vpc_flow_logs_name        = "vpc-flow-logs-${var.prod_resource}"
  vpc_flow_logs_role_name   = "vpc-flow-logs-role-${var.prod_resource}"
  vpc_flow_logs_policy_name = "vpc-flow-logs-s3-access-policy-${var.prod_resource}"
}

module "cloudwatch" {
  source                    = "./monitoring/cloudwatch"
  sns_topic_alarm_arn       = module.sns.sns_topic_alarm_arn
  sns_cpu_ok_arn            = module.sns.sns_cpu_ok_arn
  sns_insufficient_data_arn = module.sns.sns_insufficient_data_arn
  asg_name                  = module.asg.asg_name
  asg_scale_up_policy_arn   = module.asg.asg_scale_up_policy_arn
  asg_scale_down_policy_arn = module.asg.asg_scale_down_policy_arn
  asg_high_cpu_alarm_name   = "cpu-usage-high-${var.prod_resource}"
  asg_low_cpu_alarm_name    = "cpu-usage-low-${var.prod_resource}"
}
# Load balancers

module "alb" {
  source             = "./load_balancer/alb"
  security_group_id  = module.security_group.security_group_id
  public_subnet_1_id = module.subnet.public_subnet_1_id
  public_subnet_2_id = module.subnet.public_subnet_2_id
  alb_name           = "alb-${var.prod_resource}"
}

module "alb_listener" {
  source                       = "./load_balancer/alb_listener"
  alb_arn                      = module.alb.alb_arn
  target_group_backend_arn     = module.alb_target_group.target_group_backend_arn
  target_group_frontend_arn    = module.alb_target_group.target_group_frontend_arn
  cert_validation_arn          = module.acm.cert_validation_arn
  http_redicrect_listener_name = "redirect-listener-${var.prod_resource}"
  backend_listerner_4000_name  = "backend-listener-${var.prod_resource}"
  https_listener_443_name      = "https-listener-${var.prod_resource}"
}

module "alb_target_group" {
  source                     = "./load_balancer/alb_target_group"
  vpc_id                     = module.vpc.vpc_id
  frontend_target_group_name = "frontend-tg-name-${var.prod_resource}"
  backend_target_group_name  = "backend-tg-name-${var.prod_resource}"
}

# DNS
module "route_53_zone" {
  source      = "./dns/route_53_zone"
  domain_name = var.domain_name
}

module "route_53_record" {
  source            = "./dns/route_53_record"
  alb_alias_name    = module.alb.alb_alias_name
  alb_alias_zone_id = module.alb.alb_alias_zone_id
  cert_dvo          = module.acm.cert_dvo
  kkm_zone_id       = module.route_53_zone.kkm_zone_id
  domain_name       = var.domain_name
}

# Certificates
module "acm" {
  source                 = "./certificate/acm"
  cert_validation_1_fdqn = module.route_53_record.cert_validation_1_fdqn
  cert_validation_2_fdqn = module.route_53_record.cert_validation_2_fdqn
  kkm_zone_id            = module.route_53_zone.kkm_zone_id
  domain_name            = var.domain_name
  acm_certificate_name   = "${var.domain_name}-cert-${var.prod_resource}"
}