## Alert Manager Definition

output "alert_manager_definition_id" {
  value = try(
    aws_prometheus_alert_manager_definition.this.*.id
  )
}

output "alert_manager_definition_definition" {
  value = try(
    aws_prometheus_alert_manager_definition.this.*.definition
  )
}

output "alert_manager_definition_workspace_id" {
  value = try(
    aws_prometheus_alert_manager_definition.this.*.workspace_id
  )
}

## Rule Group Namespace ##

output "rule_group_namespace_workspace_id" {
  value = try(
    aws_prometheus_rule_group_namespace.this.*.workspace_id
  )
}

output "rule_group_namespace_id" {
  value = try(
    aws_prometheus_rule_group_namespace.this.*.id
  )
}

output "rule_group_namespace_name" {
  value = try(
    aws_prometheus_rule_group_namespace.this.*.name
  )
}

output "rule_group_namespace_data" {
  value = try(
    aws_prometheus_rule_group_namespace.this.*.data
  )
}

## Scraper ##

output "scraper_id" {
  value = try(
    aws_prometheus_scraper.this.*.id
  )
}

output "scraper_alias" {
  value = try(
    aws_prometheus_scraper.this.*.alias
  )
}

output "scraper_scrape_configuration" {
  value = try(
    aws_prometheus_scraper.this.*.scrape_configuration
  )
}

## Workspace ##

output "workspace_alias" {
  value = try(
    aws_prometheus_workspace.this.*.alias
  )
}

output "workspace_id" {
  value = try(
    aws_prometheus_workspace.this.*.id
  )
}

output "workspace_arn" {
  value = try(
    aws_prometheus_workspace.this.*.arn
  )
}