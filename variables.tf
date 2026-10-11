variable "dialogflow_entity_types" {
  description = <<EOT
Map of dialogflow_entity_types, attributes below
Required:
    - display_name
    - kind
Optional:
    - deletion_policy
    - enable_fuzzy_extraction
    - project
    - entities (block):
        - synonyms (required)
        - value (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    display_name            = string
    kind                    = string
    deletion_policy         = optional(string)
    enable_fuzzy_extraction = optional(bool)
    project                 = optional(string)
    entities = optional(list(object({
      synonyms = list(string)
      value    = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

