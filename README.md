# scFormatter
Simple Powershell ISE Script to format from msfvenom (1234) shellcode to Powershell (0x12 0x34) shellcode

## How To
Create shellcode in msfvenom\
`msfvenom -p windows/x64/exec CMD=calc.exe -f raw -o calc.bin`

Open binary file in Sublime

Copy and Paste into $shellcode in scFormatter.ps1
