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
