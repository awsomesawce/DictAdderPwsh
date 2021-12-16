# Example script for using DictAdder.psm1
# Takes each string and pipes it all into the dictionary
# You can then take the dict and convert it to a nice json file using
# `Convertto-json`

"srvman", "wixtoolset", "unbound", "sendmail", "sed", "ravendb", "simple-http-server", "serve", "sentry-cli", "tfsec", "zookeeper", "firebase", "redpen", "selenium" | foreach-Object {
Add-scoopinfotohydict -hd $hd -pkgkey $_
}
