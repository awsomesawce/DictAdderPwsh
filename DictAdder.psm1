using namespace System.Collections
using namespace System.Collections.Specialized

function Add-toDict {
<#
.PARAMETER dict
`$dict` is an OrderedDictionary
Pass it as the variable for $dict and u will alter state of the dict,
not return a new dict.
.SYNOPSIS
Add an entry to an OrderedDictionary that is a wsl package
.DESCRIPTION
Not yet
#>
[CmdletBinding()]
param(
[ValidateNotNullOrEmpty()][string]$pkgname,
[System.Collections.Specialized.OrderedDictionary]$dict
)
if ($pkgname -and $dict){
$result = wsl aptitude show $pkgname
return $dict.Add($pkgname, $result)
} elseif ($pkgname -and !($dict)) {
$result = wsl aptitude show $pkgname
$dict = [System.Collections.Specialized.OrderedDictionary]::new()
$dict.Add($pkgname, $result)
return $dict
}
return 0
}

function Add-toHybridDict {
[CmdletBinding()]
[OutputType([System.Collections.Specialized.HybridDictionary])]
param(
    [Parameter(Mandatory=$false, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()][string]$pkgname,
    [Parameter(Mandatory=$false, Position=1, ValueFromPipeline=$false)]
    [System.Collections.Specialized.HybridDictionary]$dict
)
    if ($pkgname -and $dict){
        $result = wsl aptitude show $pkgname
        return $dict.Add($pkgname, $result)
    } elseif ($pkgname -and !($dict)) {
        $result = wsl aptitude show $pkgname
        $dict = [System.Collections.Specialized.HybridDictionary]::new()
        $dict.Add($pkgname, $result)
        return $dict
    }
return $dict.Count
}

function Add-toStringCollection {}

function Get-OrderedDict {
    <#
    .SYNOPSIS
    Gets a dict and displays it on the cmdline
    #>
    [CmdletBinding()]
    param(
    [ValidateNotNullOrEmpty()][OrderedDictionary]$ODict
    )
    if ($ODict -is [OrderedDictionary]) {
        return $ODict
        Write-Host "It worked"
    } elseif (!($ODict)) {
        write-output "`$ODict is not there"
    } else {
        write-error "something else happened"
    }
}
