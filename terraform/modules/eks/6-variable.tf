

variable "env" {
    description = "Environmental Variable"
    type = string
}

variable "eks_name" {
    description = "Name of EKS Cluster"
    type = string
}

variable "eks_version" {
    description = "Desired Kubernetes master version"
    type = string
}

variable "subnet_ids" {
    description = "List of subnet IDs."
    type = list(string)
}

variable "node_groups" {
    description = "EKS node groups"
    type = map(any)
}


variable "node_iam_policies" {
    description = "List of IAM Policies to attach to EKS-managed nodes"
    type = map(any)

    default = {
        1 = "arn:aws:iam::policy/AmazonEKSWorkerNodePolicy"
        2 = "arn:aws:iam::policy/AmazonEKS_CNI_Policy"
        3 = "arn:aws:iam::policy/AmazonEC2ContainerRegistryReadOnly"
        4 = "arn:aws:iam::policy/AmazonSSMManagedInstanceCore"
    }
}

variable "enable_irsa" {
    description = "Determines whether to create an OpenID connect Provider for EKS"
    type = bool
    default = true
}