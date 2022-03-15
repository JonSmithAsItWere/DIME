Option Explicit
Dim objFSO, objShell, scriptDir, htaName

htaName = "DIME.hta"

Set objFSO = CreateObject("Scripting.FileSystemObject")
scriptDir = objFSO.GetParentFolderName(WScript.ScriptFullName)

If objFSO.FileExists(scriptDir & "\" & htaName) Then
    Set objShell = CreateObject("WScript.Shell")
    If WScript.Arguments.count > 0 Then
        objShell.run ("""" & scriptDir & "\" & htaName & """ " & WScript.Arguments(0))
    Else
        objShell.run ("""" & scriptDir & "\" & htaName)
    End If
    Set objShell = Nothing
Else
    WScript.echo scriptDir & "\" & htaName & " not found"
End If

Set objFSO = Nothing
WScript.Quit
