<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/4f1902e3-14ed-4c0c-a347-1d7a1d193a54" />


## AWS | API Gateway + S3
This architecture demonstrates a simple cloud-based static website delivery system using three primary services from Amazon Web Services:


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

