provide "aws"{
		region = "ap-south-1"
}
import {
  to = aws_instance.example
  id = "i-abcd1234"
}

Then initialize the terraform 

Run the Below Command 
terraform plan -generate-config-out="generated_resources.tf"

Then generated_resources.tf will contain all configuration copy them and paste it in main.tf

And run the terraform import aws_instance.example instance-id

Then run the terraform plan
It should show No changes. Your infrastructure matches the configuration..
