# creating security group
resource "aws_security_group" "nginx-sg" {
  vpc_id = aws_vpc.my-vpc.id

  # set rules
  # inbound_rules (ingress)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound_rules (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #applicbl for all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-sg"
  }
}
