resource "aws_key_pair" "key-pair"{
    key_name = "${var.env}-keypair"
    public_key = file("keypair.pem.pub")
  
}

resource "aws_default_vpc" "default-vpc"{

}

resource "aws_security_group" "security-group"{
    name = "${var.env}-security_group"
    vpc_id = aws_default_vpc.default-vpc.id
    description = "this is the security group of ec2"

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
        Name = "${var.env}-security_group"
     }
}

resource "aws_instance" "my-instance"{
    count = var.instance_count

    key_name = aws_key_pair.key-pair.key_name 

    security_groups = [aws_security_group.security-group.name]

    ami = var.ami_id

    instance_type = var.instance_type

    root_block_device {
        volume_size = var.env=="prod" ? 15 : 10
        volume_type = "gp3"
    }

    tags = {
        Name = "${var.env}-instance"
        Environment = var.env
    }
}