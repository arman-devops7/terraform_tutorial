# jb bhi instance banta h mujhe uski public ip chahye
output "aws_instance_public_ip" {
  value = aws_instance.web01.public_ip
}
