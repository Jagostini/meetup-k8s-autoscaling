provider "google" {
  project = "kedare-lab"
  region  = "europe-west3"
}


terraform {
  backend "gcs" {
    bucket = "kedare-lab-tf"
  }
}
