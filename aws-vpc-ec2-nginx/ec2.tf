# creating aws ec2 instance
resource "aws_instance" "nginx-server" {
  ami                         = "<ami_id>"
  instance_type               = "<t3_micro_instance_type>"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true  #provide the public ip address

  # installing nginx
  user_data = <<-EOF
            #!/bin/bash
            sudo apt-get update
            sudo apt-get install -y nginx
            sudo systemctl start nginx
            sudo systemctl enable nginx
            EOF

  # optional
  tags = {
    Name = "Nginx Server"
  }
}


# terraform init
# terraform validate
# terraform apply
