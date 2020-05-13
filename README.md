# terraform-aws-ecr-repository

[![CircleCI](https://circleci.com/gh/azavea/terraform-aws-ecr-repository.svg?style=svg)](https://circleci.com/gh/azavea/terraform-aws-ecr-repository)

A Terraform module to create an Amazon Web Services (AWS) Elastic Container Registry (ECR) repository.

## Usage

```hcl
module "ecr-repository" {
  source = "github.com/azavea/terraform-aws-ecr-repository?ref=0.1.0"

  repository_name = "my-containers"
  
  attach_lifecycle_policy = true
}
```

## Variables

- `repository_name` - Name of the repository
- `attach_lifecycle_policy` - If true, an [ECR lifecycle policy](https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html) will be attached (default: `false`)
- `lifecycle_policy` - Contents of the ECR lifecycle policy (default: contents of `default-lifecycle-policy.json.tpl`, untagged images older than 7 days will be deleted)

## Outputs

- `arn` - Full ARN of the repository
- `name` - Name of the repository
- `registry_id` - Registry ID where the repository was created
- `repository_url` - URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)
