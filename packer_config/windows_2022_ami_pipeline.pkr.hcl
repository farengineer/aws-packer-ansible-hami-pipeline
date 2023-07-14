source "amazon-ebs" "ws22" {
  source_ami = data.amazon-ami.ws22.id

  skip_create_ami = var.dont_create_amis

  # Deprecate 120 days from creation date
  # UPDATE THIS: July 31st, Midnight - 120-ish days from March 31st 
  deprecate_at = "2023-07-31T00:00:00Z"

  # AMI CONFIG
  ami_name        = "Windows-Server-2022-${local.timestamp}"
  ami_description = "Windows Server 2022 default image with quartely patching. Built with Packer."
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
      "tag:Name" : "packer-hami-ec2-security-group",
      "vpc-id" : var.vpc_id,
      "description" : "Allow HTTP/HTTPS outbound for SSM. Allow SSH within the security group. DNS Outbound."
    }
  }
  user_data_file = "/tmp/packer/bootstrap_win.txt"
  communicator   = "winrm"
  winrm_username = "Administrator"
  winrm_use_ssl  = true
  winrm_insecure = true

  subnet_id = var.subnet_id
  vpc_id    = var.vpc_id
}

build {
  name = "windows_server_22"
  sources = [
    "source.amazon-ebs.ws22"
  ]

  provisioner "powershell" {
    inline = ["Invoke-Expression (Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/DarwinJS/Undo-WinRMConfig/master/Undo-WinRMConfig.ps1')"]
  }

  # No further commands other than copying image and tagging it above
}
