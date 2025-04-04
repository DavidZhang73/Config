Import-Module Terminal-Icons
oh-my-posh init pwsh --config "https://raw.githubusercontent.com/DavidZhang73/Config/master/themes/mytheme.omp.json" | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })
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
function proxy_on {
    $Env:http_proxy = "http://127.0.0.1:7890"
    $Env:HTTP_PROXY = "http://127.0.0.1:7890"
    $Env:https_proxy = "http://127.0.0.1:7890"
    $Env:HTTPS_PROXY = "http://127.0.0.1:7890"
    $Env:all_proxy = "http://127.0.0.1:7890"
    $Env:ALL_PROXY = "http://127.0.0.1:7890"
    git config --global http.proxy 'http://127.0.0.1:7890'
    git config --global https.proxy 'https://127.0.0.1:7890'
    scoop config aria2-enabled false
}
function proxy_off {
    $Env:http_proxy = ""
    $Env:HTTP_PROXY = ""
    $Env:https_proxy = ""
    $Env:HTTPS_PROXY = ""
    $Env:all_proxy = ""
    $Env:ALL_PROXY = ""
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    scoop config aria2-enabled true
}

# Alias
Set-Alias -Name upd -Value update
Set-Alias -Name updt -Value update
Set-Alias -Name which -Value Get-Command