locals {
  vm_user             = "sfadmin"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  zone1               = "ru-central1-a"
  zone2               = "ru-central1-b"
  cidr1               = ["192.168.10.0/24"]
  cidr2               = ["192.168.20.0/24"]
  image1              = "lemp"
  image2              = "lamp"
}

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.102.0"
    }
  }
  required_version = "1.5.7"
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "larkind"
    region                      = "ru-central1-a"
    key                         = "IPR1/terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    access_key                  = "YCAJEAVTICpjrCou7jELWOh9I"
    secret_key                  = "YCNMCU8_LCEHZrc-k8oE9UR_xQhVXiZAz_H9gCJD"
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}


resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet_10" {
  name           = "subnet1"
  v4_cidr_blocks = local.cidr1
  zone           = local.zone1
  network_id     = yandex_vpc_network.network.id
}

resource "yandex_vpc_subnet" "subnet_20" {
  name           = "subnet2"
  v4_cidr_blocks = local.cidr2
  zone           = local.zone2
  network_id     = yandex_vpc_network.network.id
}

module "vm1" {
  source          = "./modules/instance"
  vm_name         = "vm1"
  vm_image_family = local.image1
  subnet_id       = yandex_vpc_subnet.subnet_10.id
  zone            = local.zone1
  vm_user         = local.vm_user
}

module "vm2" {
  source          = "./modules/instance"
  vm_name         = "vm2"
  vm_image_family = local.image2
  subnet_id       = yandex_vpc_subnet.subnet_20.id
  zone            = local.zone2
  vm_user         = local.vm_user
  ssh_key_path    = local.ssh_public_key_path
}

resource "yandex_lb_target_group" "web_servers_group" {
  name = "web-servers-group"
  target {
    subnet_id = yandex_vpc_subnet.subnet_10.id
    address   = module.vm1.internal_ip
  }
  target {
    subnet_id = yandex_vpc_subnet.subnet_20.id
    address   = module.vm2.internal_ip
  }
}
resource "yandex_lb_network_load_balancer" "web_load_balancer" {
  name = "web-load-balancer"
  listener {
    name = "ext-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }

  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.web_servers_group.id
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
