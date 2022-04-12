new-item -Path 'D:\exp\pe.txt' -itemtype file 

Get-ChildItem -Recurse | Where-Object { $_.FullName -match 'pe.txt'}

