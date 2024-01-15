# Infrastructure as Code with Terraform

This repository contains Terraform code for provisioning and managing AWS infrastructure for a web application with HAProxy.
The end result will allow you to access your server "haproxy" using public ip address and each new web request will be answered by different web server

1. Clone the repository:

    ```bash
    git clone https://github.com/dimadolgov/WEB_HAProxy.git
    ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```
    
3. Deploy the infrastructure:

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
