# Output variable definitions

output "arn" {
  description = "ARN the EBS instance"
  value = aws_ebs_volume.adriv_ebs.arn
}

output "name" {
  description = "name (ID) if the EBS"
  value = aws_ebs_volume.adriv_ebs.id
}
