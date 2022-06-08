# scFormatter
Simple Powershell ISE Script to format from msfvenom (1234) shellcode to Powershell (0x12 0x34) shellcode


## How To
Create shellcode in msfvenom\
`msfvenom -p windows/x64/exec CMD=calc.exe -f raw -o calc.bin`\
![capture292](https://user-images.githubusercontent.com/18358246/172686836-42068b8f-b219-456a-aa69-72ba70903c90.PNG)

Open binary file in Sublime\
![capture293](https://user-images.githubusercontent.com/18358246/172687054-0db617b9-19d5-407d-b405-68871052ed4f.PNG)

Copy and Paste into $shellcode in scFormatter.ps1\
![capture294](https://user-images.githubusercontent.com/18358246/172687405-bc4dc6c3-815c-4672-bd89-53b12523eb11.PNG)


## Expected output:
![capture290](https://user-images.githubusercontent.com/18358246/172686331-660547c1-4e10-4496-a296-da47de664685.PNG)

![capture291](https://user-images.githubusercontent.com/18358246/172686572-cc523984-a479-43fb-b887-b8df2fb131e0.PNG)
