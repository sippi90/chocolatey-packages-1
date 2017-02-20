$packageName = 'teamspeak'
$url32 = 'http://dl.4players.de/ts/releases/3.1.1/TeamSpeak3-Client-win32-3.1.1.exe'
$url64 = 'http://dl.4players.de/ts/releases/3.1.1/TeamSpeak3-Client-win64-3.1.1.exe'
$checksum32  = '1b79c363c549685c3c0430d6c68b9906a761d43faf7a05a2d1f97f1e1eb68a7a'
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
