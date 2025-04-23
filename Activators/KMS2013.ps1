if ($PSUICulture -eq "ru-RU") {$host.ui.RawUI.WindowTitle = "MalwTool — Активация Office 2013 через KMS"}
else {$host.ui.RawUI.WindowTitle = "MalwTool — Activating Office 2013 via KMS"}
if (test-path "$env:ProgramFiles\Microsoft Office\Office15\ospp.vbs"){ 
    $path = "$env:ProgramFiles\Microsoft Office\Office15"
}
elseIf (test-path "${env:ProgramFiles(x86)}\Microsoft Office\Office15\ospp.vbs") {
    $path = "${env:ProgramFiles(x86)}\Microsoft Office\Office15"
}

New-Item -ItemType Directory -Path "$env:temp\MalwTool"
Invoke-WebRequest -Uri "https://github.com/ImMALWARE/MalwTool/raw/main/files/Office_2013_Library.zip" -OutFile $env:temp\MalwTool\library.zip
Expand-Archive -Path "$env:temp\MalwTool\library.zip" -DestinationPath "$env:temp\MalwTool\"
Set-Location "$env:temp\MalwTool"
Get-ChildItem -Path . -Filter "*.xrm-ms" | ForEach-Object { cscript "$path\ospp.vbs" /inslic:"$($_.FullName)" }
Set-Location $path
cscript //nologo ospp.vbs /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT
cscript //nologo ospp.vbs /sethst:kms8.msguides.com
cscript //nologo ospp.vbs /setprt:1688
cscript //nologo ospp.vbs /act
pause