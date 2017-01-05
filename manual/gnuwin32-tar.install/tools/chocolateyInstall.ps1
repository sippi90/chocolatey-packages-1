$packageName = 'gnuwin32-tar'
$url32 = 'https://sourceforge.net/projects/gnuwin32/files/tar/1.13-1/tar-1.13-1-bin.exe'
$url64 = 'https://sourceforge.net/projects/gnuwin32/files/tar/1.13-1/tar-1.13-1-bin.exe'
$checksum32  = '4a9d65578514874716c694f945066e94'
$checksum64  = '4a9d65578514874716c694f945066e94'

$packageArgs = @{
  packageName    = $packageName
  installerType	 = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'md5'
  checksumType64 = 'md5'
  silentArgs	 = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
}

Install-ChocolateyPackage @packageArgs

$result = Get-ChildItem Env:PATH | Select-Object Value | Select-String "GnuWin32" -quiet
if ($result -eq $null) {
	Write-Host Adding $packageName to PATH variable...
	[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files (x86)\GnuWin32\bin", [EnvironmentVariableTarget]::Machine)
}