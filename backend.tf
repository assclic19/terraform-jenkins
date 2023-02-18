
terraform {
  backend "s3" {
    bucket = "jenkins-s3-storer"
    key = "state/terraform.state"
    region = "us-east-1"
    
  }
}