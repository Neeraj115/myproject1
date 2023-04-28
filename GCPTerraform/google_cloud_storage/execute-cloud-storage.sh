#!/bin/sh
STORAGE_ACCOUNT_PROD="bucket=terraform-state-t3647"

if [ "$2" == "prod" ]
then
case $1 in
new-project-375307)
JSON_FILE="../json_files/$2/$1-storage-bucket.tfvars.json"
PLAN_FILE="../plans/$2/$1-storage-bucket-plan.json"
RESOURCE_STATE_FILE="prefix=terraform/$1/storage-bucket/"
;;
*)
echo "env $1 not defined"
exit 1
;;
esac

## Terraform steps
cd cloud_storage_creation/
echo "terraform init"
terraform init -backend-config=$STORAGE_ACCOUNT_PROD -backend-config=$RESOURCE_STATE_FILE -reconfigure
echo "terraform fmt -recursive"
terraform fmt -recursive
echo "terraform plan"
terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
echo "terraform apply"
read -p "Proceed with apply? y or n: " ans
echo "Answer: $ans"
if [ $ans == "y" ]
then
    terraform apply $PLAN_FILE
else
    echo "Answer is not 'y', hence exiting."
fi
fi
