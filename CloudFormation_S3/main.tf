#Create a CloudFormation stack named xfusion-stack using Terraform. 
#This stack should contain an S3 bucket named xfusion-bucket-23275 as a resource, 
#and the bucket must have versioning enabled. 

resource "aws_cloudformation_stack" "xfusion-stack" {
  name         = "xfusion-stack"
  template_body = <<STACK
{
  "AWSTemplateFormatVersion": "2010-09-09",
  "Resources": {
    "XfusionBucket": {
      "Type": "AWS::S3::Bucket",
      "Properties": {
        "BucketName": "xfusion-bucket-23275",
        "VersioningConfiguration": {
          "Status": "Enabled"
        }
      }
    }
  }  
}
STACK

}