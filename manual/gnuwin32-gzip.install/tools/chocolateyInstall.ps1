$packageName = 'gnuwin32-gzip'
$url32 = 'https://sourceforge.net/projects/gnuwin32/files/gzip/1.3.12-1/gzip-1.3.12-1-setup.exe'
$url64 = 'https://sourceforge.net/projects/gnuwin32/files/gzip/1.3.12-1/gzip-1.3.12-1-setup.exe'
$checksum32  = 'ff19a6203e8111bedff29c3bc150eaf1'
$checksum64  = 'ff19a6203e8111bedff29c3bc150eaf1'

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