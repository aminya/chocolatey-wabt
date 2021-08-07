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
