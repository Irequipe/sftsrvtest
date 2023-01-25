provider "aws" {
  region = "us-east-1"
}


resource "aws_lb" "aws-load-balancer" {
  name               = "load-balancer"
  load_balancer_type = "network"
  subnets            = ["subnet-09e85f18787181f1c", "subnet-0a0f1ddb2e894c95c"]

  enable_cross_zone_load_balancing = true
}




resource "aws_lb_target_group" "target-group" {
  target_type = "instance"


  port        = 80
  protocol    = "TCP"
  vpc_id      = "vpc-0f7fb109ce902d9bf"

  depends_on = [
    aws_lb.aws-load-balancer
  ]

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_lb_listener" "aws-load-balancer-listener" {

  load_balancer_arn = aws_lb.aws-load-balancer.arn

  protocol          = "TCP"
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}


resource "aws_lb_target_group_attachment" "vm1" {
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = "i-0618e816505b4b0bb"
  port             = 80
}

resource "aws_lb_target_group_attachment" "vm2" {
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = "i-040aac2ba70ba1bca"
  port             = 80
}






















# resource "aws_lb_target_group" "target_group"{
#     health_check{
#         interval = 10
#         path = "/"
#         protocol = "HTTP"
#         timeout = 5
#         healthy_threshold = 5
#         unhealthy_threshold = 2
#     }

#     name = "target-group"
#     port = 80
#     protocol = "HTTP"
#     target_type = "instance"
#     vpc_id = "vpc-0f7fb109ce902d9bf"
# }


# resource "aws_lb" "test_nw_load_balancer"{
#     name = "nlb-sftsrv-ire-test"
#     ip_address_type = "ipv4"
#     load_balancer_type = "network"
#     security_groups = ["sg-0e19c480602875d76"]

#     tags = {
#         name = "load-balancer"
#     }



# }


# resource "aws_lb_listener" "nlb-listener"{
#     load_balancer_arn = [aws_lb.test_nw_load_balancer.arn]
#     port = 80
#     protocol = "HTTP"

#     default_action {
#         target_group_arn = [aws_lb_target_group.target_group.arn]
#         type = "forward"
#     }

#     }
