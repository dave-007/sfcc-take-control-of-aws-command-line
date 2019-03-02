<#
Polly is a speech synthesizer
Reference: https://docs.aws.amazon.com/cli/latest/reference/polly

#>
exit #PREVENT F5
#confirm correct path so can access mp3s
Set-Location .\scripts
aws polly synthesize-speech `
    --output-format mp3 `
    --voice-id Matthew `
    --text 'Hello, I''m David. Welcome to my talk on AWS Command Line. Please take a seat!' `
    ..\media\welcome.mp3

Invoke-Expression ..\media\welcome.mp3

aws polly describe-voices --language-code en-US
#use json in a powershell variable and loop
aws polly describe-voices --language-code en-US --query 'Voices[*].[Name]'
$names = aws polly describe-voices --language-code en-US --query 'Voices[*].[Name]' | ConvertFrom-Json

# assumes path to write mp3 is ..\media, change this as needed
foreach ($name in $names) {
    $text = "`'Hi, I am $name`'"
    $command = "aws polly synthesize-speech --output-format mp3 --voice-id $name --text $text ..\media\hi-from-$name.mp3"
    Invoke-Expression $command    

}
