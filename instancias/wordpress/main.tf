data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "wordpress" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  key_name                    = "projeto_elven"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  user_data = base64encode(
    templatefile("${path.module}/ec2_setup.sh", {
      wp_db_name      = var.wp_db_name
      wp_db_username  = var.wp_db_username
      wp_db_password  = var.wp_db_password
      wp_db_host      = var.wp_db_host
    })
  )

  tags = {
    Name       = var.nome
    Env        = var.environment
    Plataform = data.aws_ami.ubuntu.platform_details
  }
}
