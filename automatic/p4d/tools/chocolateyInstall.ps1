$packageName = 'p4d'
$url32 = 'http://filehost.perforce.com/perforce/r16.1/bin.ntx86/helix-versioning-engine-x86.exe'
$url64 = 'http://filehost.perforce.com/perforce/r16.1/bin.ntx64/helix-versioning-engine-x64.exe'
$checksum32  = '73f6b0adb0c422fe47d743bd247c494fd3748a0e5c4092e485ecae187e65b05e'
$checksum64  = 'd3f59e9d384520a9427458d4cd5c1021f024db3ded04eeebe57911635c00fbf3'

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
