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
        _CLUSTER_NAME   = google_container_cluster.primary.name
    }

    filename = "cloudbuild.yaml"
}