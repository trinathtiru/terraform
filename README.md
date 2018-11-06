# terraform

install terraform:

use choco to install terraform

choco install terraform

execute the below steps 
terraform init
terraform validate 
terraform plan -var "access=" -var "secret=" -var "privatekeypath=./keys/jobs2mon.pem" .
terraform apply -var "access=" -var "secret=" -var "privatekeypath=./keys/jobs2mon.pem" .
