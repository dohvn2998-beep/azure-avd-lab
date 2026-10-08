[CmdletBinding()]
param([Parameter(Mandatory)][string]$Version)

$ErrorActionPreference = "Stop"

git fetch --all --tags
git show-ref --tags $Version
git ls-tree -r --name-only $Version

Write-Host ""
Write-Host "Inspect without changing main:"
Write-Host "  git switch --detach $Version"
Write-Host ""
Write-Host "Return to main:"
Write-Host "  git switch main"
Write-Host ""
Write-Host "IMPORTANT: run terraform plan after restoring code. Do not blindly apply."
