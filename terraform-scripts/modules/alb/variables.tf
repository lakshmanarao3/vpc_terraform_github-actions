variable "sg-id" {
  type = string
}
variable "subnets" {
  type = list(string)
}
variable "vpc-id" {
  type = string
}
variable "ec2-ids" {
  type = list(string)
}