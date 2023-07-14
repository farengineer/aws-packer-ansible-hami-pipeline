data "amazon-ami" "al2" {
  filters = {
    name                = "*amzn2-ami-kernel-5.10-hvm*" # most recent version of AL2
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }

  region      = var.region
  most_recent = true
  owners      = ["137112412989"] # AWS managed account
}

data "amazon-ami" "debian11" {
  filters = {
    name                = "debian-11-amd64*" # "debian-11-amd64-20230124-1270"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }

  region      = var.region
  most_recent = true
  owners      = ["136693071363"] # AWS managed account
}

data "amazon-ami" "rhel7" {
  filters = {
    name                = "RHEL-7.9_HVM*" # "RHEL-7.9_HVM-20221027-x86_64-0-Hourly2-GP2
    root-device-type    = "ebs"
    virtualization-type = "hvm"
    architecture        = "x86_64"
  }

  region      = var.region
  most_recent = true
  owners      = ["309956199498"] # AWS managed account
}

data "amazon-ami" "rhel8" {
  filters = {
    name                = "RHEL-8.7.0_HVM*" # "RHEL-8.7.0_HVM-20230330-x86_64-56-Hourly2-GP2"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
    architecture        = "x86_64"
  }

  region      = var.region
  most_recent = true
  owners      = ["309956199498"] # AWS managed account
}

data "amazon-ami" "rhel9" {
  filters = {
    name                = "RHEL-9.0.0_HVM*" # "RHEL-9.0.0_HVM-20230313-x86_64-43-Hourly2-GP2"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
    architecture        = "x86_64"
  }

  region      = var.region
  most_recent = true
  owners      = ["309956199498"] # AWS managed account
}

data "amazon-ami" "ubuntu20" {
  filters = {
    name                = "*ubuntu-focal-*" // # most recent version of Ubuntu
    root-device-type    = "ebs"
    virtualization-type = "hvm"
    architecture        = "x86_64"
  }

  region      = var.region
  most_recent = true
  owners      = ["099720109477"] # AWS managed account
}

data "amazon-ami" "ubuntu22" {
  filters = {
    name                = "*ubuntu-jammy-*" // # most recent version of Ubuntu
    root-device-type    = "ebs"
    virtualization-type = "hvm"
    architecture        = "x86_64"
  }

  region      = var.region
  most_recent = true
  owners      = ["099720109477"] # AWS managed account
}

data "amazon-ami" "ws16" {
  filters = {
    name                = "Windows_Server-2016-English-Full-Base*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }

  region      = var.region
  most_recent = true
  owners      = ["801119661308"] # AWS managed account
}

data "amazon-ami" "ws22" {
  filters = {
    name                = "Windows_Server-2022-English-Full-Base*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }

  region      = var.region
  most_recent = true
  owners      = ["801119661308"] # AWS managed account
}
