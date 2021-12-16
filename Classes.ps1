#!/usr/bin/env pwsh
<#
.NOTES
Classes involving collections
#>

class StrObjDict : System.Collections.Generic.SortedDictionary[string,object]  {
    <#
    .DESCRIPTION
    Generic dict subclassing
    #>
    # Property: Holds name
    [String] $Name

    # Constructor: Creates a new MyClass object, with the specified name
    StrObjDict () {}
    StrObjDict ([String] $NewName) {
        # Set name for GenericDict 
        $this.Name = $NewName
    }
    StrObjDict ([string]$a, [object]$obj) {
        $this[$a] = $obj
    }
    [string]ToJSON() {
        return ConvertTo-Json -InputObject $this
    }
}

function Create-HyDict {
    <#
    .SYNOPSIS
    Creates or adds to a HybridDictionary
    .DESCRIPTION
    Checks if $Key and $Val are not empty, then if a hybrid dict is supplied, add to that instead
    of creating one
    #>
    param (
        [ValidateNotNullOrEmpty()][string]$Key,
        [ValidateNotNull()][object]$Val,
        [System.Collections.Specialized.HybridDictionary]$MyHyDict
    )
    if ($MyHyDict -and ($MyHyDict -is [System.Collections.Specialized.HybridDictionary])) {
        $MyHyDict.Add($Key, $Val)
        $HyDict = $MyHyDict
        Remove-Variable MyHyDict
    } else {
        $HyDict = [System.Collections.Specialized.HybridDictionary]::new()
        $HyDict.Add($Key, $Val)
    }
    return $HyDict
}

class JSONHyDict : System.Collections.Specialized.HybridDictionary {
    [string]ToJSON() {
        return ConvertTo-Json -InputObject $this
    }
}

class JSONStrDict : System.Collections.Specialized.StringDictionary {
    [string]ToJSON() {
        <#
        .DESCRIPTION
        Returns a JSON array for some reason
        #>
        return ConvertTo-Json -InputObject $this
    }
}

$jstrs = [JSONStrDict]::new()
Write-Output $jstrs.Add
