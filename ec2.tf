resource "aws_instance" "svr-jenkins" {
    ami = var.AWS_AMI
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance_sg.id]  
    tags = {
      "Name" = "svr-jenkins"
    }
}