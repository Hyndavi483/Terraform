# Terraform EC2

Ec2 Creation --> About how to create Ec2 instance
Creating Modular Infrastructure with Terraform Modules Unlock the potential of reusability with Terraform modules. Understand how modules enable you to create shareable and organized infrastructure components.

Local Values and Data Sources Simplify complex expressions using local values. Dive into data sources and learn how to fetch data from existing resources or external systems, enhancing your configurations' flexibility.

Using Variables and Inputs with Modules Explore the versatility of using variables within modules to customize their behavior. Learn how inputs work within modules and the benefits they offer.

Leveraging Outputs from Modules Utilize module outputs to access critical information or propagate data to your root configuration. Learn how to make your modules more informative and useful.

Exploring Terraform Registry for Modules Embark on a journey through the Terraform Registry. Discover pre-built, community-contributed modules and learn how to incorporate them into your own configurations.

Creation of ec2 instance by using terraform script

Provider: A plugin that helps terraform to create on which resources Basic Provider block: Provider "aws"{ }

We will create a main.tf, input.tf, output.tf, terraform.tfvars files.

Main.tf --> We will mention what are the values should be passed

Input.tf --> We will declare the variable

Output.tf --> We will ask the script to provide the output of particular variables

Terraform.tfvars --> We will pass the values to variables. Along with input.tf, output.tf we can create tfvars. Only in tfvars can we change the values. In input we will create a variable and pass the value in tfvars.


Terraform state file: Heart of terraform script. 

Adv: Useful to record the infrastructure that is created and update the information of created infrastructure. We can destroy the infrastructure of the created instance.

Drawbacks: 
Any action you want to perform with a terraform script will take information and record it in a state file → for example you want to save the sensitive information. 
If you are using Github (VCS) and a devops engineer made a code change of terraform script in his local area then he needs to merge the code changes and state file as well. If they forgot to update the state file then it will throw some errors.

Why do you need output.tf we have all data available in the state file?
For Developers we won't give access to state file

Terraform show: Give all the details of state file

How to initialize the remote backend:
backend.tf
terraform {
  backend "s3" {
    bucket         = "abhishek-s3-demo-xyz" # change this
    key            = "abhi/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

We can implement the  locking in DynamoDB. If we have multiple people updating the same script then we need to use a lock file. Since we are using statefile to store in S3 bucket

First create S3 bucket, DynamoDB and implement the instance

Terraform Provisioning and Provisioners: 
Provisioner is a concept in terraform that allows you to copy and execute creation and destruction.

Why Provisioners?
We can create the instances but we cannot deploy the applications or install softwares.
So terraform provide 2 features:
Remote exec: you can run the commands while creation only.
Local exec: If we have more no of lines as output we can save it in one file.
File: Used to copy files from source to destination.

We want to deploy an application on an ec2 instance without writing the user data by using provisioners.

We need to create ssh-keygen -t rsa for VPC creation

Terraform script → VPC → Public subnet → Route table —> Ec2
To Overcome the Drawbacks of terraform we have remote backend:
We can store the state file in S3 bucket. Instead of your state file getting created in local it is getting created and updated in S3.
Terraform cloud → we can host the backend in terraform cloud.
In Terraform in bound configuration represented using Ingress
Out-bound Configuration → Egress

Using Provisioners we can deploy applications in instances by using terraform script.
