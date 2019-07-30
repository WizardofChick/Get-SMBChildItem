Function Get-SMBChildItem{
    [CmdletBinding()]
    [OutputType([String[]])]
    Param ( 
        [Parameter(Mandatory=$true)][String[]]$HostName
    )

    $RawNetViewResult = (net view $HostName) 
    $SmbChildItems = $RawNetViewResult|ForEach-Object {if($_.IndexOf(' Disk ') -gt 0){$_.Split(' ')[0] }}
    return $SmbChildItems
}

(Get-SMBChildItem("\\localhost")).GetType()