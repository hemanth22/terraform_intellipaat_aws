resource "aws_instance" "prod" {
  key_name               = "bitroid"
  ami                    = "ami-01ed306a12b7d1c96"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0b7b9514fa90923d0"]
  subnet_id              = "subnet-0a02044410efcb1a8"

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    delete_on_termination = "true"
  }

  user_data_base64="IyEvYmluL2Jhc2gKeXVtIGluc3RhbGwgLXkgd2dldAp3Z2V0IC1PIGF3c3B1cHBldC5zaCBnaXQuaW8vYXdzaW50ZWxsaXB1cHBldG1hcyAmJiBzaCBhd3NwdXBwZXQuc2g="

  tags = {
    "Name" : "Puppet prod"
  }

}

output "Prod_Public_IP" {
  value = aws_instance.prod.public_ip
}

output "Prod_Private_IP" {
  value = aws_instance.prod.private_ip
}

output "Prod_Private_DNS" {
  value = aws_instance.prod.private_dns
}
