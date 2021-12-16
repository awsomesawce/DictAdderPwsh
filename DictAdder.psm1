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
