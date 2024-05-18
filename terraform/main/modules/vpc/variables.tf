variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "tag_owner" {
  description = "The tag of owner."
  type        = string
}