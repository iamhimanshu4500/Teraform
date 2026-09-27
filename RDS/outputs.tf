output "primary_endpoint" {
  value = aws_db_instance.primary.endpoint
}

output "replica_endpoint" {
  value = aws_db_instance.read_replica.endpoint
}
