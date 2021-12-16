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
