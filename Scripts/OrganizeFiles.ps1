param(
    [string]$source = "C:\SEFA\Work\GIT\PowerShell-Learning\Unorganized",
    [string]$Destination = "C:\SEFA\Work\GIT\PowerShell-Learning\Organized"
)

function CheckFolder($folder) {
    if (Test-Path -Path $folder) {
        Write-Host "The folder exists!"
    }
    else {
        Write-Host "The folder doesn't exist"
        Write-Host "New folder is being created"
        mkdir ./$folder
    }
    
}

CheckFolder "Organized"