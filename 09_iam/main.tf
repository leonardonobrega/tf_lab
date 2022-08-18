provider "aws" {
  region  = "sa-east-1"
  profile = "tf_profile"
}

resource "aws_iam_user" "terraform_user" {
  name = "terraform-user"
}

resource "aws_iam_policy" "glacier_policy" {
  name   = "glacier-efs"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "glacier:InitiateJob",
                "glacier:AbortMultipartUpload",
                "glacier:CreateVault",
                "glacier:ListTagsForVault",
                "glacier:ListParts",
                "glacier:ListJobs",
                "glacier:ListMultipartUploads",
                "glacier:SetVaultNotifications",
                "glacier:CompleteMultipartUpload",
                "glacier:InitiateMultipartUpload",
                "glacier:UploadMultipartPart",
                "glacier:PurchaseProvisionedCapacity",
                "glacier:UploadArchive",
                "glacier:ListVaults",
                "glacier:ListProvisionedCapacity"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}

resource "aws_iam_policy_attachment" "policy_glacier_bind" {
  name       = "attachment"
  users      = [aws_iam_user.terraform_user.name]
  policy_arn = aws_iam_policy.glacier_policy.arn

}
