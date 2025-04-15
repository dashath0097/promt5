#######################################
### Sensitive Terraform Variables
#######################################

resource "tfe_variable" "sensitive_vars_one" {
  for_each = local.iterator

  key          = "test_variable_sensitive_${each.key}"
  value        = "my_sensitive_value_${each.key}"
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.this["one"].id
  description  = "description ${each.key}"
}

resource "tfe_variable" "sensitive_vars_two" {
  for_each = local.iterator

  key          = "test_variable_sensitive_${each.key}"
  value        = "my_sensitive_value_${each.key}"
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.this["two"].id
  description  = "description ${each.key}"
}

resource "tfe_variable" "sensitive_vars_three" {
  for_each = local.iterator

  key          = "test_variable_sensitive_${each.key}"
  value        = "my_sensitive_value_${each.key}"
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.this["three"].id
  description  = "description ${each.key}"
}

#######################################
### Non Sensitive Terraform Variables
#######################################

resource "tfe_variable" "non_sensitive_vars_one" {
  for_each = local.iterator

  key          = "test_variable_non_sensitive_${each.key}"
  value        = "my_non_sensitive_value_${each.key}"
  category     = "terraform"
  workspace_id = tfe_workspace.this["one"].id
  description  = "description ${each.key}"
}

resource "tfe_variable" "non_sensitive_vars_two" {
  for_each = local.iterator

  key          = "test_variable_non_sensitive_${each.key}"
  value        = "my_non_sensitive_value_${each.key}"
  category     = "terraform"
  workspace_id = tfe_workspace.this["two"].id
  description  = "description ${each.key}"
}

resource "tfe_variable" "non_sensitive_vars_three" {
  for_each = local.iterator

  key          = "test_variable_non_sensitive_${each.key}"
  value        = "my_non_sensitive_value_${each.key}"
  category     = "terraform"
  workspace_id = tfe_workspace.this["three"].id
  description  = "description ${each.key}"
}

#######################################
### Sensitive Environment Variables
#######################################

resource "tfe_variable" "non_sensitive_env_one" {
  for_each = local.iterator

  key          = "ENV_NON_SENSITIVE_${each.key}"
  value        = "my_non_sensitive_env_value_${each.key}"
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.this["one"].id
  description  = "description ${each.key}"
}

resource "tfe_variable" "non_sensitive_env_two" {
  for_each = local.iterator

  key          = "ENV_NON_SENSITIVE_${each.key}"
  value        = "my_non_sensitive_env_value_${each.key}"
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.this["two"].id
  description  = "description ${each.key}"
}

resource "tfe_variable" "non_sensitive_env_three" {
  for_each = local.iterator

  key          = "ENV_NON_SENSITIVE_${each.key}"
  value        = "my_non_sensitive_env_value_${each.key}"
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.this["three"].id
  description  = "description ${each.key}"
}

#######################################
### Non Sensitive Environment Variables
#######################################

resource "tfe_variable" "sensitive_env_one" {
  for_each = local.iterator

  key          = "ENV_SENSITIVE_${each.key}"
  value        = "my_sensitive_env_value_${each.key}"
  category     = "env"
  workspace_id = tfe_workspace.this["one"].id
  description  = "description ${each.key}"
}

resource "tfe_variable" "sensitive_env_two" {
  for_each = local.iterator

  key          = "ENV_SENSITIVE_${each.key}"
  value        = "my_sensitive_env_value_${each.key}"
  category     = "env"
  workspace_id = tfe_workspace.this["two"].id
  description  = "description ${each.key}"
}

resource "tfe_variable" "sensitive_env_three" {
  for_each = local.iterator

  key          = "ENV_SENSITIVE_${each.key}"
  value        = "my_sensitive_env_value_${each.key}"
  category     = "env"
  workspace_id = tfe_workspace.this["three"].id
  description  = "description ${each.key}"
}