output "instance_ip_addr" {
    value = aws_instance.wordpress.private_ip
}

output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "IDs das Subnets Públicas"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "IDs das Subnets Privadas"
  value       = module.vpc.private_subnets
}

output "vpc_cidr_block" {
  description = "Bloco CIDR da VPC"
  value       = module.vpc.vpc_cidr_block
}