$ErrorActionPreference = 'Stop';

## Handle version
if ($env:chocolateyPackageVersion) {
  $version = $env:chocolateyPackageVersion
}
else {
  $version = "1.0.23"
}

$installationDir = "$(join-path $(Get-ToolsLocation) "wabt-$version")"

write-host "Removing $installationDir" -ForegroundColor Blue
if (Test-Path "$installationDir") {
  rm -Recurse -Force "$installationDir"
}


write-host "Removing emscripten from PATH" -ForegroundColor Blue
$path_regex = [regex]::escape($installationDir)
try {
  $envPath = [Environment]::GetEnvironmentVariable("PATH", "User")
  $newPath = $envPath -replace ($path_regex + "[^;]*;"), "" -replace ($path_regex + "[^;]*;?$"), ""
  [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
}
catch {
  Write-Host "Error Message: [$($_.Exception.Message)"] -ForegroundColor Red
}