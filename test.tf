resource "aws_instance" "test" {
  key_name               = "bitroid"
  ami                    = "ami-01ed306a12b7d1c96"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0b7b9514fa90923d0"]
  subnet_id              = "subnet-0d6182c75d97ddfa4"

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    delete_on_termination = "true"
  }

  user_data_base64="IyEvYmluL2Jhc2gKeXVtIGluc3RhbGwgLXkgd2dldAp3Z2V0IC1PIGF3c3Rlc3Quc2ggZ2l0LmlvL2F3c2ludGVsbGlwdXBwZXR0ZXMgJiYgc2ggYXdzdGVzdC5zaA=="

  tags = {
    "Name" : "Puppet test"
  }

}

output "Test_Public_IP" {
  value = aws_instance.test.public_ip
}

output "Test_Private_IP" {
  value = aws_instance.test.private_ip
}

output "Test_Private_DNS" {
  value = aws_instance.test.private_dns
}
