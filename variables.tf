#when u just declare variable without any default then it will become mandatory value to be supplied by user. 
#terraform will ask as prompt or else show error if user didn't provide this value.

variable "sg_name" {
  type = string
}

#if we declare variable value with default then terraform will not give any error even if user dont provide a value.

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