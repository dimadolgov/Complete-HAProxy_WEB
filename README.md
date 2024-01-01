# Infrastructure as Code with Terraform

This repository contains Terraform code for provisioning and managing AWS infrastructure for a web application with HAProxy.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Outputs](#outputs)
- [Additional Information](#additional-information)
- [Contributing](#contributing)
- [License](#license)

## Overview

This Terraform configuration sets up a scalable web application infrastructure on AWS. It includes the following components:

- Virtual Private Cloud (VPC)
- Public and private subnets
- Internet Gateway
- AWS Security Groups
- EC2 Instances for HAProxy and web servers

The web servers are configured with a basic user data script, and HAProxy dynamically fetches the private IP addresses of web servers to distribute traffic.

## Prerequisites

Before using this Terraform configuration, ensure that you have the following prerequisites:

- [Terraform](https://www.terraform.io/) installed.
- AWS credentials configured.

## Getting Started

1. Clone the repository:

    ```bash
    git clone https://github.com/dimadolgov/WEB_HAProxy.git
    cd terraform-aws-web-haproxy
    ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Customize variables in `terraform.tfvars` or create your own configuration file.

4. Deploy the infrastructure:

    ```bash
    terraform apply
    ```

5. Confirm the changes by entering 'yes' when prompted.

## Outputs

After successfully deploying the infrastructure, the following outputs will be available:

- `Name`: Names of the EC2 web server instances.
- `instance_ids`: IDs of the EC2 web server instances.
- `private_ip_addresses`: Private IP addresses of the EC2 web server instances.
- `public_ip_addresses`: Public IP addresses of the EC2 web server instances.
- `instance_ip`: List of all private IP addresses of the EC2 web server instances.
- `instance_name`: List of all names (tags) of the EC2 web server instances.

## Additional Information

- The `web_haproxy` security group allows traffic on specified ports and enables communication between instances.
- Customization options are available in `variables.tf`. Adjust as needed for your specific use case.

## Contributing

If you'd like to contribute to this project, please follow the [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE.md).
