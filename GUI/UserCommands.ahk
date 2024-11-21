; Created by Asger Juul Brunshøj

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. Take inspiration from the samples provided here.

st := "D:\all\all\Sublime Text 3\sublime_text.exe"

; this is just a dummy condition, so that everything else starts with "else if Command ="
if 1 = 2
{ }
;-------------------------------------------------------------------------------
;;; SEARCH GOOGLE ;;;
;-------------------------------------------------------------------------------
else if Command = g%A_Space% ; Search Google
{
    gui_search_title = LMGTFY
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Command = ahk%A_Space% ; Search Google for AutoHotkey related stuff
{
    gui_search_title = Autohotkey Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Command = xxx%A_Space% ; Search Google as Incognito
;   A note on how this works:
;   The function name "gui_search()" is poorly chosen.
;   What you actually specify as the parameter value is a command to run. It does not have to be a URL.
;   Before the command is run, the word REPLACEME is replaced by your input.
;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
{
    gui_search_title = Google Search as Incognito
    gui_search("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
}
; Ref: https://duckduckgo.com/params
else if Command = xxxd%A_Space% ; Search DuckDuckGo as Incognito
{
    gui_search_title = DuckDuckGo Search as Incognito
    link := "https://duckduckgo.com/?q=REPLACEME&kp=-2&kaj=m&kam=google-maps&kc=1&kav=1&kh=1"
    gui_search("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito " . link)
}
else if Command = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}
else if Command = t%A_Space% ; Search torrent networks
{
    gui_search_title = Sharing is caring
    gui_search("https://kickass.to/usearch/REPLACEME")
}
else if Command = urba%A_Space% ; Search urbandictionary
{
    gui_search_title := "The dictionary which knows everything"
    gui_search("https://www.urbandictionary.com/define.php?term=REPLACEME")
}

;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if Command = cal ; Google Calendar
{
    gui_destroy()
    run https://www.google.com/calendar
}
else if Command = maps ; Google Maps
{
    gui_destroy()
    run "https://www.google.com/maps/"
}
else if Command = mail ; Open gmail
{
    gui_destroy()
    run "https://gmail.com"
    run "https://mail.tbp.land"
}
else if Command = fbmes ; Opens Facebook unread messages
{
    gui_destroy()
    run https://messenger.com
}
Else If Command = dest ; Google Maps destination
{
    gui_search_title := "Directions on Google Maps"
    gui_search("https://www.google.com/maps/dir/REPLACEME")
}

else if Command = url ; Open an URL from the clipboard (naive - will try to run whatever is in the clipboard)
{
    gui_destroy()
    run % Trim(ClipBoard)
}
else if Command = work
{
    gui_destroy()


    run "C:/Users/TheBestPessimist/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/JetBrains Toolbox/JetBrains Toolbox.lnk"
    run "C:/ProgramData/Microsoft/Windows/Start Menu/Docker Desktop.lnk"
    run D:/all/all/Vivaldi/Application/vivaldi.exe --profile-directory="Profile 3"
    sleep 4000
    run D:/all/all/Vivaldi/Application/vivaldi.exe --profile-directory="Profile 7"
    sleep 4000
    run D:\all\all\Vivaldi\Application\vivaldi.exe --profile-directory="Profile 9"
    ; run "C:/Users/TheBestPessimist/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Feces.lnk" "-disable-features=HardwareMediaKeyHandling"
}
else if Command = feces
{
    gui_destroy()
;    Run powershell.exe -NonInteractive -NoLogo -WindowStyle Hidden -ExecutionPolicy Bypass -File "Miscellaneous/Find_current_wallpaper.ps1"

    Run powershell.exe -NonInteractive -NoExit -ExecutionPolicy Bypass -File "Miscellaneous/feces.ps1"
}
else if Command = discord ; Discord
{
    gui_destroy()
    run "https://discordapp.com/channels/115993023636176902/439705591200481280"
    run "https://discordapp.com/channels/115993023636176902/115993023636176902"
}
else if Command = skype
{
    gui_destroy()
    run "https://preview.web.skype.com/"
}
else if Command = start ; Open user Startup folder
{
    gui_destroy()
    run "shell:startup"
}
else if Command = tias ; Try It And See
{
    gui_destroy()
    SendRaw % "[TIAS](https://discourse.tbp.land/uploads/default/original/1X/e741730b2b41b7ecd3672f986951038ca43af531.jpeg)"
}
else if Command = ks
{
    gui_destroy()
    run  taskkill /f /IM Skype*
}


;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if Command = dir ; Open the directory for this script
{
    gui_destroy()
    Run, %A_ScriptDir%
}
else if Command = user ; Edit GUI user commands
{
    gui_destroy()
    run, %st% "%A_ScriptDir%\GUI\UserCommands.ahk", , Max
}


;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------
else if Command = logo ; ¯\_(ツ)_/¯
{
    gui_destroy()
    SendRaw % "``¯\_(ツ)_/¯``"
}
else if Command = loser ; you're a loser now
{
    gui_destroy()
    a =
    (LTrim
        just wanna point out that according to tidbit you are officially a loser now:
        https://discordapp.com/channels/115993023636176902/115993023636176902/537059851021451274
        congratulations @OP!
    )
    SendRaw % a
}
else if Command = english ; MOTHERFUCKER, DO YOU SPEAK IT?
{
    gui_destroy()
    SendRaw % "https://www.youtube.com/watch?v=HbvYeLxMKN8"
}
else if Command = doit ; JUST DO IT!!!
{
    gui_destroy()
    SendRaw % "https://media.giphy.com/media/UqZ4imFIoljlr5O2sM/giphy.gif"
}
;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if Command = ss ; Screenshots folder
{
    gui_destroy()
    run D:\all\all\ShareX-portable\ShareX\Screenshots
}
else if Command = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}
else if Command = wall
{
    gui_destroy()
    Run powershell.exe -NonInteractive -NoLogo -WindowStyle Hidden -ExecutionPolicy Bypass -File "Miscellaneous/Find_current_wallpaper.ps1"

}
;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if Command = ping ; Ping Google
{
    gui_destroy()
    Run, cmd /K "ping -t www.google.com"
}
else if Command = date ; What is the date?
{
    gui_destroy()
    FormatTime, date,, LongDate
    MsgBox %date%
    date =
}
else if Command = ? ; Tooltip with list of commands
{
    GuiControl,, Command, ; Clear the input box
    Gosub, gui_commandlibrary
}
