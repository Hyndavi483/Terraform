provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://15.206.88.197:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "d4ba84e8-63c4-d12b-836a-96f797a56b71"
      secret_id = "bc732d1e-854e-9e4e-5151-24a8e011019e"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "example" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
