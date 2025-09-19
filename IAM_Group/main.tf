#Create an IAM group named iamgroup_jim using terraform.

resource "aws_iam_group" "iamgroup_jim" {
    name = "iamgroup_jim"
}

