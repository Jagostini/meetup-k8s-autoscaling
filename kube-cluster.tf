resource "google_container_cluster" "gc-euw3-k8s-meetup-lab" {
  name               = "gc-euw3-k8s-meetup-lab"
  region               = "europe-west3"

  min_master_version = "1.11.7-gke.12"
  node_version = "1.11.7-gke.12"
  network = "default"
  subnetwork = "default"

  remove_default_node_pool = true
  initial_node_count = 1

  ip_allocation_policy {
    use_ip_aliases = true

  }

}

resource "google_container_node_pool" "autoscaling-pool" {
  name       = "autoscaling-pool"
  region     = "europe-west3"
  cluster    = "${google_container_cluster.gc-euw3-k8s-meetup-lab.name}"
  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }


  management {
    auto_repair = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
