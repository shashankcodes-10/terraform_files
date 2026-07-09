variable "instance_type"{
    default = "t3.micro"
    type = string
}

variable "ami_id"{
    default = "ami-0b6d9d3d33ba97d99"
    type = string
}

variable "volume_type"{
   default = "gp3"
   type = string
}

variable "volume_size"{
    default = 10
    type = number
}

variable "instance_name"{
    default = "terraform-first-instance"
    type = string
}

variable "key_name"{
    default = "terraform-key-pair"
    type = string
}

variable "security_group_name"{
    default = "terraform-security_group"
    type = string
}