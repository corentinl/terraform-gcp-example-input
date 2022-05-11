resource "google_service_account" "sa-demo01" {
  account_id   = "sa-demo"
  display_name = "Service Account pour test de demo"
}

resource "random_shuffle" "zone" {
  input        = var.zone_name
  result_count = 1
}

resource "google_compute_instance" "instance01" {
  name         = var.instance_name
  machine_type = "f1-micro"
  zone         = random_shuffle.zone.result

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.sa-demo01.email
    scopes = ["cloud-platform"]
  }
}
