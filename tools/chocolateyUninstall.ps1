$ErrorActionPreference = 'Stop';

## Handle version
if ($env:chocolateyPackageVersion) {
  $version=$env:chocolateyPackageVersion
}
else {
  $version="1.0.23"
}

$installationDir = "$(join-path $(Get-ToolsLocation) "wabt-$version")"

write-host "Removing $installationDir" -ForegroundColor Blue
if (Test-Path "$installationDir") {
  rm -Recurse -Force "$installationDir"
}
