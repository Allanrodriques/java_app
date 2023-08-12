region     = "us-east-2"
access_key = "AKIAW4VHLHP5FKEE6WHG"
secret_key = "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"


aws_eks_cluster_config = {

  "demo-cluster" = {

    eks_cluster_name = "demo-cluster1"
    eks_subnet_ids   = ["subnet-05fbc2aea2bc336ca", "subnet-01ae9feb3d96a0cf6", "subnet-0550bd0365b6e0041"]
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
    node_subnet_ids  = ["subnet-05fbc2aea2bc336ca", "subnet-01ae9feb3d96a0cf6", "subnet-0550bd0365b6e0041"]

    tags = {
      "Name" = "node1"
    }
  }
}
