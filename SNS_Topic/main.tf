#create an SNS topic with the following specifications:
#1) The topic name should be nautilus-notifications.

resource "aws_sns_topic" "nautilus_notifications" {
  name = "nautilus-notifications"
}

