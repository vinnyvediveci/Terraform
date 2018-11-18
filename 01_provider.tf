provider "google" {
    credentials = "${file("~/terraform/terraform_key.json")}"
    project = "terraform-instance"
    region = "europe-west2-c"
}

