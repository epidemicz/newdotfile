#@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://gist.githubusercontent.com/epidemicz/07acf2a65e6b835660ee/raw/3927b268da6b5ff833785732466ec85e7c982bc8/install-new-dot-file.ps1'))"

Param ([Boolean]$remove = $false)

function Install-New-Dot-File([Boolean]$remove = $false)
{
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

    if ($remove -eq $true)
    {
        $exists = Test-Path "$menupath\$menuname"

        if ($exists -eq $true)
        {
            # do uninstall
            # but probably shouldn't force this one :O
            Remove-Item -Path "$menupath\$menuname" -Recurse *>$null
        }

        $exists = Test-Path "$menupath\$menuname"

        if ($exists -eq $true)
        {
            # failed to write entries
            Write-Host "Error" -NoNewline -ForegroundColor Red
            Write-Host "::" -NoNewline
            Write-Host "Failed to remove: $menupath\$menuname"

            return $false
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

            return $false
        }

        # registry entries were successfully created
        Write-Host "Success" -NoNewline -ForegroundColor Green
        Write-Host "::" -NoNewline
        Write-Host "Registry entries created successfully."
    }

    return $true
}

if ($remove -eq $true)
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

$success = Install-New-Dot-File $remove

if ($success -eq $true)
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