resource "aws_db_subnet_group" "postgres" {

  name = "postgres-subnet-group"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}

resource "aws_db_subnet_group" "postgres" {

  name = "postgres-subnet-group"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}

resource "aws_db_instance" "primary" {

  identifier = "prod-postgres"

  engine         = "postgres"
  engine_version = "15"

  instance_class = "db.t3.medium"

  allocated_storage = 100
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  multi_az = true

  db_subnet_group_name = aws_db_subnet_group.postgres.name

  vpc_security_group_ids = [
    aws_security_group.postgres.id
  ]

  publicly_accessible = false

  backup_retention_period = 7

  skip_final_snapshot = true

  parameter_group_name = aws_db_parameter_group.postgres.name
}

resource "aws_db_instance" "read_replica" {

  identifier = "prod-postgres-replica"

  replicate_source_db = aws_db_instance.primary.identifier

  instance_class = "db.t3.medium"

  publicly_accessible = false

  auto_minor_version_upgrade = true

  depends_on = [
    aws_db_instance.primary
  ]
}

