# Terraform Automation and GitOps

Exercise files to accompany my Pluralsight course of the same name. You can always find the latest version at [https://github.com/ned1313/Terraform-Automation-and-GitOps](https://github.com/ned1313/Terraform-Automation-and-GitOps)

Welcome to **Terraform - Automation and GitOps**.  These exercise files are meant to accompany my course on [Pluralsight](http://www.pluralsight.com/courses/terraform-automation-and-gitops).  The course was developed using version 1.13.4 of Terraform. This is the eighth course in the Terraform Learning Path on Pluralsight. I am assuming you have taken the **Getting Started - Terraform** course or you have equivalent knowledge.

## Using the files

In the course, you are back with the your old friends the Taco Wagon team. It's time to improve their configuration with automation! The `base_app` directory has the basic configuration, which we will copy over to a new directory and start making alterations.

The `solutions` directory contains the finished solution for each module. I've also included some of the necessary commands to get things up and running in git and GitHub.

## Prerequisites

You will need several prerequisites set up locally to work through the exercises:

* [Python](https://www.python.org/downloads/)
* [Pre-commit](https://pre-commit.com) - install using pip: `pip install pre-commit`
* [Git](https://git-scm.com)
* [TFLint](https://github.com/terraform-linters/tflint)
* [Terraform-docs](https://terraform-docs.io)
* [GitHub CLI](https://cli.github.com)

Honestly, these are all great tools to have in general if you plan to work with Terraform in a professional capacity.

You will also need an [HCP Terraform account](https://app.terraform.io/login/new) and an organization on the free plan tier.

## AWS Environment

You will need access to an AWS account with permissions to create resources in EC2. I recommend creating a dedicated account just for this course. The exercises have been tested with the AWS region `us-east-1`. The input variable `region` has `us-east-1` set as the default, but you can supply a different region if you prefer. Generally, the exercises should work in any region.

You will need to generate an AWS access key for your accounts to run through the exercises, or use some other means of authentication. You can do this through the IAM console in a browser (*hint*: it's under security credentials for your user) by following the [official AWS docs](https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/). I'd recommend assigning the `AdministratorAccess` policy to yourself to give you permissions to do everything in the account. Also, enable 2FA for your account!

The exercises assume you have configured your AWS CLI with the relevant credentials or set environment variables for authentication. If you're unsure about how to do this, I refer you to the [authentication options in the AWS provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration). The short, short version is:

```bash
# Using the AWS CLI
aws configure
```

Enter your Access Key and Secret Access Key at the prompts. Or:

```bash
# Using environment variables
# PowerShell
$env:AWS_ACCESS_KEY_ID="YOURACCESSKEYID"
$env:AWS_SECRET_ACCESS_KEY="YOURSECRETACCESSKEY"

# Bash
export AWS_ACCESS_KEY_ID="YOURACCESSKEYID"
export AWS_SECRET_ACCESS_KEY="YOURSECRETACCESSKEY"
```

## Testing the Configuration

The configuration in the `base_app` directory uses a partial S3 backend configuration. If you'd like to try out the config without the S3 bucket, simply comments out the `backend` block in the `terraform.tf` file. The variable values are defined in the `environments` directory. Once you've commented out the backend config, simply run:

```bash
terraform init
terraform apply -var-file="./environments/dev.tfvars"
```

Be sure to add the backend configuration back in before you proceed to the GitHub Actions sections of the course.

## GitHub Setup

This course will require that you have a [GitHub account](https://github.com/signup) and it's also recommend to have the [GitHub CLI installed](https://cli.github.com).

Once you have the GitHub CLI installed, you can get signed in using the command: `gh auth login` and following the prompts.

## MONEY!!!

A gentle reminder about cost.  The course will have you creating resources in AWS. AWS recently replaced their original free tier offering with a new [Free Plan account](https://aws.amazon.com/free/) that includes up to $200 in credits and some always free services. If you open a new account after July 2025, you should be able to use that account with this course and not incur any costs.

The new Free Plan does limit your consumption of services. To avoid hitting that limit, you should remove resources when not actively taking the course. When you complete an exercise in the course, you can easily tear down the deployed infrastructure using `terraform destroy`. Just run that command and approve the destruction to remove all resources from AWS. Before you start the next module, run `terraform apply` again and you should be right where you started. Isn't infrastructure automation amazing?!

## Certification

HashiCorp offers the Terraform Certified Associate certification. You might be wondering if this course fully prepares you for the cert.  **It does not.**  Taking this course along with the rest of the Terraform learning path on Pluralsight should cover all the objectives on the exam and give you the knowledge you need to pass.

I have coauthored a certification guide which you can find on [Leanpub](https://leanpub.com/terraform-certified/). This is an unofficial guide, but I believe in concert with the Pluralsight courses you will be in a good position to sit the exam.

## Conclusion

I hope you enjoy taking this course as much as I did creating it.  I'd love to hear feedback and suggestions for revisions. Find me on LinkedIn (https://www.linkedin.com/in/ned-bellavance/) or add an issue to this repository.

Thanks and happy automating!

Ned
