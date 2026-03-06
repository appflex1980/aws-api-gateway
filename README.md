

## AWS | API Gateway + S3
Architecture with public and private subnets, an ApiGateway and S3 Bucket 


🎯 Architecture Overview
```
✅ VPC containing Public and Private Subnets
✅ Internet Gateway for outbound internet access
✅ NAT Gateway in the public subnet for private subnet egress
✅ Auto Scaling Group (ASG) using a Launch Template
✅ EC2 instances in the ASG, scaling in/out automatically
✅ Users hitting the system via the public internet
✅ Private resources (like RDS, caches) in the private subnets
```


🧱 Features
```
✔ Fully automated provisioning with Terraform
✔ High availability using multiple subnets in different Availability Zones
✔ Secure connectivity between Application and RDS
✔ Configurable environment variables for database credentials
✔ Easy to extend for other JSON data source
```



🚀 Deployment Options
```
terraform init
terraform validate
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars" -auto-approve
```

