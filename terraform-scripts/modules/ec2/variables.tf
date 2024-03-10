variable "sgs_id" {
  type = string
}
variable "subnets" {
  type = list(string)
}
variable "ec2-names" {
  type = list(string)
  default = [ "server1","server2" ]
}

variable "public-key" {
  type = string
}