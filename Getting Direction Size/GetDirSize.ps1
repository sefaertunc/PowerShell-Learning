param([string]$mainDir = "C:\SEFA")

function getDirSize($dir)
{
    $result = Get-ChildItem $dir -Recurse | Measure-Object -Property Length -Sum
    return [math]::Round(($result).Sum/1GB,2)
}

getDirSize $mainDir