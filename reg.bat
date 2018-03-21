start cmd.exe /c REG ADD "HKLM\SOFTWARE\Khronos\Vulkan\Drivers" /v "C:\Windows\winevulkan.json" /t REG_DWORD /d 0x00000000 /f /reg:64
exit 0
