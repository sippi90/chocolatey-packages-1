$packageName = 'teamspeak'
$url32 = 'http://dl.4players.de/ts/releases//3.2.1/TeamSpeak3-Client-win32-3.2.1.exe'
$url64 = 'http://dl.4players.de/ts/releases//3.2.1/TeamSpeak3-Client-win64-3.2.1.exe'
$checksum32  = '47ff32e6aa0dbc01a05b3e06660c5905952ddc55395cd4ee44eccffcdebc408c'
$checksum64  = '49d6ad4d488699f76d600be264d487135db22a8b320d01c24c76698ac0fa1f34'

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
