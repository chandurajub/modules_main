locals {
  DNS_NAME = "rabbitmq-${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}.${var.HOSTED_ZONE_NAME}"
  NAME_TAG = "rabbitmq-${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}"
}