function getDirSize($dir)
{
    $result = ls $dir -Recurse | measure -Property Length -Sum
    return [math]::Round(($result).Sum/1GB,2)
}

getDirSize $dir