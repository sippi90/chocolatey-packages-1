$packageName = 'visualassist'
$installerType = 'EXE'
$url = 'http://www.wholetomato.com/downloads/getBuild.asp?2076'
$silentArgs = ''
$validExitCodes = @(0)
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes