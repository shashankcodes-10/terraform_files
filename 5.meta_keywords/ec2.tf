resource "aws_key_pair" "keypair"{
    key_name = "meta-keywords-keypair"
    public_key = file("keypair.pem.pub")
}

resource "aws_default_vpc" "default"{

}

resource "aws_security_group" "securitygroup"{
    vpc_id = aws_default_vpc.default.id
    name = "meta-keywords-sg"

    ingress{
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }
    egress{
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
    }
    tags = {
        Name = "meta-keywords-sg"
    }
}

resource "aws_instance" "ec2-instance"{
    # count meta-keyword (it will make 2 instance with same name)
    
    # count = 2

    # for_each meta-keyword (by this we can have different name of instance)
    
    for_each = tomap({
        first-instance = "t3.micro"
        secone_instance = "t3.small"
        third_instance = "t3.micro"
    })  
    # depends_on meta-keyword (by this we write the resource that we want to be created before creating instance or other resource)
    
    depends_on=[aws_security_group.securitygroup,aws_key_pair.keypair]
    key_name = aws_key_pair.keypair.key_name
    security_groups = [aws_security_group.securitygroup.name]
    ami = "ami-0b6d9d3d33ba97d99"
    instance_type = each.value
    root_block_device{
        volume_size = 10
        volume_type = "gp3"
    }
    tags = {
        Name = each.key
    }
}