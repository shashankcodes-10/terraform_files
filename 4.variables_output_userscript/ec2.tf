#key pair----------------------------------------------------------

resource "aws_key_pair" "keypair"{
    public_key = file("keypair.pem.pub")
    key_name = var.key_name
}

# vpc---------------------------------------------------------------

resource "aws_default_vpc" "default_vpc"{

}

# security group------------------------------------------------------

resource "aws_security_group" "security_group"{
    name = var.security_group_name
    vpc_id = aws_default_vpc.default_vpc.id

    #inbound roles
    ingress{
        from_port = 22
        to_port =  22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #outbound rule
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = var.security_group_name
    }
}

# ec2 instace -------------------------------------------------------------

resource "aws_instance" "ec2_instance"{
    key_name = aws_key_pair.keypair.key_name

    security_groups = [aws_security_group.security_group.name]

    instance_type = var.instance_type

    ami = var.ami_id

    user_data = file("nginx-install.sh")
    root_block_device{
        volume_size = var.volume_size
        volume_type = var.volume_type
    }

    tags = {
        Name = var.instance_name
    }
}