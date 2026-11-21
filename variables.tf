# modules/ec2-server/variables.tf
variable "name" {
  description = "Nom logique du serveur (web, monitoring...)"
  type        = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type = string
}

variable "admin_cidr" {
  description = "CIDR autorise en SSH"
  type        = string

  validation {
    condition     = var.admin_cidr != "0.0.0.0/0" && can(cidrhost(var.admin_cidr, 0))
    error_message = "admin_cidr doit etre un CIDR valide et ne peut pas etre 0.0.0.0/0."
  }
}

variable "open_ports" {
  description = "Ports TCP ouverts a tout Internet (ex : [80])"
  type        = list(number)
  default     = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "name_prefix" {
  description = "Prefixe des noms AWS"
  type        = string
  default     = "medilab"
}

variable "description" {
  description = "Description du Security Group (defaut generique si null)"
  type        = string
  default     = null
}

variable "enable_monitoring_port" {
  description = "Ouvre le port 9100 (node exporter) au CIDR administrateur"
  type        = bool
  default     = false
}
