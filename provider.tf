provider "aws" {
  region  = "us-east-1"
  profile = "destination"

  assume_role {
    role_arn     = "arn:aws:iam::226847902577:role/mainaccount-role"
  }
}