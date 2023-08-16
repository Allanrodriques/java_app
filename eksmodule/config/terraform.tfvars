aws_eks_cluster_config = {

  "demo-cluster" = {

    eks_cluster_name = "demo-cluster1"
    eks_subnet_ids   = ["subnet-6ba1850d", "subnet-869fbca7", "subnet-b2bfd783", "subnet-6f47b323"]
    tags = {
      "Name" = "demo-cluster"
    }
  }
}

eks_node_group_config = {

  "node1" = {

    eks_cluster_name = "demo-cluster"
    node_group_name  = "mynode"
    nodes_iam_role   = "eks-node-group-general1"
    node_subnet_ids  = ["subnet-6ba1850d", "subnet-869fbca7", "subnet-b2bfd783", "subnet-6f47b323"]

    tags = {
      "Name" = "node1"
    }
  }
}
