# kke_kinesis_stream_name for the Kinesis stream name.
# kke_kinesis_alarm_name for the CloudWatch alarm name.

output "kke_kinesis_stream_name" {
  description = "The name of the Kinesis Data Stream"
  value       = aws_kinesis_stream.datacenter_kinesis_stream.name
}

output "kke_kinesis_alarm_name" {
  description = "The name of the CloudWatch Alarm"
  value       = aws_cloudwatch_metric_alarm.datacenter_kinesis_alarm.alarm_name
}

