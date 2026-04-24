resource "aws_instance" "Terraform-server" {
    ami = "ami-048f4445314bcaa09"
    vpc_security_group_ids = [aws_security_group.terraform_sg.id]
    instance_type = "t3.micro"

    tags = {
        Name = "Terraform_server"
        app = "Terraform"
        Environment = "Test"
    }
}




resource "aws_security_group" "terraform_sg" {
    name = "terraform_sg"
    description = "creating new sg"

     ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Terraform_SG"
    }
}