resource "google_dialogflow_entity_type" "dialogflow_entity_types" {
  for_each = var.dialogflow_entity_types

  display_name            = each.value.display_name
  kind                    = each.value.kind
  deletion_policy         = each.value.deletion_policy
  enable_fuzzy_extraction = each.value.enable_fuzzy_extraction
  project                 = each.value.project

  dynamic "entities" {
    for_each = each.value.entities != null ? each.value.entities : []
    content {
      synonyms = entities.value.synonyms
      value    = entities.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

