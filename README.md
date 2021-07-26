# chocolatey-wabt
 Chocolatey package for wabt

## Install
Install chocolatey from [here](https://chocolatey.org/install) then:
```ps1
choco install wabt
```

**Note**: The tools are installed in "C:/tools/wabt-$version".

# Uninstall
```ps1
choco uninstall wabt
```

**Note**: The tools are removed from "C:/tools/wabt-$version".

# Install without chocolatey
You should have git installed. These scripts all run in PowerShell.

1) Clone this repository:
```ps1
git clone https://github.com/aminya/chocolatey-wabt.git
cd chocolatey-wabt\tools
```

2) run `chocolateyInstall`
```ps1
.\chocolateyInstall.ps1
```

This installs the pre-specified version. If you want to install a certain version first set `$env:chocolateyPackageVersion` environment variable and then run install:
```ps1
$env:chocolateyPackageVersion="1.0.23"
.\chocolateyInstall.ps1
```

# Uninstall without chocolatey
```ps1
$env:chocolateyPackageVersion="1.0.23"
.\chocolateyUninstall.ps1
```
