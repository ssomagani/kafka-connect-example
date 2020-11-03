provider "google" {
  project = "fourth-epigram-293718"
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
}

resource "google_cloud_run_service" "my-service" {
  name     = "my-service"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us.gcr.io/fourth-epigram-293718/mysql"
        env {
          name = "MYSQL_DATABASE"
          value = "db"
        }
        env {
          name = "MYSQL_USER"
          value = "user"
        }
        env {
          name = "MYSQL_PASSWORD"
          value = "password"
        }
        env {
          name = "MYSQL_ROOT_PASSWORD"
          value = "password"
        }
        ports {
          container_port = "3306"
        }
        resources {
          requests = {
            memory = "1024Mi"
          }
          limits = {
            memory = "1024Mi"
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.run]
}

resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.my-service.name
  location = google_cloud_run_service.my-service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "url" {
  value = "${google_cloud_run_service.my-service.status[0].url}"
}
