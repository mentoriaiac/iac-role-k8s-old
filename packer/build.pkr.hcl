build {
  sources = [""]

    provisioner "ansible" {
    // Use apenas queria uma configuração customizada e geral
    // para o playbook do sua role.
    //"ANSIBLE_CONFIG=./provisioners/ansible/ansible.cfg",

    ansible_env_vars = [
      // Essa variável indicara onde serão baixados as roles
      // quando necessário, e deveria respeitar estrutura de 
      // pastas sendo essa sugerida, ou outra
      "ANSIBLE_ROLES_PATH=${var.roles_path}"
    ]

    // Bloco de parametros passados para o ansible durante a 
    // execução do ansible-playbook, por exemplo.
    extra_arguments = [
      // Configuração de nivel de debug durante a execução
      // do playbook do ansible
      format("-%s", var.ansible_detail_debug),
    ]
    
    // Arquivo principal, ou de chamada das roles a serem executadas
    playbook_file = format("%s/main.yml", var.ansible_playbook_path)

    // configuração para realizar o download de modulos do ansible 
    // que estejam distribuídos ou mantidos em repositórios diferentes
    galaxy_file = format("%s/requirements.yml", var.ansible_playbook_path)
    roles_path  = var.roles_path
  }

  // Limpa a maquina de alguns logs
  provisioner "shell" {
    inline = [
      "sudo rm -rf /var/log/messages",
      "sudo rm -rf /var/log/secure",
      "sudo rm -rf /var/log/cloud-init.log",
      "sudo rm -rf /var/log/cloud-init-output.log",
      "sudo rm -rf /var/log/boot.log"
    ]
  }

}
