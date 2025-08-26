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


#here we need to get sg name from user of this module. so declare it as a mandatory variable in variable.tf file

# description can be optional so create a variable for description as optional

#and VPC id we need to get it from vpc module 
# which indicates that SG is dependent on VPC module. As a platform engineer when we develop a VPC module it's our responsibilty
# to give that vpc id as output

# so person who develops vpc will get vpc id as their result . we need to store this id somewhere so that whenver 
# SG team trying to create SG they will take from that place.

# AWS being platform between multiple resources it provides a feature called SSM parameter store

#so whenver VPC developer creates VPC , he will store that id in parameter store and SG team will access id from parameter
# strore whenver it is necessary

# we need to access sg id from parameter store using data sources

# tags as usual follow our regular process and give proper tags(merge commmon tags, name of SG and give an option to user if he wants to add any tags)