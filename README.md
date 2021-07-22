Kubeadem install
=========

<!-- TODO - Configurar o "storage-driver": "overlay2" para docker -->

Requisitos
------------
Não existe um requisito para rodar a role em si. Porém para avaliar a role separadamente o [molecule](https://molecule.readthedocs.io/).

Variaveis Role
--------------
```yml
ubuntu:
  packages:
    # packages necessários 
  usuario_default: # usuario base do docker

# Instalação do K8s via gerenciador de pacotes
package:
  enabled: True
```
Dependências
------------

Nenhuma

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
```yml
    - hosts: all # include only 
      roles:
         - kubeadm_docker_install
```
License
-------

BSD

Author Information
------------------

Time de Mentroria de IaC.
