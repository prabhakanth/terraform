variable "ami_id" {
    type = "string"
}

variable "instance_type" {
    type = "string"
}

variable "vpc_id" {
    type = "string"    #VPC ID of my account's default vpc
}

variable "port" {
    type = "number"
}

variable "cidr_block" {
    type = "string"
}
