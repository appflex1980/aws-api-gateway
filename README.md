

## AWS | API Gateway + S3
Architecture with public and private subnets, an ApiGateway and S3 Bucket 


🎯 Architecture Overview
```
✅ AWS VPC
✅ AWS S3 static website
✅ AWS API Gateway acting as a frontend or proxy
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

