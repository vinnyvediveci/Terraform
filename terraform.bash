#!/bin/bash

# Downloads and installs terraform


remote_zip="https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip"
local_zip="/tmp/terraform.zip"
wget "${remote_zip}" -O "${local_zip}"
sudo unzip $local_zip -d /opt/terraform/
sudo ln -s /opt/terraform/terraform /usr/bin/terraform
