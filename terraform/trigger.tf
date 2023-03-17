resource "google_project_service" "service" {
    service =  "run.googleapis.com"

    project            = var.project_id
    disable_on_destroy = false
}


resource "google_cloudbuild_trigger" "deploy_trigger" {
    name = var.service

    github {
        name = var.github_repository
        owner = var.github_owner
        push {
            branch = var.github_branch
        }
    }

    substitutions = {
        _REGISTRY       = google_artifact_registry_repository.todo-repo.repository_id
        _REGISTRY_URL   = "${var.region}-docker.pkg.dev"
        _REGION         = var.region
        _PROJECT_NAME   = var.project_id
    }

    filename = "cloudbuild.yaml"
}