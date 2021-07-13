# Input variable definitions

variable "ebs_size" {
  description = "Size of EBS in GiBs"
  type        = number
  default     = 20
}

variable "ebs_tags" {
  description = "Tags to set on the EBS."
  type        = map(string)
  default     = {}
}

variable "ebs_azs" {
  description = "Availability zones for EBS"
  type        = list(string)
  default     = ["ap-east-1a", "ap-east-1b", "ap-east-1c"]
}