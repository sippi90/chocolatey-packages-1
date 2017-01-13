import-module au

$releaseNotesUrl = 'https://www.redfox.bz/download/changes_anydvd.txt'
$baseDownloadUrl = 'https://www.redfox.bz/download/SetupAnyDVD'

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
    $releaseNotes = Invoke-WebRequest $releaseNotesUrl

    #The new version number is located near the top of the file with the following pattern
	# X.X.X.X YYYY MM DD
	$found = $releaseNotes.Content -match '([0-9]+\.?){4} 20([0-9]{2}) [0-1][0-9] [0-3][0-9]'
	if ($found) {
		$version = $matches[0] -split ' ' | select -First 1
		
		# The file URLs use a version number with the dot character stripped out
		$shortVersion = $version -replace '\.', ''
		
		# Compute the path to the exe
		$url32 = $url64 = $baseDownloadUrl + $shortVersion + '.exe'
		
		# Download the exe and compute an sha256
		Write-Host Calculating SHA256 checksum...
		$tmpFile = [System.IO.Path]::GetTempFileName()
		wget -Uri $url32 -OutFile $tmpFile
		$sum32 = Get-FileHash $tmpFile -Algorithm sha256
		$sum32 = $sum64 = $sum32.Hash
		rm $tmpFile
		Write-Host SHA256: $sum32
		
		$Latest = @{ URL32 = $url32; Checksum32 = $sum32; URL64 = $url64; Checksum64 = $sum64; Version = $version }
	} else {
		Write-Host Version not found
	}
    
    return $Latest
}

update