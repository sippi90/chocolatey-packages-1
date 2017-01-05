$packageName = 'p4'
$url32 = 'http://filehost.perforce.com/perforce/r16.2/bin.ntx86/helix-p4-x86.exe'
$url64 = 'http://filehost.perforce.com/perforce/r16.2/bin.ntx64/helix-p4-x64.exe'
$checksum32  = '68f427d34e8c3d8db6849ab157f31434f47c898e1c580964a6671b170a02a51c'
$checksum64  = '48e41d15494f9e6a62f1412c17d7babee1fd10792eb884841f62f96cf621d41e'

$packageArgs = @{
  packageName    = $packageName
  installerType	 = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/s /v"/qn"'
}

Install-ChocolateyPackage @packageArgs
