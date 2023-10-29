
cd $(dirname $0)
cd ..
terraform destroy -auto-approve

echo "All resources for this deployment have been deleted."