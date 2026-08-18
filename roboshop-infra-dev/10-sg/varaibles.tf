
variable "project" {
     type = string
  
}

variable "environment" {
     type = string
  
}

variable "frontend_sg_name" {
    default = "frontend"
}


variable "frontend_sg_description" {
    default = "created sg for frontend instance"
  
}



