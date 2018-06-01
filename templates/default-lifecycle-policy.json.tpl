{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire untagged images older than ${days_to_retain_images} day(s)",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countNumber": ${days_to_retain_images},
                "countUnit": "days"
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}