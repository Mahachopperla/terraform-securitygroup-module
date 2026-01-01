resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

# By default, AWS creates an ALLOW ALL egress rule when creating a new Security Group inside of a VPC. 
# When creating a new Security Group inside a VPC, Terraform will remove this default rule, and require you specifically re-create it 
# if you desire that rule. If you desire this rule to be in place, you can use this egress block:
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(local.common_Tags,
  {
    Name = "${var.project}-${var.environment}-Security_group"
  }
  )
}


