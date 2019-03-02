<#
Keypairs are used to access linux virtual machines
see: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-keypairs.html
#>

aws ec2 describe-key-pairs

#create the keypair, output the key and save to file
aws ec2 create-key-pair --key-name dave-training --query 'KeyMaterial' --output text `
    | out-file -encoding ascii -filepath ~\.ssh\dave-training-keypair.pem
#view private key
cat ~\.ssh\dave-training-keypair.pem
    
#cleanup
#aws ec2 delete-key-pair --key-name dave-training    