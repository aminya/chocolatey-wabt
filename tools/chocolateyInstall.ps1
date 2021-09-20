$ErrorActionPreference = 'Stop';

## Handle version
if ($env:chocolateyPackageVersion) {
  $version=$env:chocolateyPackageVersion
}
else {
  $version="1.0.23"
}

# paths
$tarName = "wabt-$version-windows.tar"
$tarGzName = "$tarName.gz"

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tarFile = "$(join-path $toolsDir $tarName)"
$tarGzFile = "$(join-path $toolsDir $tarGzName)"

$installationDirDir = "$(Get-ToolsLocation)"
$installationDir = "$(join-path $installationDirDir "wabt-$version")"

# download
$url = "https://github.com/WebAssembly/wabt/releases/download/$version/$tarGzName"
Get-WebFile -Url $url -FileName $tarGzFile
Get-ChecksumValid -File $tarGzFile -Checksum "3b8e2330e3d9e0f668f716063be4fffd47fbeafb61041a130c5478dae94a4d08" -ChecksumType "sha256"

# decompress tar.gz
$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath64 = $tarGzFile
  Destination    = $toolsDir
}
Get-ChocolateyUnzip @packageArgs

# decompress tar
$packageArgs2 = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath64 = $tarFile
  Destination    = $installationDirDir
}
Get-ChocolateyUnzip @packageArgs2

Install-ChocolateyPath -PathToInstall "$(join-path $installationDir "bin")" -PathType User
