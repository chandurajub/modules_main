locals {
  sg_name     = "frontend-${var.TAGS["ENV"]}"
  alb_name    = "frontend-${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}"
  route_name  = "${var.TAGS["ENV"]}-${var.TAGS["PROJECT"]}-frontend"
}