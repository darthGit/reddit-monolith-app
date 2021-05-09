resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-db"]
  #ssh key
  metadata = {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }
  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = var.db_disk_image
    }
  }
  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config {
      nat_ip = "${google_compute_address.db_ip.address}"
    }
  }
}

resource "google_compute_address" "db_ip" {
  name = "reddit-db-ip"
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }
  source_tags = [ "reddit-app" ]
  target_tags   = ["reddit-db"]
}