resource "aws_lb" "this" {

  name = "${var.environment}-alb"

  internal = false

  load_balancer_type = "application"

  subnets = var.subnet_ids
}
