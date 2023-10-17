provider "aws" {
  region  = local.aws_region
  profile = local.aws_profile

  default_tags {
    tags = {
      Example = local.environment
    }
  }
}
