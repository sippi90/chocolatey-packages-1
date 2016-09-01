import-module au

$downloadsUrl = 'https://www.wholetomato.com/downloads/default.asp'
$installUrl = 'https://www.wholetomato.com/downloads/getBuild.asp?'

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
	$elements = $downloads.AllElements
	
	# The version number is given in a line like "Version XX.XX.XXXX"
	$regex = [regex] 'Version [0-9]+\.[0-9]+\.[0-9]+'
	$match = $regex.Match($elements.innerText)
	$version = $match -split ' ' | Select -Last 1
	
	# Get the build number. We need this to construct the install URL
	$regex = [regex] 'Build [0-9]+'
	$match = $regex.Match($elements.innerText)
	$build = $match -split ' ' | Select -Last 1
	$url64 = $url32 = $installUrl + $build

	$Latest = @{ URL32 = $url32; Checksum32 = $sum32; URL64 = $url64; Checksum64 = $sum64; Version = $version }
    return $Latest
}

update