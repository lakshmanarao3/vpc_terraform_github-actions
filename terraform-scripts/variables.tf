variable "vpc_cidr" {
  type = string
}
variable "subnet_cidr" {
  type = list(string)
}
variable "my-pub-ip" {
  type = string
}
variable "public_key" {
  type = string
}