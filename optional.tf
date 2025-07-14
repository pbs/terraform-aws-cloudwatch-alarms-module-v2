variable "name" {
  description = "Name of the alarm being created. Defaults to product if null."
  default     = null
  type        = string
}

variable "slack_team_id" {
  description = "Slack team ID for AWS Chatbot integration"
  type        = string
  default     = "T0Y7JC3PF"
}

variable "chatbot_role_arn" {
  description = "ARN of the IAM role for AWS Chatbot"
  type        = string
  default     = null
}

variable "alarms" {
  description = <<EOT
List of CloudWatch alert configurations for Slack notifications.

Each object supports the following attributes:
- name: (string) Unique name for the alert
- description: (string) Description of the alarm
- slack_channel_id: (string) Slack channel ID to send notifications to
- log_group_name: (string) CloudWatch log group to monitor
- pattern: (string) Filter pattern for log events https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html
- metric_name: (string) Name of the custom metric
- metric_namespace: (string) Namespace for the custom metric
- metric_value: (string) Value to publish to the metric when the pattern matches (usually "1")
- alarm_threshold: (number) Threshold for triggering the alarm
- alarm_period: (number) Period (in seconds) over which data is evaluated
- alarm_statistic: (string) Statistic to apply to the metric. Possible values: "Sum", "Average", "Minimum", "Maximum", "SampleCount"
- treat_missing_data: (string) How to treat missing data. Possible values: "breaching", "notBreaching", "ignore", "missing"
EOT

  type = list(object({
    name               = string
    description        = string
    slack_channel_id   = string
    log_group_name     = string
    pattern            = string
    metric_name        = string
    metric_namespace   = string
    metric_value       = string
    alarm_threshold    = number
    alarm_period       = number
    alarm_statistic    = string
    treat_missing_data = string
  }))
  default = []
}