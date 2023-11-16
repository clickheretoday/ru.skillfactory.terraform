terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.102.0"
    }
  }
  required_version = ">=  0.13"

}

resource "yandex_compute_image" "vm-image" {
  source_family = var.vm_image_family
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = "standard-v3"
  zone        = var.zone
  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }
  boot_disk {
    initialize_params {
      image_id = yandex_compute_image.vm-image.id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
  }
}