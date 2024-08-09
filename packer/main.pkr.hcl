packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}


source "amazon-ebs" "Hash-proj-dev" {
  ami_name      = local.image-name
  source_ami    = var.ami_id
  instance_type = var.instance_type
  ssh_username  = "ec2-user"
  tags = {
    Name    = local.image-name
    project = var.project_name
    env     = var.project_env
  }
}

build {
  sources = ["amazon-ebs.Hash-proj-dev"]

  provisioner "file" {
    source      = "../website"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script           = "./setup.sh"
    execute_command  = "sudo {{.Path}}"
  }
}






