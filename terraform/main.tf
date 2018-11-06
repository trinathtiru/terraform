provider "aws" {
    region = "${var.region}"
    access_key = "${var.access}"
    secret_key = "${var.secret}"
  
}

resource "aws_instance" "web" {
    ami = "ami-0f65671a86f061fcd"
    instance_type = "t2.micro"
    key_name = "jobs2mon"
    security_groups = ["ALL TCP N PING"]
 
}
