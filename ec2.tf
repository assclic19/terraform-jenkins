resource "aws_instance" "svr-jenkins" {
    ami = var.AWS_AMI
    instance_type = "t2.micro"
    vpc_security_group_ids = ["aws_security_group.instance_sg.id"]
    user_data = <<-EOF
          #!/bin/bash
        sudo apt update -y
        sudo apt install default-jre -y
        java -version
        sudo apt update -y
        wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
        sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
        sudo apt update -y
        sudo add-apt-repository universe -y
        sudo apt-get install jenkins -y
        sudo service jenkins start
        cat /var/lib/jenkins/secrets/initialAdminPassword

    EOF    
    tags = {
      "Name" = "svr-jenkins"
    }
}