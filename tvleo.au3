If not ProcessExists("TeamViewer.exe") Then
    Run("TeamViewerPortable/TeamViewer.exe")
    WinWaitActive("TeamViewer")
EndIf
$hWnd = WinWait("TeamViewer", "", 10)

While True
    $MeuId = ControlGetText($hWnd, "", "Edit1")
    $Senha = ControlGetText($hWnd, "", "Edit2")
    If $MeuId <> "-" Then
        ExitLoop
    EndIf
    Sleep(1000)
WEnd

$sFilePath = "tvleo.ini"

$LastId = IniRead($sFilePath, "tvleo", "ID", "")
$LastPwd = IniRead($sFilePath, "tvleo", "Password", "")

If $LastId <> $MeuId Or $LastPwd <> $Senha Then
    IniWrite($sFilePath, "tvleo", "ID", $MeuId)
    IniWrite($sFilePath, "tvleo", "Password", $Senha)

    Run("x ""Acesso TeamViewer"" ""ID: " & $MeuId & "\nSenha: " & $Senha & """", "", @SW_HIDE)
    WinSetState($hWnd, "", @SW_HIDE)
EndIf

