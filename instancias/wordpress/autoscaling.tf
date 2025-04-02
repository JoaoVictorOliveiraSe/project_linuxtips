resource "aws_launch_template" "wordpress_lt" {
  name_prefix         = "wordpress-template"
  image_id            = var.ami
  instance_type       = "t3.micro"
  key_name            = "wordpress"

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = module.vpc.public_subnets[0] # Usando a primeira sub-rede pública
      security_groups             = [aws_security_group.wordpress_sg.id] # Referência ao Security Group criado
    }
  }

resource "aws_autoscaling_group" "wordpress_asg" {
  name                = "wordpress-asg"
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2
  vpc_zone_identifier = module.vpc.public_subnets # Usando todas as sub-redes públicas
  launch_template {
    id      = aws_launch_template.wordpress_lt.id
    version = "$Latest"
  }
}