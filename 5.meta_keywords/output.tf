output "public_ip"{
    value = [
        for ip in aws_instance.ec2-instance: ip.public_ip
    ]
}