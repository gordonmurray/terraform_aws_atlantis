# Terraform AWS Atlantis

A Terraform module to create a small EC2 instance that runs [Atlantis](https://www.runatlantis.io/) and [Infracost](https://www.infracost.io/) 

Packer is used to create an AMI with Docker, Nginx, Certbot and a few other tools.

Terraform is used to create an EC2 instance from the AMI with a suitable security group.

Docker-compose is used on the instance to run the Infracost Docker image 'infracost-atlantis' to provide Atlantis and Infracost in one ([link](https://hub.docker.com/r/infracost/infracost-atlantis))

Once running, you will need to update your Github repo(s) to point a webhook to the address if this new instance, such as https://{youdomain.com}/events so that Atlantis can plan your Terraform PRs.

## Estimated cost

```
Project: gordonmurray/terraform_aws_atlantis

 Name                                                      Monthly Qty  Unit                  Monthly Cost 
                                                                                                           
 module.atlantis.aws_instance.atlantis                                                                     
 ├─ Instance usage (Linux/UNIX, on-demand, t3.micro)               730  hours                        $8.32 
 └─ root_block_device                                                                                      
    └─ Storage (general purpose SSD, gp2)                           10  GB                           $1.10 
                                                                                                           
 module.atlantis.aws_route53_record.atlantis                                                               
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries  
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries  
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries  
                                                                                                           
 OVERALL TOTAL                                                                                       $9.42 
──────────────────────────────────
8 cloud resources were detected:
∙ 2 were estimated, all of which include usage-based costs, see https://infracost.io/usage-file
∙ 6 were free:
  ∙ 4 x aws_security_group_rule
  ∙ 1 x aws_key_pair
  ∙ 1 x aws_security_group
```

## To do

- [x] EC2 instance, security group rules, docker-compose to run infracost-atlantis image
- [ ] Get Infracost going, gives a 404 for repos.yaml
- [x] Add a DNS entry in Route53 to point a sub domain to the EC2 instance
- [x] Cron entry on the instance to keep the cert renewed
- [ ] Change to a t4g instance if the Infracost docker image supports ARM in future
