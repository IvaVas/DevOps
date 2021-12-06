provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "webserver" {
  ami                    = "ami-0a49b025fffbbdac6"
  instance_type          = "t2.micro"
  key_name = "ssh-key"
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install apache2 -y
  sudo service apache2 start
EOF

}



resource "aws_security_group" "web" {
  name = "web Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_key_pair" "deployer" {
  key_name = "ssh-key"  
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFYL8lM83P/TYuEmidXVrs9VttxOT8SN/815uWdAYgVKCFlnYSSaptH/UPjnw3seVhDmIYswylHnAQv2gsPeRo6/HbZVDabAHNQSqhO2sJr7i6HImbRUmDJ1I7cI0PJYjgEiKXuX7VELHrSumueP1/dprx5bOrKhCbKl0nZ7T4ElqfPYdeQ0jcOBWljH/eKAHdIM6PdDMjahhNb0wOGpLom4fSp1k1/j9n44g6Efl2IgOXriUfHECfMktMM/DmNw8X9YF/VoaI9MIZmDunK1av00rl+9wmv4zXtfFPiFNbnrWu8wQpV9KfF+zDaBuBvcDjHdCaTSTHKf2q/boXZefn Ivan@AntiX"
}