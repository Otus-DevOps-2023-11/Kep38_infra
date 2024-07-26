<<<<<<< HEAD
terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.124.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "app" {
  name  = "reddit-app-${count.index}"
  count = 2  

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

=======
provider "yandex" {
  token     = "token"
  cloud_id  = "cloud-id"
  folder_id = "folder-id"
  zone      = "ru-central1-a"
}
resource "yandex_compute_instance" "app" {
  name = "reddit-app-${count.index}"
  count = var.app_count
  resources {
    cores  = 2
    memory = 16
  }
  boot_disk {
    initialize_params {
      # Óêàçàòü id îáðàçà ñîçäàííîãî â ïðåäûäóùåì äîìàøåì çàäàíèè
      image_id = var.image_id	
    }
  }
  network_interface {
    # Óêàçàí id ïîäñåòè default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }
>>>>>>> origin/terraform-1
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
<<<<<<< HEAD
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }

=======
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # ïóòü äî ïðèâàòíîãî êëþ÷à
    private_key = file(var.private_key_path)
  }
>>>>>>> origin/terraform-1
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
<<<<<<< HEAD

=======
>>>>>>> origin/terraform-1
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}
<<<<<<< HEAD

=======
>>>>>>> origin/terraform-1
