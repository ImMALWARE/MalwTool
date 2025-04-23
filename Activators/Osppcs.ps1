$Product = $Product.Replace('Office ', '')
if ($PSUICulture -eq "ru-RU") {$host.ui.RawUI.WindowTitle = ("MalwTool — Активация Office $Product через подмену sppcs.d" + "ll")}
else {$host.ui.RawUI.WindowTitle = ("MalwTool — Activating Office $Product via replacing sppcs.d" + "ll")}

$lics = @{"365" = "O365ProPlusR"; "2024" = ("ProPlus2024VL_KM" + "S"); "2021" = "ProPlus2021VL_KMS"; "2019" = "ProPlus2019VL"; "2016" = ("proplusvl_km" + "s")}
$keys = @{"365" = "2N382-D6PKK-QTX4D-2JJYK-M96P2"; "2024" = "VWCNX-7FKBD-FHJYG-XBR4B-88KC6"; "2021" = "8WXTP-MN628-KY44G-VJWCK-C7PCF"; "2019" = "BN4XJ-R9DYY-96W48-YK8DM-MY7PY"; "2016" = "GM43N-F742Q-6JDDK-M622J-J8GDV"}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object net.webclient

if (Test-Path "$env:ProgramFiles\Microsoft Office\root\vfs\System") {
    $path = "$env:ProgramFiles\Microsoft Office"
    cmd /c mklink ("$path\root\vfs\System\sppcs.d" + "ll") ("$env:SystemRoot\System32\sppc.d" + "ll")
    $wc.DownloadFile(("https://raw.githubusercontent.com/ImMALWARE/MalwTool/refs/heads/main/files/sppc64.d" + "ll"), ("$path\root\vfs\System\sppc.d" + "ll"))
} elseif (Test-Path "${env:ProgramFiles(x86)}\Microsoft Office\root\vfs\SystemX86") {
    $path = "${env:ProgramFiles(x86)}\Microsoft Office"
    cmd /c mklink ("$path\root\vfs\System" + "X86\sppcs.d" + "ll") ("$env:SystemRoot\Sys" + "WOW64\sppc.d" + "ll")
    $wc.DownloadFile(("https://raw.githubusercontent.com/ImMALWARE/MalwTool/refs/heads/main/files/sppc32.d" + "ll"), ("$path\root\vfs\SystemX86\sppc.d" + "ll"))
}

Set-Location "$path\Office16"
Get-ChildItem -Path "..\root\Licenses16\" -Filter "$($lics[$Product])*.xrm-ms" | ForEach-Object { cscript ospp.vbs /inslic:"$($_.FullName)" }
cscript //nologo ospp.vbs /inpkey:$($keys[$Product])
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\16.0\Common\Licensing\Resiliency" -Name "TimeOfLastHeartbeatFailure" -Value "2040-01-01T00:00:00Z"
pause