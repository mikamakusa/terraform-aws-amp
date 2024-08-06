variable "alert_manager_definition" {
  type = list(object({
    id           = number
    definition   = string
    workspace_id = optional(number)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "rule_group_namespace" {
  type = list(object({
    id           = number
    name         = string
    workspace_id = optional(number)
    data         = string
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "scraper" {
  type = list(object({
    id                   = number
    scrape_configuration = string
    alias                = optional(string)
    destination = list(object({
      amp = list(object({
        workspace_id = number
      }))
    }))
    source = optional(list(object({
      eks = optional(list(object({
        cluster_id = optional(number)
      })))
    })))
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "workspace" {
  type = list(object({
    id         = number
    alias      = optional(string)
    kms_key_id = optional(number)
    tags       = optional(map(string))
    logging_configuration = optional(list(object({
      log_group_id = optional(number)
    })))
  }))
  default     = []
  description = <<EOF
    EOF
}