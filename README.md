# terraform-aws-ecr-repository
A Terraform module to create an Amazon Web Services (AWS) Elastic Container Registry (ECR) repository.

## Usage

```hcl
module "ecr-repository" {
  source  = "azavea/ecr-repository/aws"
  version = "0.1.0"

  repository_name = "my-containers"
  
  attach_lifecycle_policy = true
  max_number_of_images = 7 # expire untagged images older than 7 days
}
```

## Variables

- `repository_name` - name of the repository
- `attach_lifecycle_policy` - attach a lifecycle policy (default: `false`)
- `lifecycle_policy` - lifecycle policy JSON (default: `${file("${path.module}/templates/default-lifecycle-policy.json.tpl")}`)
- `max_number_of_images` - if `attach_lifecycle_policy` is `true` and `lifecycle_policy` has not been set, this variable expires untagged images older than N days (default: `7`)

## Outputs

- `arn` - full ARN of the repository
- `name` - the name of the repository
- `registry_id` - the registry ID where the repository was created
- `repository_url` - the URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)