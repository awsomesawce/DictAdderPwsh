# For some reason the using statements arent working
using namespace System.Collections
using namespace System.Collections.Specialized
using namespace System.Collections.Generic

function Add-toGenericSortedDict {
<#
.DESCRIPTION
Adds to or creates a sorted dictionary
#>
[CmdletBinding()]
param(
	[Parameter(Mandatory=$false,HelpMessage="Dict if we have one")]
	[SortedDictionary[string,object]]$sd,
	[Parameter()]
	[string]$key,
	[Parameter()]
	[object]$val
)
if ($sd.GetType().Name -eq 'SortedDictionary`2') {
	$sd.Add($key, $val)
} else {
	$sd = [SortedDictionary[string,object]]::new()
	$sd.Add($key, $val)
	return $sd
}
return $true
}

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
function Add-scoopinfotohydict {
    <#
    .DESCRIPTION
    Add pkgkey and `scoop info pkgkey` to dict, only if dict exists.
    #>
    [cmdletbinding()]
    param(
        [parameter()]
        [System.Collections.Specialized.HybridDictionary]$hd,
        [parameter()]
        [string]$pkgkey
    )
    if ($hd.GetType().Name -eq "HybridDictionary") {
        return $hd.Add($pkgkey, $(scoop info $pkgkey))
    } else {
        Write-Error "Wrong Data type, not hybrid dictionary"
    }
}
function obj_to_file {
param(
[Parameter()]
[object]$Obj,
[Parameter(Mandatory=$false)]
[ValidateNotNullOrEmpty()][string]$FileName
)
$jsonstring = $Obj | convertto-json
Set-Content -Value $jsonstring -Path "$FileName" -Confirm -Verbose
return "Put jsonstring into $FileName"
}
