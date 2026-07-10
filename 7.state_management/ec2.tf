#keypair--------------------------------------------------------------

resource "aws_key_pair" "key-pair"{
    key_name = "terraform-keypair"
    public_key = file("keypair.pem.pub")
}

#vpc------------------------------------------------------------------

resource "aws_default_vpc" "default-vpc"{

}

#security group

resource "aws_security_group" "security-group"{
    name = " terraform-sg"
    vpc_id = aws_default_vpc.default-vpc.id
    description = "this is the security group of ec2"

    #inbound rule
    ingress{
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "ssh port"
    }
    ingress{
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "80 port"
    }
    # outbond rule
     egress{
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
        description = "80 port"
     }
     tags = {
        Name = "ec2-security_group"
     }
}

# ec2 instance---------------------------------------------------

resource "aws_instance" "my-instance"{

    key_name = aws_key_pair.key-pair.key_name 

    security_groups = [aws_security_group.security-group.name]

    ami ="ami-0b6d9d3d33ba97d99"

    instance_type = "t3.micro"

    root_block_device{
        volume_size = 10
        volume_type = "gp3"
    }

    tags = {
        Name = "first-terraform-ec2"
    }
}

resource "aws_instance" "imported-instance"{

}

