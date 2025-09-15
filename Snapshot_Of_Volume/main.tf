#Create a snapshot of an existing volume named nautilus-vol in us-east-1 region using terraform.
#1) The name of the snapshot must be nautilus-vol-ss.
#2) The description must be Nautilus Snapshot.
#3) Make sure the snapshot status is completed before submitting the task.


resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name        = "nautilus-vol"
  }
}

resource "aws_ebs_snapshot" "nautilus_vol_ss" {
  volume_id   = aws_ebs_volume.k8s_volume.id
  description = "Nautilus Snapshot"

  tags = {
    Name = "nautilus-vol-ss"
  }

  depends_on = [aws_ebs_volume.k8s_volume]
}


