#Create a CloudWatch alarm named datacenter-alarm.
#The alarm should monitor CPU utilization of an EC2 instance.
#Trigger the alarm when CPU utilization exceeds 80%.
#Set the evaluation period to 5 minutes.
#Use a single evaluation period

resource "aws_cloudwatch_metric_alarm" "datacenter-alarm" {
  alarm_name          = "datacenter-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"

  alarm_description = "Alarm when CPU exceeds 80%"
  actions_enabled   = true
}


