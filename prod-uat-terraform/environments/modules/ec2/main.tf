resource "aws_instance" "web" {

  ami           = "ami-xxxxxxxx"

  instance_type = var.instance_type

  tags = {
    Name = "${var.environment}-app-server"
  }
}
