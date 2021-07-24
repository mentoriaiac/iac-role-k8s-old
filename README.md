# iac-role-k8s - Role Ansible

## Dependências
Para realizar os teste localmente é necessário a instalação das seguintes dependências:

* [Python](https://www.python.org/downloads/)
* [Molecule](https://molecule.readthedocs.io/en/latest/installation.html)

## Preparando o ambiente

Crie um ambiente python

    $ python3 -m venv .venv

Ative o ambiente

    $ source .venv/bin/active

Instale dentro do ambiente o molecule (e suas dependencias) e o [pytest-testinfra](https://testinfra.readthedocs.io/en/latest/)

    (venv)$ python3 -m pip install "molecule[docker,lint]" pytest-testinfra

## Executando

    (venv)$ molecule test

Para realizar teste rápido após alguma modificação

    (venv)$ molecule create
    (venv)$ molecule converge
    (venv)$ molecule verify

Ao termino do teste, destrua o ambiente

    (venv)$ molecule destroy


Kubeadm install
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
