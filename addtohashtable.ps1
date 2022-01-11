function add-tohashtable {
param(
[parameter()]
[hashtable]$ht,
[parameter(Mandatory=$false,HelpMessage="Object to add to ht")]
[ValidateNotNull()][string]$key,
[parameter()]
[ValidateNotNullOrEmpty()][object]$val
)
if ($ht.GetType().Name -eq "Hashtable") {
write-verbose "Adding $key and $val to $ht"
$ht.Add($key, $val)
} else {
write-error "`$ht is the wrong type.  it is $($ht.gettype().Name)"
}
}

class MyHT : System.Collections.DictionaryBase {
    [string]$ValOne
    [string]$ValTwo
    [datetime]$Startdate = [datetime]::Now
}

<#
When copied and pasted, the Todos class worked just fine.
The problem is this won't be feasible in writing scripts unless 
Invoke-Expression is used.
#>

class Todos {
    <#
    .DESCRIPTION
    This is a collection of dictionary bases.
    #>
    [string]$Todoname
    [string]$Tododescription = 'optional'
    [datetime]$StartDate = [datetime]::Now
    [string]ToJson() {
        return $this | ConvertTo-Json | Out-String
    }
}


