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
    key_name = "jobs2mon"
    security_groups = ["${aws_security_group.allow_all.name}"]
 
}

 connection {
    user        = "ubuntu"
    private_key = "${file(var.privatekeypath)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install tomcat7 -y",
      "sudo apt-get install software-properties-common -y",
      "sudo apt-repository ppa:ansible/ansible -y",
      "sudo apt-get update",
      "sudo apt-get install ansible -y"
         ]
  }
