# install-new-dot-file.ps1
# Installs or removes the "New .dotfile here" item in explorer's context menu
# author: Tim Zenner
# © Tim Zenner

Param ([Boolean]$remove = $false)

if ($remove -eq $True)
{
    Write-Host "Info" -NoNewline -ForegroundColor Cyan
    Write-Host "::" -NoNewline
    Write-Host "Attempting to remove newdotfile from menu..."
}
else
{
    Write-Host "Info" -NoNewline -ForegroundColor Cyan
    Write-Host "::" -NoNewline
    Write-Host "Attempting to install newdotfile to menu..."
}

$success = $True

$hkcr = Test-Path "HKCR:\"

if ($hkcr -ne $true)
{
    $registry = New-PSDrive -PSProvider registry -Name HKCR -Root HKEY_CLASSES_ROOT
}

$menupath = "HKCR:\Directory\Background\shell"
$menuname = "New .dotfile here"
$commandpath = "$menupath\$menuname"
$commandname = "command"
$commandvalue = "cmd.exe /C newdotfile.bat"

if ($remove -eq $True)
{
    $exists = Test-Path "$menupath\$menuname"

    if ($exists -eq $True)
    {
        # do uninstall
        # but probably shouldn't force this one :O
        Remove-Item -Path "$menupath\$menuname" -Recurse *>$null
    }

    $exists = Test-Path "$menupath\$menuname"

    if ($exists -eq $True)
    {
        # failed to write entries
        Write-Host "Error" -NoNewline -ForegroundColor Red
        Write-Host "::" -NoNewline
        Write-Host "Failed to remove: $menupath\$menuname"

        return
    }

    # registry entries were successfully removed
    Write-Host "Success" -NoNewline -ForegroundColor Green
    Write-Host "::" -NoNewline
    Write-Host "Registry entries removed successfully."
}
else
{
    # do install
    New-Item -Path $menupath -Name $menuname -Force *>$null
    New-Item -Path $commandpath -Name $commandname -Force *>$null
    Set-ItemProperty -Path "$commandpath\$commandname" -Name "(Default)" -Value $commandvalue *>$null

    $created = Test-Path "$commandpath\$commandname"

    if ($created -eq $false)
    {
        # failed to write entries
        Write-Host "Error" -NoNewline -ForegroundColor Red
        Write-Host "::" -NoNewline
        Write-Host "Failed to create: $commandpath\$commandname"

        $success = $False
    }

    # registry entries were successfully created
    Write-Host "Success" -NoNewline -ForegroundColor Green
    Write-Host "::" -NoNewline
    Write-Host "Registry entries created successfully."
}

if ($success -eq $True)
{
    Write-Host "Success" -NoNewline -ForegroundColor Green
    Write-Host "::" -NoNewline
    Write-Host "Operation completed successfully."
}
else
{
    Write-Host "Error" -NoNewline -ForegroundColor Red
    Write-Host "::" -NoNewline
    Write-Host "Operation failed."
}
