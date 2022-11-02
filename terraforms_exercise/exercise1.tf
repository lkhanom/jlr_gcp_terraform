terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }

  backend "gcs" {
      bucket = "2022-jlr-temp-lippe-tfstate"
  }
}


provider "google" {
  project = "jlr-dl-cat-training"
  region  = "europe-west2"
}


resource "google_storage_bucket" "my_exercise_bucket" {
  name     = "2022-jlr-lippe-terraform"
  location = "EU"
}


resource "google_storage_bucket_object" "code_object" {
  name   = "hello.zip"
  bucket = google_storage_bucket.my_exercise_bucket.name
  source = "./hello.zip"
}