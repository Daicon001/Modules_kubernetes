resource "aws_elb" "Worker-lb" {
  name            = var.Worker-lb-name
  subnets         = [var.subnet_id]
  security_groups = [var.securitygroup_id]

  listener {
    instance_port     = var.instance_port
    instance_protocol = var.instance-lb_protocol
    lb_port           = var.lb_port
    lb_protocol       = var.instance-lb_protocol
  }

  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    target              = "TCP:30001"
    interval            = var.interval
  }

  instances                   = [var.worker1_id, var.worker2_id, var.worker3_id, var.worker4_id ]
  cross_zone_load_balancing   = true
  idle_timeout                = var.idle_timeout
  connection_draining         = true
  connection_draining_timeout = var.connection_draining_timeout

  tags = {
    Name = var.Worker-lb-name
  }
}