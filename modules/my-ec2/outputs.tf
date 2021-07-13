output "name" {
  description = "ID of the instance"
  value = aws_instance.adriv_ec2.id
}

output "avz" {
  description = "Availability zone"
  value = aws_instance.adriv_ec2.availability_zone
}