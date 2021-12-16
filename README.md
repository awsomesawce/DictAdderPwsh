# DictAdder powershell

`DictAdder.psm1` contains the `Add-toDict` function.
It simply adds an `aptitude show $pkgname` query to a dictionary (ordered).

The implications of this type of function are numerous.

Any kind of data that can be queried from the command line can be collected
into this dictionary and even saved as a `json` file using `Convertto-json`.

I can even create a new class that has fields for each field displayed on 
`apt` or `aptitude`.

**Powershell** + **WSL** = **WOW**.

