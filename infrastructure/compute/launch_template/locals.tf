locals {
  github_token           = data.aws_ssm_parameter.github_token.value
  cloudfront_domain_name = var.cloudfront_domain_name
  gateway_api_url        = var.gateway_api_url

  user_data_app = <<-EOF
    #!/bin/bash

    ### Export variables
    echo "export CLOUDFRONT_ENDPOINT=${local.cloudfront_domain_name}" >> /etc/profile.d/env.sh
    echo "export LAMBDA_ENDPOINT=${local.gateway_api_url}" >> /etc/profile.d/env.sh
    chmod +x /etc/profile.d/env.sh
    source /etc/profile.d/env.sh

    ### Update packages and install Git
    yum update -y
    yum install git -y

    ### Install and run Docker
    amazon-linux-extras install docker -y
    service docker start
    systemctl enable docker
    usermod -a -G docker ec2-user

    ### Install docker-compose
     # Install Docker Compose
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

    ### Clone repository
    cd /home/ec2-user
    mkdir repo && cd repo
    chmod -R 777 .
    git clone https://${local.github_token}@github.com/KristianMeier/cvr-dk-clone.git .

    ### Run app with docker-compose
    ENV=prod docker-compose up
  EOF

  user_data_test = <<-EOT
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Dev - Test</h1>" > /var/www/html/index.html
    EOT
}