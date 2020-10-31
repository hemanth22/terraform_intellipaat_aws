resource "aws_instance" "example" {
  key_name               = "bitroid"
  ami                    = "ami-01ed306a12b7d1c96"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-07e391a00456e93a5"]
  subnet_id              = "subnet-0c7d15934d437d823"

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    delete_on_termination = "true"
  }

  user_data_base64="IyEvYmluL2Jhc2gKeXVtIGluc3RhbGwgLXkgd2dldAp3Z2V0IC1PIGF3c2plbmtpbnMuc2ggZ2l0LmlvL2F3c2ludGVsbGlqZW5raW5zICYmIHNoIGF3c2plbmtpbnMuc2g="

  tags = {
    "Name" : "Jenkins"
  }

}

output "Jenkins_Public_IP" {
  value = aws_instance.example.public_ip
}

output "Jenkins_Private_IP" {
  value = aws_instance.example.private_ip
}

output "Jenkins_Private_DNS" {
  value = aws_instance.example.private_dns
}
