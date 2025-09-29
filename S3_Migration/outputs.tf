# Use the outputs.tf file with the following outputs:
# new_kke_bucket_name: The name of the new bucket created.
# new_kke_bucket_acl: The ACL of the new bucket created.

output "new_kke_bucket_name" {
  description = "The name of the new bucket created."
  value       = aws_s3_bucket.kke_bucket.id
}
output "new_kke_bucket_acl" {
  description = "The ACL of the new bucket created."
  value       = aws_s3_bucket.kke_bucket.acl
}
