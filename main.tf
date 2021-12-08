terraform {
  backend "s3" {
    endpoint                    = "nyc3.digitaloceanspaces.com"
    region                      = "us-west-1"
    key                         = "terraform.tfstate"
    bucket                      = "kube-terraform-state"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}

resource "digitalocean_kubernetes_cluster" "do-kubernetes-challenge" {
  name   = "do-kubernetes-challenge"
  region = "nyc3"
  version = "1.21.5-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3

    taint {
      key    = "workloadKind"
      value  = "database"
      effect = "NoSchedule"
    }
  }
}


