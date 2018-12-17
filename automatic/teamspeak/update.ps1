import-module au

$baseName = 'TeamSpeak3-Client'
$downloadsUrl = 'https://www.teamspeak.com/en/downloads'
$mirror = 'http://dl.4players.de/ts/releases/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
	$downloads = Invoke-WebRequest $downloadsUrl
	
	# All of the interesting information is contained in a div of class "platform windows"
	$windowsElement = $downloads.ParsedHtml.getElementsByTagName("div") | Where{ $_.className -eq 'platform mb-5 windows' }
	# The windows div contains two more elements of class type 'row'. These are 32-bit and 64-bit respectively.
	$version = ($windowsElement.getElementsByTagName("span") | Where{ $_.className -eq 'version' } | Select -First 1).innerText.Trim()
	
	# Get the 32-bit installer url and checksum
	$checksum32 = ($windowsElement.getElementsByTagName("div") | Where{ $_.className -eq 'checksum' } | Select -First 1).innerText
	$url32 = $mirror + '/' + $version + '/' + $baseName + '-win32-' + $version + '.exe'
	
	# Get the 64-bit installer url and checksum
	$checksum64 = ($windowsElement.getElementsByTagName("div") | Where{ $_.className -eq 'checksum' } | Select -Skip 1 | Select -First 1).innerText
	$url64 = $mirror + '/' + $version + '/' + $baseName + '-win64-' + $version + '.exe'
	
	# The sha256 checksums need to be parsed a bit
	$regex = [regex] 'SHA256: [a-zA-Z0-9]+'
	$matches = $regex.Matches($checksum32)
	$sum32 = $matches[0] -split ' ' | Select -Last 1
	$matches = $regex.Matches($checksum64)
	$sum64 = $matches[0] -split ' ' | Select -Last 1

	$Latest = @{ URL32 = $url32; Checksum32 = $sum32; URL64 = $url64; Checksum64 = $sum64; Version = $version }
    return $Latest
}

update