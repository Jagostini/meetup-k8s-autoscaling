provider "google" {
  project = "kedare-lab"
  region  = "europe-west1"
}


terraform {
  backend "gcs" {
    bucket = "kedare-lab-tf"
  }
}
