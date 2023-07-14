variable "dont_create_amis" {
  type    = bool
  default = true
}

variable "ami_deployment_regions" {
  type = list(string)
  default = [
    "us-east-1",
    "us-east-2",
    "us-west-2",
    "eu-west-1",
    "eu-central-1",
    "eu-north-1",
    "ap-southeast-1",
    "ap-south-1",
    "sa-east-1"
  ]
}

variable "ami_deployment_org_arns" {
  type    = list(string)
  default = ["arn:aws:organizations::012345678912:organization/o-abcdefg"]
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "instance_profile_name" {
  type    = string
  default = "packer-hami-ec2-iam-role"
}

variable "subnet_id" {
  type    = string
  default = "subnet-abcdefg"
}

variable "vpc_id" {
  type    = string
  default = "vpc-abcdefg"
}

variable "al2_playbook" {
  type    = string
  default = "/tmp/packer/al2_cis_1/AMAZON2-CIS-devel/site.yml"
}

variable "rhel7_playbook" {
  type    = string
  default = "/tmp/packer/rhel7_cis_1/RHEL7-CIS-devel/site.yml"
}

variable "rhel8_playbook" {
  type    = string
  default = "/tmp/packer/rhel8_cis_1/RHEL8-CIS-devel/site.yml"
}

variable "rhel9_playbook" {
  type    = string
  default = "/tmp/packer/rhel9_cis_1/RHEL9-CIS-devel/site.yml"
}

variable "ubuntu20_playbook" {
  type    = string
  default = "/tmp/packer/ubuntu_cis_1/UBUNTU20-CIS-devel/site.yml"
}

variable "ws16_playbook" {
  type    = string
  default = "/tmp/packer/ws2016_cis_1/Windows-2016-CIS-devel/site.yml"
}

variable "ws22_playbook" {
  type    = string
  default = "/tmp/packer/ws2022_cis_1/Windows-2022-CIS-devel/site.yml"
}
