# Description: Simple Powershell ISE Script to format from 
#              msfvenom (1234) shellcode to Powershell (0x12,0x34) shellcode
# Author: @stryker2k2
# Link: github.com/stryker2k2/scFormatter
# Version: 1.1.0
# Last Modified: 20220608 @ 1300 CST

$calc = 
"fc48 83e4 f0e8 c000 0000 4151 4150 5251 5648 31d2 6548 8b52 6048 8b52 1848 8b52
2048 8b72 5048 0fb7 4a4a 4d31 c948 31c0 ac3c 617c 022c 2041 c1c9 0d41 01c1 e2ed
5241 5148 8b52 208b 423c 4801 d08b 8088 0000 0048 85c0 7467 4801 d050 8b48 1844
8b40 2049 01d0 e356 48ff c941 8b34 8848 01d6 4d31 c948 31c0 ac41 c1c9 0d41 01c1
38e0 75f1 4c03 4c24 0845 39d1 75d8 5844 8b40 2449 01d0 6641 8b0c 4844 8b40 1c49
01d0 418b 0488 4801 d041 5841 585e 595a 4158 4159 415a 4883 ec20 4152 ffe0 5841
595a 488b 12e9 57ff ffff 5d48 ba01 0000 0000 0000 0048 8d8d 0101 0000 41ba 318b
6f87 ffd5 bbf0 b5a2 5641 baa6 95bd 9dff d548 83c4 283c 067c 0a80 fbe0 7505 bb47
1372 6f6a 0059 4189 daff d563 616c 632e 6578 6500"

$shellcode = $calc

$chunks = $shellcode -split " ", 0
$counter = 0
$tmp = $env:TMP
$File   = $tmp + "\outfile.txt"
$Stream = [System.IO.StreamWriter]::new($File)

Write-Host "[+] Writing to file ..."
Write-Host "" 

$chunks | 
    %{
        #Write-Host $chunks[$counter] $chunks[$counter].Length
        $chunk = $chunks[$counter] -replace "`n"," "
        #Write-Host $chunk $chunk.Length

        if ($chunk.Length -gt 4){
            $subchunks = $chunk -split " ", 0
            $subcounter = 0
            Foreach ($subchunk in $subchunks)
            {
                # Writing to Console
                Write-Host "0x"-NoNewLine
                Write-Host $subchunk[0] -NoNewLine
                Write-Host $subchunk[1] -NoNewLine
                Write-Host "," -NoNewLine
                Write-Host "0x" -NoNewLine
                Write-Host $subchunk[2] -NoNewLine
                Write-Host $subchunk[3] -NoNewLine
                Write-Host "," -NoNewLine

                # Writing to Current Folder
                $Stream.Write("0x")
                $Stream.Write($chunk[0])
                $Stream.Write($chunk[1])
                $Stream.Write(",")
                $Stream.Write("0x")
                $Stream.Write($chunk[2])
                $Stream.Write($chunk[3])
                $Stream.Write(",")

                if ($subcounter -eq 0)
                {
                    Write-Host " "
                }
                $subcounter++
            }
            
        }
        else{
            $chunk = $chunks[$counter]
            Write-Host "0x"-NoNewLine
            Write-Host $chunk[0] -NoNewLine
            Write-Host $chunk[1] -NoNewLine
            Write-Host "," -NoNewLine
            Write-Host "0x" -NoNewLine
            Write-Host $chunk[2] -NoNewLine
            Write-Host $chunk[3] -NoNewLine
            Write-Host "," -NoNewLine

            $Stream.Write("0x")
            $Stream.Write($chunk[0])
            $Stream.Write($chunk[1])
            $Stream.Write(",")
            $Stream.Write("0x")
            $Stream.Write($chunk[2])
            $Stream.Write($chunk[3])
            $Stream.Write(",")
 
            #Write-Host $chunk $chunk.Length
        }

        $counter++
    }

$Stream.Close()

Write-Host "" 
Write-Host ""
Write-Host "[+] Task Completed!"
Write-Host "[+] File can be found at $file"

# output example:
# 0xfc,0x48,0x83,0xe4,0xf0,0xe8,0xc0,0x00...
