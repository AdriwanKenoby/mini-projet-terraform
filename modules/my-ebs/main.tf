resource "aws_ebs_volume" "adriv_ebs" {
  availability_zone = var.ebs_azs[0]
  size              = var.ebs_size

  tags = var.ebs_tags
}