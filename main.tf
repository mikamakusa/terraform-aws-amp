resource "aws_prometheus_alert_manager_definition" "this" {
  count        = (length(var.workspace)) == 0 ? 0 : length(var.alert_manager_definition)
  definition   = lookup(var.alert_manager_definition[count.index], "definition")
  workspace_id = try(element(aws_prometheus_workspace.this.*.id, lookup(var.alert_manager_definition[count.index], "workspace_id")))
}

resource "aws_prometheus_rule_group_namespace" "this" {
  count        = (length(var.workspace)) == 0 ? 0 : length(var.rule_group_namespace)
  name         = lookup(var.rule_group_namespace[count.index], "name")
  workspace_id = try(element(aws_prometheus_workspace.this.*.id, lookup(var.rule_group_namespace[count.index], "workspace_id")))
  data         = lookup(var.rule_group_namespace[count.index], "data")
}

resource "aws_prometheus_scraper" "this" {
  count                = length(var.scraper)
  scrape_configuration = file(join("/", [path.cwd, "scrape", lookup(var.scraper[count.index], "scrape_configuration")]))
  alias                = lookup(var.scraper[count.index], "alias")

  dynamic "destination" {
    for_each = lookup(var.scraper[count.index], "destination")
    content {
      dynamic "amp" {
        for_each = lookup(destination.value, "amp")
        content {
          workspace_arn = try(element(aws_prometheus_workspace.this.*.arn, lookup(amp.value, "workspace_id")))
        }
      }
    }
  }

  dynamic "source" {
    for_each = lookup(var.scraper[count.index], "source") == null ? [] : ["source"]
    content {
      dynamic "eks" {
        for_each = lookup(source.value, "eks") == null ? [] : ["eks"]
        content {
          subnet_ids         = try(element(module.eks.eks_cluster_subnet_id, lookup(source.value, "cluster_id")))
          cluster_arn        = try(element(module.eks.eks_cluster_arn, lookup(source.value, "cluster_id")))
          security_group_ids = try(element(module.eks.eks_cluster_security_group_ids, lookup(source.value, "cluster_id")))
        }
      }
    }
  }
}

resource "aws_prometheus_workspace" "this" {
  count       = length(var.workspace)
  alias       = lookup(var.workspace[count.index], "alias")
  kms_key_arn = try(element(module.kms.key_arn, lookup(var.workspace[count.index], kms_key_id)))
  tags        = lookup(var.workspace[count.index], "tags")

  dynamic "logging_configuration" {
    for_each = (lookup(var.workspace[count.index], "logging_configuration") == null) ? [] : ["logging_configuration"]
    content {
      log_group_arn = try(element(module.cloudwatch.log_group_arn, lookup(logging_configuration.value, "log_group_id")))
    }
  }
}