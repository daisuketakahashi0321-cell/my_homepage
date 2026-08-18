$fileId = '1b9AP5rwu-o1Ck622oRVogeP4Ur9QEraA'
$base = 'https://drive.google.com/uc?export=download'
$wc = New-Object System.Net.WebClient
$response = $wc.DownloadString("$base&id=$fileId")
$token = $null
if ($response -match 'confirm=([0-9A-Za-z_-]+)') { $token = $matches[1] }
if ($token) { $downloadUrl = "$base&id=$fileId&confirm=$token" } else { $downloadUrl = "$base&id=$fileId" }
$wc.Headers.Add('User-Agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64)')
$wc.DownloadFile($downloadUrl, 'images\teacher.jpg')
Write-Host "Saved:" (Get-Item 'images\teacher.jpg').FullName
$bytes = Get-Content -Path 'images\teacher.jpg' -Encoding Byte -TotalCount 4
Write-Host "Header:" ($bytes | ForEach-Object { $_.ToString('X2') } -join ' ')
