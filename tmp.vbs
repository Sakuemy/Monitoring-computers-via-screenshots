Do           
	Set WshShell = CreateObject("WScript.Shell")
	WshShell.Run "tmp.bat", 0, false
	WScript.Sleep 10000
Loop While (1 < 10)