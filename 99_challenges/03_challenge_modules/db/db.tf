resource "aws_instance" "db" {
  ami           = "ami-0a9e90bd830396d02"
  instance_type = "t2.micro"

  tags = {
    Name = "db"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}
