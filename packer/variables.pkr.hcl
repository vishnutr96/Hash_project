variable "project_name" {
  type        = string
  description = "name of the project"
 # default     = "shopping_app"
}

variable "project_env" {
  type        = string
  description = "product environment"
 # default     = "prod"
}

variable "instance_type" {
  type        = string
  description = "instance type"
 # default     = "t2.micro"
}

locals {
  image-timestamp = "${formatdate("DD-MM-YY-hh-mm", timestamp())}"
  image-name      = "${var.project_name}-${var.project_env}-${local.image-timestamp}"
}

variable "ami_id" {
  type        = string
  description = "id of ami"
  #default     = "ami-02e94b011299ef128"
}
