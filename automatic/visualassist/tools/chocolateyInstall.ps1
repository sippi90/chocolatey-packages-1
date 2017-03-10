$packageName = 'visualassist'
$url32 = 'https://www.wholetomato.com/downloads/getBuild.asp?2210'
$url64 = 'https://www.wholetomato.com/downloads/getBuild.asp?2210'
$checksum32  = ''
$checksum64  = ''

$packageArgs = @{
  packageName    = $packageName
  installerType	 = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/S'
}

Install-ChocolateyPackage @packageArgs
