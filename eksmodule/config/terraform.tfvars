aws_eks_cluster_config = {

  "demo-cluster" = {

    eks_cluster_name = "demo-cluster"
    eks_subnet_ids   = ["subnet-0781645f0d0b4e143", "	subnet-05e9bab78c8d0c63d", "subnet-00cdd62258b1d6836", "subnet-04114c58d06720300"]
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
    node_subnet_ids  = ["subnet-0781645f0d0b4e143", "	subnet-05e9bab78c8d0c63d", "subnet-00cdd62258b1d6836", "subnet-04114c58d06720300"]
    tags = {
      "Name" = "node2"
    }
  }
}
