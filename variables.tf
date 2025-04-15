variable "tfc_hostname" {
  description = "The hostname of the Terraform Cloud instance"
  type        = string
  default     = "app.terraform.io"
}

variable "tfc_token" {
  description = "The token to authenticate with the Terraform Cloud instance"
  type        = string
  sensitive   = true
}

variable "github_pat" {
  description = "The GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "organization_admin_email" {
  description = "The email address of the organization admin"
  type        = string
}