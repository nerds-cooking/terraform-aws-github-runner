# Disabled - use CI built version as it contains fix for fetching Default runner group
# module "lambdas" {
#   source = "../modules/download-lambda"
#   lambdas = [
#     {
#       name = "webhook"
#       tag  = "v4.5.0"
#     },
#     {
#       name = "runners"
#       tag  = "v4.5.0"
#     },
#     {
#       name = "runner-binaries-syncer"
#       tag  = "v4.5.0"
#     }
#   ]
# }



module "github-runner" {
  source = "../"

  vpc_id     = "vpc-09096c9c4456443a5"
  subnet_ids = ["subnet-0539e3398dd2dec43", "subnet-0d497069531770dd1", "subnet-048deb9b62b5ffca5"]
  aws_region = var.aws_region

  prefix = "nc-gh-ci"

  github_app = {
    id             = var.github_app_id,
    key_base64     = var.github_app_key_base64,
    webhook_secret = var.github_app_webhook_secret
  }
  # webhook_lambda_zip                = module.lambdas.files[0]
  # runners_lambda_zip                = module.lambdas.files[1]
  # runner_binaries_syncer_lambda_zip = module.lambdas.files[2]

  webhook_lambda_zip                = "../lambda_output/webhook.zip"
  runner_binaries_syncer_lambda_zip = "../lambda_output/runner-binaries-syncer.zip"
  runners_lambda_zip                = "../lambda_output/runners.zip"

  enable_ephemeral_runners    = true
  enable_organization_runners = true
  enable_ssm_on_runners       = true
  enable_jit_config           = true
  instance_types              = ["m5.large", "c5.large"]

  create_service_linked_role_spot = true
}

# resource "aws_iam_service_linked_role" "spot" {
#   aws_service_name = "spot.amazonaws.com"
# }
