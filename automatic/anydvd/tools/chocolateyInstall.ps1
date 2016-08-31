$packageName = 'anydvd'
$installerType = 'EXE'
$url = 'https://www.redfox.bz/download/SetupAnyDVD.exe'
$silentArgs = '/S'
$validExitCodes = @(0)
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes