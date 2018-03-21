@echo off
start "" "C:\Windows\system32\cmd.exe"
REG ADD "HKLM\SOFTWARE\Khronos"
REG ADD "HKLM\SOFTWARE\Khronos\Vulkan"
REG ADD "HKLM\SOFTWARE\Khronos\Vulkan\Drivers" /v "C:\Windows\winevulkan.json" /t REG_DWORD /d 0x00000000 /f /reg:64
exit 0
