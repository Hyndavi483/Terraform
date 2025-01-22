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

To Overcome the Drawbacks of terraform we have remote backend:
We can store the state file in S3 bucket. Instead of your state file getting created in local it is getting created and updated in S3.
Terraform cloud → we can host the backend in terraform cloud.
