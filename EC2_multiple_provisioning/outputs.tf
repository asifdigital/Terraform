output "kke_instance_names" {
  value = [for i in aws_instance.kke_instances : i.tags["Name"]]    
  
}