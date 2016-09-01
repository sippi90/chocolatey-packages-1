import-module au

$downloadsUrl = 'http://www.teamspeak.com/downloads'

$exeUrlRegEx = '(?i)http://([a-zA-Z0-9\.-]+/?)+'

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
	
	# All of the interesting information is contained in a div of class "uk-form uk-panel uk-panel-space windows"
	$elements = $downloads.AllElements | Where Class -eq "uk-form uk-panel uk-panel-space windows" | Select -First 1
	
	# The version number is given in a line like "Client 32-bit XX.XX.XX.XX"
	$found = $elements.innerText -match 'Client.*[0-9]\.?'
	$version = $matches[0] -split ' ' | Select -Last 1
	
	# The sha256 checksums are on their own line; 32-bit first and then 64-bit.
	$regex = [regex] 'SHA256: [a-zA-Z0-9]+'
	$matches = $regex.Matches($elements.innerText)
	$sum32 = $matches[0] -split ' ' | Select -Last 1
	$sum64 = $matches[1] -split ' ' | Select -Last 1
	
	# Extract the download URLs by looking for URL patterns
	$regex = [regex] $exeUrlRegEx
	$downloadUrls = $regex.Matches($elements.innerHTML)
	$url32 = $downloadUrls -split ' ' | Select -First 1
	$url64 = $downloadUrls -split ' ' | Select -Last 1

	$Latest = @{ URL32 = $url32; Checksum32 = $sum32; URL64 = $url64; Checksum64 = $sum64; Version = $version }
    return $Latest
}

update