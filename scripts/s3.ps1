<#
s3 is Amazon's simple storage service. 
Reference: S3 https://docs.aws.amazon.com/cli/latest/reference/s3/index.html
S3API https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html
#>
exit #PREVENT F5

aws s3 help
aws s3 ls
aws s3 website help

#make a bucket for a website
aws s3 mb s3://dave-aws-site
aws s3 ls

#upload a web page
aws s3 cp ../html/index.html s3://dave-aws-site
aws s3 ls s3://dave-aws-site


#enable website
aws s3 website help
aws s3 website s3://dave-aws-site --index-document index.html
#grant rights
#refer https://stackoverflow.com/questions/41325740/aws-s3-permissions-error-with-put-bucket-acl
#check permissions
aws s3api get-bucket-acl --bucket dave-aws-site
aws s3api get-object-acl --bucket dave-aws-site --key index.html

aws s3api put-bucket-acl --bucket dave-aws-site --acl public-read 
aws s3api put-bucket-acl --bucket dave-aws-site --generate-cli-skeleton 
aws s3api put-object-acl --bucket dave-aws-site --key index.html --acl public-read 


#test it
Invoke-WebRequest https://dave-aws-site.s3.us-east-2.amazonaws.com/index.html



#S3 cleanup
<#
aws s3 rb s3://dave-aws-site --force
#>