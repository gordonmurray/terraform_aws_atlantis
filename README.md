# Terraform AWS Atlantis

A Terraform module to create a small EC2 instance with Atlantis and Infracost. PAcker is used to create an AMI with Docker installed and Terraform is used to put the AMI in to place an an EC2 instance with a suitable security group.


## Estimated cost

```
Project: gordonmurray/terraform_aws_atlantis

 Name                                                 Monthly Qty  Unit   Monthly Cost 
                                                                                       
 module.atlantis.aws_instance.atlantis                                                 
 ├─ Instance usage (Linux/UNIX, on-demand, t3.micro)          730  hours         $8.32 
 └─ root_block_device                                                                  
    └─ Storage (general purpose SSD, gp2)                      10  GB            $1.10 
                                                                                       
 OVERALL TOTAL                                                                   $9.42 
──────────────────────────────────
6 cloud resources were detected:
∙ 1 was estimated, it includes usage-based costs, see https://infracost.io/usage-file
∙ 5 were free:
  ∙ 3 x aws_security_group_rule
  ∙ 1 x aws_key_pair
  ∙ 1 x aws_security_group
```