source "amazon-ebs" "ubuntu20" {
  source_ami = data.amazon-ami.ubuntu20.id

  skip_create_ami = var.dont_create_amis

  # Deprecate 120 days from creation date
  # UPDATE THIS: July 31st, Midnight - 120-ish days from March 31st 
  deprecate_at = "2023-07-31T00:00:00Z"

  # AMI CONFIG
  ami_name        = "Ubuntu20-${local.timestamp}"
  ami_description = "Ubuntu 20 default image with quartely patching. Built with Packer."
  ami_regions     = var.ami_deployment_regions
  ami_org_arns    = var.ami_deployment_org_arns
  tags            = { "Builder" : "Packer", "SecurityAMI" : "Approved", "CIS" : "0" }

  # EC2 CONFIG
  instance_type        = "t2.medium"
  region               = var.region
  iam_instance_profile = var.instance_profile_name
  # security_group_id    = var.security_group_id
  security_group_filter {
    filters = {
      "tag:Name" : "packer-hami-ec2-security-group"
      "vpc-id" : var.vpc_id
      "description" : "Allow HTTP/HTTPS outbound for SSM. Allow SSH within the security group. DNS Outbound."
    }
  }

  subnet_id    = var.subnet_id
  vpc_id       = var.vpc_id
  ssh_username = "ubuntu"
}

build {
  name = "ubuntu20"
  sources = [
    "source.amazon-ebs.ubuntu20"
  ]

  provisioner "shell" {
    execute_command = "sudo su"
    inline = [
      "echo '# Added for forwarding the logs to Sentinel reporting server for monitoring' >> /etc/rsyslog.conf",
      "echo '*.info @127.0.0.1' >> /etc/rsyslog.conf",
      "echo '# Add ends' >> /etc/rsyslog.conf"
    ]
  }

  # No further commands
}
