module "elven" {
  source      = "./instancias/wordpress"
  nome        = "projeto_elven"
  ami         = var.ami
}

##module "elven" {
##  source      = "./instancias/wordpress"
##  nome        = "projeto_elven"
##  ami         = var.ami
##}