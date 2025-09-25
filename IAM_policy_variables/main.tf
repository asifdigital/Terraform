
data "aws_iam_policy_document" "KKE_policy" {
  statement {
    actions   = ["s3:ListBucket"]
    resources = ["*"]
  }

}

resource "aws_iam_policy" "KKE_iampolicy" {
  name        = var.KKE_iampolicy   # Variable used here for the IAM policy name
  description = "My test policy"
  policy      = data.aws_iam_policy_document.KKE_policy.json
}