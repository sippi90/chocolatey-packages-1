<<<<<<< HEAD
﻿$packageName = 'p4'
$url32 = 'http://filehost.perforce.com/perforce/r16.2/bin.ntx86/helix-p4-x86.exe'
$url64 = 'http://filehost.perforce.com/perforce/r16.2/bin.ntx64/helix-p4-x64.exe'
$checksum32  = '68f427d34e8c3d8db6849ab157f31434f47c898e1c580964a6671b170a02a51c'
$checksum64  = '48e41d15494f9e6a62f1412c17d7babee1fd10792eb884841f62f96cf621d41e'
=======
﻿$ErrorActionPreference = 'Stop';

$packageName = 'p4'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32       = 'http://filehost.perforce.com/perforce/r16.1/bin.ntx86/helix-p4-x86.exe'
$url64       = 'http://filehost.perforce.com/perforce/r16.1/bin.ntx64/helix-p4-x64.exe'
$checksum32  = 'FADCEBD6785B876FA1E09CAE2474F4184C9F538D2FE9472E70A925DCBF176F13'
$checksum64  = '15B92EBE8B8A6F73E4238891594D305D87E0C3C7288A7EB0FC4B5C88C48CE497'
>>>>>>> 84d10bac98612919aed70d7c3c87c413fb8d3b0d

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
