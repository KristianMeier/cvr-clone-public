resource "aws_placement_group" "spread_pg" {
  name     = var.placement_group_name
  strategy = "spread"
}