output "github-runner" {
  value = {
    webhook = module.github-runner.webhook.endpoint
  }
}
