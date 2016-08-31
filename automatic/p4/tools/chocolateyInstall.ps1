$packageName = 'p4'
$url32 = 'http://filehost.perforce.com/perforce/r16.1/bin.ntx86/helix-p4-x86.exe'
$url64 = 'http://filehost.perforce.com/perforce/r16.1/bin.ntx64/helix-p4-x64.exe'
$checksum32  = 'e8b0047a04c53183d704ece9e9be95887720e7dadca7527e95d0db025b8c0301'
$checksum64  = '5d3fe5a6912aebfd721b6a8a06205cc2743a9551afd6de201641179121394a75'

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
