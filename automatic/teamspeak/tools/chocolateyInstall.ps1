$packageName = 'teamspeak'
$url32 = 'http://dl.4players.de/ts/releases/3.1.4/TeamSpeak3-Client-win32-3.1.4.exe'
$url64 = 'http://dl.4players.de/ts/releases/3.1.4/TeamSpeak3-Client-win64-3.1.4.exe'
$checksum32  = '721a3819aa70a20527ded4bbfc4848b97bb7e8aa8439b8cd2a80f259523b3284'
$checksum64  = '5956eb4a46e372a47d66ca85a022608031bf804024ae9ebde7b2f474ebd06621'

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
