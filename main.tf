locals {
  iterator = toset(["one", "two", "three"])
}

resource "random_string" "this" {
  length  = 16
  special = false
}

resource "tfe_organization" "this" {
  name  = "sl-migration-cert-${random_string.this.result}"
  email = var.organization_admin_email
}

resource "tfe_project" "this" {
  organization = tfe_organization.this.name
  name         = "sl-migration-certification-project"
}

resource "tfe_oauth_client" "this" {
  organization     = tfe_organization.this.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_pat
  service_provider = "github"
}

resource "tfe_workspace" "this" {
  for_each = local.iterator

  name              = "my-amazing-workspace-${each.key}"
  organization      = tfe_organization.this.name
  project_id        = tfe_project.this.id
  tag_names         = ["amazing", "workspace", each.key]
  terraform_version = "1.5.7"
  auto_apply        = true
  force_delete      = true

  vcs_repo {
    identifier     = "dashath0097/promt5"
    branch         = "main"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }
}

resource "tfe_workspace_settings" "local" {
  workspace_id   = tfe_workspace.this["three"].id
  execution_mode = "local"
}

resource "tfe_workspace" "local_no_vcs" {
  name         = "my-amazing-workspace-local-no-vcs"
  organization = tfe_organization.this.name
  project_id   = tfe_project.this.id
  tag_names    = ["amazing", "workspace", "local-no-vcs"]
  force_delete = true
}

resource "tfe_workspace_settings" "local_no_vcs" {
  workspace_id   = tfe_workspace.local_no_vcs.id
  execution_mode = "local"
}

resource "tfe_workspace" "one_eight_one" {
  name              = "my-amazing-workspace-one-eight-one"
  organization      = tfe_organization.this.name
  project_id        = tfe_project.this.id
  tag_names         = ["amazing", "workspace", "one-eight-one"]
  terraform_version = "1.8.1"
  auto_apply        = true
  force_delete      = true

  vcs_repo {
    identifier     = "dashath0097/promt5"
    branch         = "main"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }
}
