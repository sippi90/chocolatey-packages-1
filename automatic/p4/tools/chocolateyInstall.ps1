$ErrorActionPreference = 'Stop';

$packageName = 'p4'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32       = 'http://filehost.perforce.com/perforce/r16.1/bin.ntx86/helix-p4-x86.exe'
$url64       = 'http://filehost.perforce.com/perforce/r16.1/bin.ntx64/helix-p4-x64.exe'
$checksum32  = 'B66FE09D472E1532559E56602814F6423B6F65ABEE0B30AA3E314663DE870B80'
$checksum64  = '0CCD52CE74874503ED537C6D44050C551BC16392F09B782EE88EDF17F0589EE5'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = 'Helix P4 Command-Line Client*'
  unzipLocation  = $toolsDir
  installerType	 = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/s /v"/qn"'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
