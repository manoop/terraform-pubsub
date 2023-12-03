variable "project_id" {
  description = "Project id where service account will be created."
}


variable "schema_name" {
  description = "Schema name"
}

variable "schema_type" {
  description = "Schema type"
}

variable "topic_name" {
  description = "pub-sub topic name"
}

variable "subscription_id" {
  description = "The ID of the Pub/Sub subscription."
}

variable "schema_definition_file" {
  description = "Path to the file containing the schema definition."
}

variable "dead_letter_topic_name" {
   description = "Dead letter queue"
}