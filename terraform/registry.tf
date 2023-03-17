resource "google_project_service" "project_service" {
  service = "artifactregistry.googleapis.com"

  project = var.project_id
  disable_on_destroy = false
}

resource "google_artifact_registry_repository" "todo-repo" {
    location        = var.region
    repository_id   = var.service
    format          = "DOCKER"
    depends_on      = [google_project_service.project_service]
}


