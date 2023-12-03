provider "google" {
  #credentials = file("path/to/your/credentials.json")
  project     = var.project_id
  region      = "europe-east1"  # Change this to your desired region
}

resource "google_pubsub_topic" "example_topic" {
  name = var.topic_name
}


resource "google_pubsub_schema" "example_schema" {
  project = var.project_id
  name    = var.schema_name
  type    = var.schema_type
  definition = file(var.schema_definition_file)
}

resource "google_pubsub_subscription" "example_subscription" {
  name  = var.subscription_id
  topic = google_pubsub_topic.example_topic.name

  # Pull configuration
  ack_deadline_seconds = 10  # Adjust as needed
  message_retention_duration = "604800s"  # 7 days

  # Exactly once delivery and message ordering
  dead_letter_policy {
    max_delivery_attempts = 5
    dead_letter_topic     = google_pubsub_topic.example_topic.name
  }

  # Retry configuration
  retry_policy {
    minimum_backoff      = "5s"
    maximum_backoff      = "60s"
  }

  # Schema settings
  schema_settings {
    schema = google_pubsub_schema.example_schema.name
  }
}