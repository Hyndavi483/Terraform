provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://13.203.192.153:8200/"
  skip_child_token = true

  auth_login {
    path = "auth/terraform/login"

    parameters = {
      role_id = "21ed0d85-804d-fe64-6f75-3207d0b0f9f0"
      secret_id = "8461e743-ef36-8b65-b780-1f6e9c275c8f"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-00bb6a80f01f03502"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
