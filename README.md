# terraform-aws-ecr-repository
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

- `repository_name` - name of the repository
- `attach_lifecycle_policy` - attach an [ECR lifecycle policy](https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html) (default: `false`)
- `lifecycle_policy` - ECR lifecycle policy (default: the contents of `default-lifecycle-policy.json.tpl`, untagged images older than 7 days will be deleted)

## Outputs

- `arn` - full ARN of the repository
- `name` - the name of the repository
- `registry_id` - the registry ID where the repository was created
- `repository_url` - the URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)
