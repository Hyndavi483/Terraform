
Creating Modular Infrastructure with Terraform Modules
Unlock the potential of reusability with Terraform modules. Understand how modules enable you to create shareable and organized infrastructure components.

Local Values and Data Sources
Simplify complex expressions using local values. Dive into data sources and learn how to fetch data from existing resources or external systems, enhancing your configurations' flexibility.

Using Variables and Inputs with Modules
Explore the versatility of using variables within modules to customize their behavior. Learn how inputs work within modules and the benefits they offer.

Leveraging Outputs from Modules
Utilize module outputs to access critical information or propagate data to your root configuration. Learn how to make your modules more informative and useful.

Exploring Terraform Registry for Modules
Embark on a journey through the Terraform Registry. Discover pre-built, community-contributed modules and learn how to incorporate them into your own configurations.


Creation of ec2 instance by using terraform script

Provider: A plugin that helps terraform to create on which resources 
Basic Provider block:
Provider "aws"{
}

We will create a main.tf, input.tf, output.tf, terraform.tfvars files. 

Main.tf --> We will mention what are the values should be passed

Input.tf --> We will declare the variable

Output.tf --> We will ask the script to provide the output of particular variables

Terraform.tfvars --> We will pass the values to variables. 
Along with input.tf, output.tf we can create tfvars. Only in tfvars can we change the values. In input we will create a variable and pass the value in tfvars.


