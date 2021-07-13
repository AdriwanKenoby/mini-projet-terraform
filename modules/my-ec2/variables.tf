variable "my_ami" {
  description = "ami used for EC2 instance"
  type = string
  default = "ami-0b215afe809665ae5"
}

variable "my_type" {
  description = "type of EC2 instance"
  type = string
  default = "t3.micro"
}

variable "ec2_tags" {
  description = "Tags to set on the EC2."
  type        = map(string)
  default     = {}
}