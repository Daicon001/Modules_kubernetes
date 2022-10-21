output "Worker_lb" {
    value = aws_elb.Worker-lb.dns_name
}
output "Worker_lb_zone_id" {
    value = aws_elb.Worker-lb.zone_id
}
