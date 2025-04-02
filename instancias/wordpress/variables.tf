variable "nome" {
  type        = string
  description = "Nome da instancia"
}

variable "environment" {
  type        = string
  description = "Ambiente da instancia"
  default     = "dev"
}

variable "ami" {
  type = string
  description = "AMI da instancia"
}
variable "wp_db_name" {
    description = "The name of the WordPress database"
    type        = string
    default     = "wordpress"
}

variable "wp_db_username" {
    description = "The username for the WordPress database"
    type        = string
    default     = "wpuser"
}

variable "wp_db_password" {
    description = "The password for the WordPress database"
    type        = string
    default     = "wppassword"
}

variable "wp_db_host" {
    description = "The password for the WordPress database"
    type        = string
    default     = "Localhost"
}