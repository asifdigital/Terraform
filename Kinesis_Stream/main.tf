#create an AWS Kinesis data stream for real-time data processing. 
#This stream will be used to ingest and process large volumes of streaming data, 
#which will then be consumed by various applications for analytics and real-time decision-making.
#The stream should be named xfusion-stream.
#Use Terraform to create this Kinesis stream.


resource "aws_kinesis_stream" "xfusion-stream" {
  name             = "xfusion-stream"
  shard_count      = 1

  tags = {
    Name        = "xfusion-stream"
  }
}

