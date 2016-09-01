$packageName = 'teamspeak'
$url32 = 'http://dl.4players.de/ts/releases/3.0.19.4/TeamSpeak3-Client-win32-3.0.19.4.exe'
$url64 = 'http://teamspeak.gameserver.gamed.de/ts3/releases/3.0.19.4/TeamSpeak3-Client-win64-3.0.19.4.exe'
$checksum32  = 'a608db113b346a686c7e169f2df447d43a7d5eb34e02a32297363c95530faebf'
$checksum64  = 'f3ee60f10c24cc92da35e593aa1a3100e1ab5a3edca48cabb9f6e6b43ff1cc70'

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
