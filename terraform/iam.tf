resource "google_project_iam_member" "cloudbuild-iam" {
    project = var.project_id
    role    = "roles/iam.serviceAccountUser"
    member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild-gke" {
    project = var.project_id
    role    = "roles/container.developer"
    member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "allow_image_pull" {
  project = var.project_id
  role   = "roles/artifactregistry.admin"
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}