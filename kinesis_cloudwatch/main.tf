# Create a Kinesis Data Stream: Name the stream datacenter-kinesis-stream with a shard count of 1.
# Enable Monitoring: Enable shard-level metrics for the stream to track ingestion and throughput errors.
# Create a CloudWatch Alarm: Name the alarm datacenter-kinesis-alarm and monitor the WriteProvisionedThroughputExceeded metric.
# The alarm should trigger if the metric exceeds a threshold of 1.
# Ensure Alerting: Configure the CloudWatch alarm to detect write throughput issues exceeding provisioned limits.
# Create the main.tf file (do not create a separate .tf file) to provision the Kinesis stream, CloudWatch alarm, and ensure alerting.
# Create the outputs.tf file with the following variable names to output:
# kke_kinesis_stream_name for the Kinesis stream name.
# kke_kinesis_alarm_name for the CloudWatch alarm name.

resource "aws_kinesis_stream" "datacenter_kinesis_stream" {
  name             = "datacenter-kinesis-stream"
  shard_count     = 1

  shard_level_metrics = ["IncomingBytes", "IncomingRecords", "WriteProvisionedThroughputExceeded"]
}

resource "aws_cloudwatch_metric_alarm" "datacenter_kinesis_alarm" {
  alarm_name          = "datacenter-kinesis-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "WriteProvisionedThroughputExceeded"
  namespace           = "AWS/Kinesis"
  period              = 300
  statistic           = "Sum"
  threshold           = 1

  dimensions = {
    StreamName = aws_kinesis_stream.datacenter_kinesis_stream.name
  }

  alarm_description = "Alarm when write throughput exceeds provisioned limits"
}

