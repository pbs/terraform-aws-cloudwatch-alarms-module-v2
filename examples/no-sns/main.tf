module "alarm" {
  source = "../.."

  name = "test-app-no-sns"

  alarms = [
    {
      name               = "error"
      description        = "Alarm if more than 5 errors in 1 minute"
      slack_channel_id   = ""
      log_group_name     = "/ecs/test-app"
      pattern            = "ERROR"
      metric_name        = "error-count"
      metric_namespace   = "test-app"
      metric_value       = "1"
      alarm_threshold    = 5
      alarm_period       = 60
      alarm_statistic    = "Sum"
      treat_missing_data = "notBreaching"
    }
  ]

  organization = var.organization
  environment  = var.environment
  product      = var.product
  owner        = var.owner
  repo         = var.repo
}
