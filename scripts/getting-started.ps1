<#
Before you begin, create a new IAM user for AWSCLI, with enough rights
Note the access key and secret
#>
#fix python bug 'LookupError: unknown encoding: cp65001' per https://stackoverflow.com/questions/35176270/python-2-7-lookuperror-unknown-encoding-cp65001

aws
aws --version
#note the various options 
aws help   
aws help topics    

#configure, see https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html
aws configure help
aws configure
aws configure --profile david1


#profiles? 
aws configure list
aws configure get profile
aws configure set profile david1
cat ~/.aws/config




#IAM
aws iam get-user
aws iam get-account-summary --output
#get aws account number
aws sts get-caller-identity --output text --query 'Account'

#instance profile?

#try to read metadata from that instance
curl http://169.254.169.254/latest/meta-data/

#BUDGET & COST
aws ce get-cost-and-usage
#TODO
#jmespath