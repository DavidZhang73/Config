Import-Module z
oh-my-posh init pwsh --config "https://raw.githubusercontent.com/DavidZhang73/Config/master/themes/mytheme.omp.json" | Invoke-Expression
try { $null = Get-Command concfg -ea stop; concfg tokencolor -n enable } catch { }  # concfg

# Custom config
$Env:VIRTUAL_ENV_DISABLE_PROMPT = $true  # disable python virtualenv prompt, because it's already handled by oh-my-posh
Set-PSReadLineOption -PredictionViewStyle ListView  # use list view for auto completion

# Custom functions
function update {
    Write-Host "[1/2] Scoop Updating"
    sudo scoop update *
    Write-Host "`n`n"
    Write-Host "[2/2] PS Module Updating"
    Update-Module
    Write-Host "Finished"
}
function mkdir { New-Item "$args" -ItemType Directory }

# Alias
Set-Alias -Name upd -Value update
Set-Alias -Name updt -Value update
Set-Alias -Name which -Value Get-Command
