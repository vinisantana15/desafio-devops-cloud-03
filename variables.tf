variable "aws_region" {
  description = "Regiao usada para criar os recursos AWS"
  type = string
  nullable = false
}
variable "aws_vpcname" {
  description = "Nome da VPC"
  type = string
  nullable = false
}
variable "var.aws_vpc_cidr" {
  description = "CIDR da VPC"
  type = string
  nullable = false
}
variable "var.aws_azs" {
  description = "Zonas de disponibilidade"
  type = set(string)
  nullable = false
}
variable "var.aws_private_subnets" {
  description = "Subnets privadas"
  type = set(string)
  nullable = false
}
variable "var.aws_public_subnets" {
  description = "Subnets publicas"
  type = set(string)
  nullable = false
}
variable "var.aws_eks_name" {
  description = "EKS name"
  type = string
  nullable = false
}
variable "var.aws_eks_version" {
  description = "EKS version"
  type = string
  nullable = false
}
variable "var.eks_managed_node_groups_instance_types" {
  description = "Instance types for managed node groups"
  type = set(string)
  nullable = false
}
variable "var.aws_project_tags" {
    description = "Tags do projeto"
    type = map(any)
  nullable = false
  
}