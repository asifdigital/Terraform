#create a CloudWatch log group and log stream with the following specifications:
#1) The log group name should be devops-log-group.
#2) The log stream name should be devops-log-stream.

resource "aws_cloudwatch_log_group" "devops_log_group" {
  name = "devops-log-group"
}
resource "aws_cloudwatch_log_stream" "devops_log_stream" {
  name           = "devops-log-stream"
  log_group_name = aws_cloudwatch_log_group.devops_log_group.name
}   

