# huaweicloud
# https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs
terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.59.0"
    }
  }
}

provider "huaweicloud" {
  # Configuration options
  region     = "cn-north-4"
  access_key = "BXAQxxxxxxxxxxW9YCEA"
  secret_key = "pPUA0aCGPxxxxxxxxxxxxxxxxxxxx3MxNwniyRq9"
}

data "huaweicloud_images_image" "ubuntu" {
  name        = "Ubuntu 18.04 server 64bit"
  visibility  = "public"
  most_recent = true
}

data "huaweicloud_vpc" "selectvpc" {
  name = "cce-beijing"
}


# create eip
resource "huaweicloud_vpc_eip" "eip" {
  name          = "eip"
  charging_mode = "postPaid"
  publicip {
    type       = "5_bgp"
    ip_version = 4 # ipv4
  }

  bandwidth {
    name        = "test"
    share_type  = "PER"
    size        = 1
    charge_mode = "bandwidth"
  }
}

