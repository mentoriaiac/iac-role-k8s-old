SHELL	 = /bin/bash

cnf ?= .env
ifneq ($(shell test -e $(cnf) && echo -n yes),yes)
	ERROR := $(error $(cnf) file not defined in current directory)
endif

include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

ifneq ($(shell test -e $(INCLUDE_MAKEFILE) && echo -n yes),yes)
	ifdef REMOTE_MAKEFILE
		REMOTE_MAKEFILE_RESULT := $(shell curl ${REMOTE_MAKEFILE} -o ${INCLUDE_MAKEFILE})
	else
		ERROR := $(error REMOTE_MAKEFILE not provided, look for your .env file)
	endif
endif

ifdef INCLUDE_MAKEFILE
	include ${INCLUDE_MAKEFILE}	
endif

## Local environment
URL_PACKER ?= https://releases.hashicorp.com/packer/1.7.3/packer_1.7.3_linux_amd64.zip


.PHONY = help
help: ## Mostra o help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/\t\t- /'

setup: ## Configure seu ambiente (considera -se uma versão linux debian ou derivados)
	@(command -v python3 && command -v pip3)  || \
			pip3 install -U pip -r packer/provisioners/ansible/requirements.txt
	@command -v packer || \
			(sudo apt install -yq wget && \
			wget -q ${URL_PACKER} -O /tmp/packer.zip &&  \
			sudo unzip -o /tmp/packer.zip -d /usr/local/bin)

## need implements the default targets for pipeline

build: ## packer image
	@cd packer \
		&& packer validate . \
		&& packer fmt -recursive \
		&& packer build .

deploy: 
	@echo "Não implementado ainda" 

pre_test: ## pre-validate the role and check if breaks
	@cd packer/provisioners/ansible/roles/kubeadm_docker_install &&
		molecule test
