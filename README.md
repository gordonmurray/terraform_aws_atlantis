# Terraform AWS Atlantis

A Terraform module to create a small EC2 instance with Atlantis and Infracost. 

Packer is used to create an AMI with Docker, Nginx and a few other tools.

Terraform is used to put the AMI in to place an an EC2 instance with a suitable security group.

The Infracost Docker image 'infracost-atlantis' is used to provide Atlantis and Infracost in one. ([link](https://hub.docker.com/r/infracost/infracost-atlantis))

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

## To do

- [x] EC2 instance, security group rules, docker-compose to run infracost-atlantis image
- [ ] Get Infracost going, gives a 404 for repos.yaml
- [ ] Add a DNS entry in Route53 to point a (sub) domain to the EC2 instance
- [ ] Cron entry on the instance to keep the cert renewed
- [ ] Change to use a Spot instance
- [ ] Change to a t4g instance if the Infracost docker image supports ARM in future
