

variable "sg_name" {
  type = string
}


variable "sg_description" {
  type = string
  default = ""
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "sg_tags" {
  type = map(string)
  default = {
   
  }
  
}

variable "vpc_id" {
  type = string
}