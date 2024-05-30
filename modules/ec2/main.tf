resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  security_groups = [var.security_group_id]

  tags = {
    Name = "main_instances"
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key =  file("./EC2 learning.pem")
    host     = self.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]
  }
}


