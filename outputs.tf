output "arns" {
  description = "ARN of the alarm provisioned"
  value       = { for key, alarm in aws_cloudwatch_metric_alarm.alarm : key => alarm.arn }
}

output "names" {
  description = "Name of the alarm provisioned"
  value       = { for key, alarm in aws_cloudwatch_metric_alarm.alarm : key => alarm.alarm_name }
}
