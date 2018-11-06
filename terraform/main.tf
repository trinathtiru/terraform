provider "aws" {
    region = "${var.region}"
    access_key = "${var.access}"
    secret_key = "${var.secret}"
  
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpcid}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "web" {
    ami = "ami-0f65671a86f061fcd"
    instance_type = "t2.micro"
    key_name = "job2mon"
    security_groups = ["${aws_security_group.allow_all.name}"]
 
}
