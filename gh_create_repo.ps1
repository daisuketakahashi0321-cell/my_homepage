Set-Location -LiteralPath 'C:\Users\Owner\Desktop\my_homepage'
$env:PATH = 'C:\Program Files\Git\cmd;' + $env:PATH
Write-Output "PWD=$(Get-Location)"
Write-Output "GIT_VERSION=$( & 'C:\Program Files\Git\cmd\git.exe' --version )"
Write-Output "GH_VERSION=$( & 'C:\Program Files\GitHub CLI\gh.exe' --version )"
& 'C:\Program Files\GitHub CLI\gh.exe' repo create my_homepage --public --source . --push 2>&1
