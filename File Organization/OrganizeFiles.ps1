param(
    [string]$Source = "C:\SEFA\Work\GIT\PowerShell-Learning\File Organization\Unorganized",
    [string]$Destination = "C:\SEFA\Work\GIT\PowerShell-Learning\File Organization\Organized"
)

function CheckFolder([string]$folder) {
    if (Test-Path -Path $folder) {
        Write-Host "The folder exists!"
    }
    else {
        Write-Host "The folder doesn't exist"
        Write-Host "New folder is being created"
        mkdir $folder | Out-Null
    }
}

function DisplayFolderStatistics ([string]$var_folder) {
    $files = Get-ChildItem $var_folder -Recurse | Where-Object {!$_.PSIsContainer}
    $totals = $files | Measure-Object -Property Length -Sum
    $stats = "" | Select path,count,size
    $stats.path = $var_folder
    $stats.count = $totals.Count
    $stats.size = [math]::Round($totals.Sum/1MB,2)
    return $stats
}

CheckFolder $Destination
DisplayFolderStatistics $Source