[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Version,
    [string]$Message = "Release $Version"
)

$ErrorActionPreference = "Stop"

if ($Version -notmatch '^v\d+\.\d+\.\d+$') {
    throw "Version must use semantic version format such as v0.1.0"
}

git status
git add .
git commit -m $Message
git tag -a $Version -m $Message
git push origin main
git push origin $Version

Write-Host "Created and pushed $Version"
