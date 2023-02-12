provider "aws"{
  shared_config_files      = ["/home/nathan/.aws/config"]
  shared_credentials_files = ["/home/nathan/.aws/credentials"]
  profile                  = "terraform"
}