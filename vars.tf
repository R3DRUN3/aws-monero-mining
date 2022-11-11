
variable "ec2_ami" {
  type = map

  default = {
    # change ami here if you want 
    eu-central-1 = "ami-0caef02b518350c8b"
  }
}

# Change default region here if you want

variable "region" {
  default = "eu-central-1"
}


# Creating a Variable for instance_type
variable "instance_type" {    
  type = string
}

variable "instance_count" {
  # change the number of instances here
  default = "2" 
}

variable "ip_list" {
  description = "Allowed IPs"
  type = list(string)
  default = [
    "0.0.0.0/0",
  ]
}

variable "port_list" {
  description = "Allowed ports"
  type = list(number)
  default = [
    22, # only allow ssh connection
  ]
}

variable "sec_group_name" {
  default = "XMR Miners"
}

variable "sec_group_description" {
  default = "XMR Miners Security Group"
}