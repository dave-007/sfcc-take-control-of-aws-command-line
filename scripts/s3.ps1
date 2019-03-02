
aws s3 help
aws s3 ls
aws s3 website help

#make a bucket for a website
aws s3 mb s3://dave-aws-site
#upload a web page
aws s3 cp ./index.html s3://dave-aws-site
aws s3 ls s3://dave-aws-site
aws s3 ls

#enable website
aws s3 website help
aws s3 website s3://dave-aws-site --index-document index.html --debug
#grant rights
#refer https://stackoverflow.com/questions/41325740/aws-s3-permissions-error-with-put-bucket-acl
#check permissions
aws s3api get-bucket-acl --bucket dave-aws-site
aws s3api get-object-acl --bucket dave-aws-site --key index.html

aws s3api put-bucket-acl --bucket dave-aws-site --acl public-read  #--generate-cli-skeleton
aws s3api put-bucket-acl --bucket dave-aws-site --generate-cli-skeleton 
aws s3api put-object-acl --bucket dave-aws-site --key index.html --acl public-read  #--generate-cli-skeleton


aws s3api put-bucket-acl --bucket dave-aws-site --acl public-read --debug
aws s3api put-object-acl --bucket dave-aws-site --
#test it
Invoke-WebRequest https://dave-aws-site.s3.us-east-2.amazonaws.com



#S3 cleanup
<#
aws s3 rb s3://dave-aws-site --force
#>