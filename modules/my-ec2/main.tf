module "my_security_group" {
  source = "../my-security-group"
}

module "my_ebs" {
  source = "../my-ebs"
}

resource "aws_instance" "adriv_ec2" {
  ami = var.my_ami
  instance_type = var.my_type
  key_name = "adriV"
  tags = var.ec2_tags
  security_groups = [ "${module.my_security_group.name}" ]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl restart nginx"
    ]
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("/home/adrien/.ssh/adriV.pem")
    host = self.public_ip
  }
}

resource "aws_volume_attachment" "my_attachment" {
  device_name = "/dev/sdh"
  volume_id = module.my_ebs.name
  instance_id = aws_instance.adriv_ec2.id
}

resource "aws_eip" "adriv_eip" {
  instance = aws_instance.adriv_ec2.id
  vpc = true 
  provisioner "local-exec" {
    command = "echo 'public IP : ${aws_eip.adriv_eip.public_ip}, ID : ${aws_instance.adriv_ec2.id}, AZ : ${aws_instance.adriv_ec2.availability_zone}' >> infos_ec2.txt"
  }
}