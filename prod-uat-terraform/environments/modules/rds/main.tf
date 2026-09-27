resource "aws_db_instance" "rds" {

  identifier = "${var.environment}-mysql"

  engine = "mysql"

  instance_class = var.db_class

  allocated_storage = 100

  username = var.username

  password = var.password

  multi_az = var.multi_az

  skip_final_snapshot = true
}
