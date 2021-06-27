variable "roles_path" {
  type = string
  description = "Caminho das roles onde o ansible colocará as dependencias caso haja alguma"
  default = "provisioners/ansible/roles"
}

variable "ansible_detail_debug" {
  type = string
  description = "Nivel de Debug do ansible (v - vvvv)"
  default = "v"
}

variable "ansible_playbook_path" {
  type = string
  description = "Caminho onde o arquivo main do playbook do ansible estará"
  default = "provisioners/ansible"
}

variable "tags" {
  type = object({
    builder                    = string
    application                = string
    os                         = string
    version                    = string
    environment                = string
  })
  description = "Tag structure to be used as image and volume tags"
  default = {
    builder                    = "Packer"
    application                = "Kubernetes"
    os                         = "Debian/Ubuntu"
    version                    = "9/20"
    environment                = "dev"
  }
}