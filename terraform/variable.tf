variable "project_id" {
  description = "gcp project id"
}

variable "region" {
  description = "region"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "service" {
  description = "Name of the Google Cloud Source Repository to create."
  type        = string
}

variable "github_repository" {
    default = "gke-todo-mission"
}

variable "github_owner" {
    default = "boyangdong00"
}

variable "github_branch" {
    default = "^main$"
}