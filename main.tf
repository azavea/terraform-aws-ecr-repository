#
# ECR Resources
#
resource "aws_ecr_repository" "default" {
  name = "${var.repository_name}"
}

# define Lifecycle Policy
data "template_file" "lifecycle_policy" {
  count = "${var.attach_lifecycle_policy ? 1 : 0}"

  template = "${var.lifecycle_policy != "" ? var.lifecycle_policy : file("${path.module}/templates/default-lifecycle-policy.json.tpl")}"
}

resource "aws_ecr_lifecycle_policy" "default" {
  count = "${var.attach_lifecycle_policy ? 1 : 0}"

  repository = "${aws_ecr_repository.default.name}"
  policy     = "${data.template_file.lifecycle_policy.rendered}"
}
