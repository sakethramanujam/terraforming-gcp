resource "google_cloudbuild_trigger" "terraform-trigger" {
  description  = "Terraform Trigger"
  project = ""
  included_files = ["terraform/*"]
  trigger_template {
    branch_name = "master"
    repo_name   = "${CURRENT_GCP_PROJECT_REPO}"
    dir = "terraform/"
  }
  filename = "terraform/cloudbuild.yaml"
}