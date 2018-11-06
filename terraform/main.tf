provider "aws" {
    region = "${var.region}"
    access_key = "${var.access}"
    secret_key = "${var.secret}"
  
}


resource "aws_instance" "web" {
  
}

output "outputofweb" {
  value = "value"
}

