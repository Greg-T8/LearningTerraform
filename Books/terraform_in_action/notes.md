# My notes on "Terraform in Action" by Scott Winkler

<img src='images/20250413144136.png' width='250'/>

<details>
<summary>Book Resources</summary>

- [Book Code](https://github.com/terraform-in-action/manning-code)

</details>

## Helpful Commands

```cmd


```

## Terraform Resources
- [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### 1.2 Hello Terraform Example

**Scenario**: Use Terraform to deploy a virtual machine (EC2 instance) on AWS.

<img src="./images/20250421-ch01-terraform-hello-overview.svg" width="700"/>

The sequence of steps to deploy the EC2 instance using Terraform:

<img src="./images/20250421-ch01-terraform-hello-sequence.svg" alt="Sequence diagram showing the steps to deploy an EC2 instance using Terraform" width="600"/>

#### 1.2.1 Writing the Configuration

The HashiCorp Configuration Language (HCL)  is used to declare an aws_instance resource in a Terraform configuration file. The configuration file is a text file with a `.tf` extension. The file contains the following code:
```hcl
resource "aws_instance" "helloworld" {
  ami           = "ami-09dd2e08d601bff67"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}
```
The first line declares a resource and exactly two labels, the first is the type of resource (aws_instance) and the second is a name for the resource (helloworld). Together the type and name form a unique identifier for the resource.

![Syntax of a resource block](./images/2025042702-ResourceSyntax.svg)

The remaining lines of the resource block are called arguments.

![Sample inputs and outputs](./images/2025042701-InputsOutputs.svg)

#### 1.2.2 Configuring the AWS Provider

Providers can be either `aws`, `azurerm`, or `google`. 

```hcl
provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "helloworld" {
  ami           = "ami-09dd2e08d601bff67"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}
```
Things to note:
- Providers only have inputs, no outputs.

![Provider Operation](./images/20250427-ProviderOperation.svg)
