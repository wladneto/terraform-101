resource "aws_instance" "webserver" {
  ami           = var.ami_id
  instance_type = var.instance_type

  key_name        = var.key_name
  subnet_id       = var.public_subnet_id
  security_groups = [var.security_group_id]

  # Configuração para tornar a instância acessível através do Elastic IP
  associate_public_ip_address = true

  tags = {
    Name = "WebServer"
    Owner = var.tag_owner
  }

  user_data = <<-EOF
              #!/bin/bash
                apt-get update -y
                apt-get install nginx -y
                systemctl start nginx
                systemctl enable nginx
                echo "<h1>Deployado via Terraform</h1> Wlad" > /var/www/html/index.html
                EOF
}

resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3N YOURKEY"
}

