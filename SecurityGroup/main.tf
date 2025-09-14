
data "aws_vpc" "default" {
    default = true

}

resource "aws_security_group" "nautilus-sg" {
  name        = "nautilus-sg"
  description = "security group nautilus-sg"
  vpc_id      = data.aws_vpc.default.id 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic from anywhere"
  }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH traffic from my IP"
    }
}