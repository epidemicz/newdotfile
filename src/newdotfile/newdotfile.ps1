#
# newdotfile.ps1
# author: Tim Zenner 
# © Tim Zenner

function Create-Dot-File ($path)
{
	$result = $False

	# check to see if file exists already
	$exists = Test-Path $path

	if ($exists -eq $True)
	{
		$overwrite = $False

		do
		{
			$input = Prompt-For-Overwrite

			Write-Host "input = $input"

			if ($input -eq "")
			{
				return $False
			}

		}
		until ($input -eq "y" -or $input -eq "n")

		if ($input -eq "y")
		{
			$overwrite = $True
		}
	}

	if ($overwrite -eq $False)
	{
		$result = $False
	}
	else
	{
		# create file
		$createdfile = New-Item $filename -Type file -Force

		if ($createdfile.Exists)
		{
			$result = $True
		}
	}

	return $result
}

function Prompt-For-Overwrite
{
	Write-Host "Warning: this file already exists." -fore red
	Write-Host "Overwrite? (y/n): " -fore yellow -NoNewLine
	$input = Read-Host
	return $input.ToLower()
}

Write-Host "Dot File Creation Utility" -ForegroundColor yellow
Write-Host "--------------------"
Write-Host "Current directory: " $pwd.Path
Write-Host "Enter dotfile name: ." -NoNewLine
$filename = Read-Host

# dont do anything if bad input
if ($filename -ne "")
{
	$filename = ".$filename"

	if (Create-Dot-File $filename)
	{
		Write-Host "The dotfile has been created." -ForegroundColor cyan
	}
	else
	{
		Write-Host "Warning: The dotfile was not created or already exists" -ForegroundColor Red
	}
}

Write-Host "...script finished, press any key to exit..."
$key = $host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown")	
