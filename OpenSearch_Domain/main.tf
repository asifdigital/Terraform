#set up an Amazon OpenSearch Service domain to store and search their application logs. 
#The domain should have the following specification:
#1) The domain name should be datacenter-es.
#2) Use Terraform to create the OpenSearch domain.

resource "aws_opensearch_domain" "name" {  
    domain_name           = "datacenter-es"
     cluster_config {
        instance_type       = "t3.small.search"
    }

    tags = {
        Name                = "datacenter-es"

    }
  
}