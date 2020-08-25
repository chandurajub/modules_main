locals {
  NAME_TAG = "mongodb-${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}"
  DNS_NAME = "${local.NAME_TAG}.${var.HOSTED_ZONE_NAME}"
}