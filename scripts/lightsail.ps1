<#
lightsail is the easiest way to spin up dev servers
Reference: https://docs.aws.amazon.com/cli/latest/reference/lightsail/index.html
#>

#What blueprints (aka images) are available?
aws lightsail get-blueprints 
#Note queries are picky, case sensitive
aws lightsail get-blueprints --query 'blueprints[*].[blueprintId,type,platform,name,version]'
aws lightsail get-blueprints --query 'blueprints[*].[blueprintId,type,platform,name,version]' --output table


#What bundles(aka sizes) are available?
aws lightsail get-bundles
aws lightsail get-bundles --query 'bundles[*].[bundleId,price,cpuCount,ramSizeInGb,diskSizeInGb]'
aws lightsail get-bundles --query 'bundles[*].[bundleId,price,cpuCount,ramSizeInGb,diskSizeInGb]' --output table


