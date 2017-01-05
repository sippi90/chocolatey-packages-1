$packageName = 'anydvd'
$url32 = 'https://www.redfox.bz/download/SetupAnyDVD8090.exe'
$url64 = 'https://www.redfox.bz/download/SetupAnyDVD8090.exe'
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
