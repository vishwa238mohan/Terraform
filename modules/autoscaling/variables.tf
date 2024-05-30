variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "min_size" {
  type = string
}
variable "max_size" {
  type = string
}
variable "desired_capacity" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}

variable "scale_up_adjustment" {
  type = string
}
variable "cooldown" {
  type = string
}

variable "scale_down_adjustment" {
  type = string
}

