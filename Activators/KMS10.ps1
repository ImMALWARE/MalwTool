if ($PSUICulture -eq "ru-RU") {$host.ui.RawUI.WindowTitle = 'MalwTool — Активация Windows 10/11 через KMS'}
else {$host.ui.RawUI.WindowTitle = 'MalwTool — Activating Windows 10/11 via KMS'}

Set-Location $env:SystemRoot\System32
./cscript.exe //nologo slmgr.vbs /ckms > $null
./cscript.exe //nologo slmgr.vbs /upk > $null
./cscript.exe //nologo slmgr.vbs /cpky > $null
./cscript.exe //nologo slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 > $null # Home
./cscript.exe //nologo slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX > $null # Pro
./cscript.exe //nologo slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 > $null # Enterprise
./cscript.exe //nologo slmgr.vbs /ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ > $null # Enterprise LTSB 2016
./cscript.exe //nologo slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D > $null # Enterprise LTSC 2019
./cscript.exe //nologo slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D > $null # Enterprise LTSC 2021, 2024
./cscript.exe //nologo slmgr.vbs /ipk KBN8V-HFGQ4-MGXVD-347P6-PDQGT > $null # IoT Enterprise LTSC 2021, 2024
./cscript.exe //nologo slmgr.vbs /skms kms.loli.best > $null
./cscript.exe //nologo slmgr.vbs /ato
pause