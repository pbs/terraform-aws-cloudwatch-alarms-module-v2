output "arn" {
  description = "ARN of the alarm provisioned"
  value       = module.alarm.arns
}

output "name" {
  description = "Name of the alarm provisioned"
  value       = module.alarm[*].names
}
