$packageName = 'p4v'
$url32 = 'http://filehost.perforce.com/perforce/r15.2/bin.ntx86/p4vinst.exe'
$url64 = 'http://filehost.perforce.com/perforce/r15.2/bin.ntx64/p4vinst64.exe'
$checksum32  = '00e62fdf61cc29cfa34501c0d283a7e8e77df6f2859130b03c8cc1b43f1f7cf3'
$checksum64  = 'c721af61aafdc9ee22352299b08807709147510753680b93a39e631288bc2f72'

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
