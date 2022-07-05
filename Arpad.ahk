/*
    Arpad: A tiling window manager inspired key system for Windows.
    Copyright (C)  2022  Brody Rethy

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

#Include %A_ScriptDir%\Natural_keyboard_4000_support.ahk

/* Program Variables
 *
 * Window Class: [1]
 * EXE paths:    [2]
 */

; Windows internal programs
FileExplorer	:= ["CabinetWClass",				  "C:\Windows\explorer.exe"]
; Shells and terminals.
WindowsTerminal	:= ["CASCADIA_HOSTING_WINDOW_CLASS", "C:\Users\" . A_UserName . "\AppData\Local\Microsoft\WindowsApps\wt.exe"]
PowerShell		:= ["ConsoleWindowClass",			 "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"]
Cmder			:= ["VirtualConsoleClass",			 "C:\Users\" . A_UserName . "\Downloads\cmder\Cmder.exe"]
Cmd				:= ["ConsoleWindowClass",			 "C:\Windows\system32\cmd.exe"]
; Text editors and IDEs.
gVim			:= ["Vim",							 "C:\tools\vim\vim90\gvim.exe"]
VSCode			:= ["Chrome_WidgetWin_1",			 "C:\Program Files\Microsoft VS Code\Code.exe"]
; Web browsers.
Firefox		    := ["MozillaWindowClass",			 "C:\Program Files\Mozilla Firefox\firefox.exe"]
MicrosoftEdge   := ["Chrome_WidgetWin_1",			 "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"]
Chromium	    := ["Chrome_WidgetWin_1",			 "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"]
Qutebrowser	    := ["Qt5152QWindowIcon",			 "C:\Program Files\qutebrowser\qutebrowser.exe"]
; Chat clients.
Discord		    := ["Chrome_WidgetWin_1",			 "C:\Users\" . A_UserName . "\AppData\Local\Discord\app-1.0.9003\Discord.exe"]
HexChat		    := ["gdkWindowToplevel",			 "C:\Program Files\HexChat\hexchat.exe"]
Telegram	    := ["Qt5152QWindowIcon",			 "C:\Users\" . A_UserName . "\AppData\Roaming\Telegram Desktop\Telegram.exe"]
; Music clients.
Clementine	    := ["QWidget",						 "C:\Program Files (x86)\Clementine\clementine.exe"]
Foobar2000	    := ["{97E27FAA-C0B3-4b8e-A693-ED7881E99FC1}", "C:\Program Files (x86)\foobar2000\foobar2000.exe"]
; Video clients.
VLC				:= ["Qt5QWindowIcon",				 "C:\Program Files\VideoLAN\VLC\vlc.exe"]
mpv				:= ["mpv",							 "C:\ProgramData\chocolatey\lib\mpv.install\tools\mpv.exe"]
; Legal downloading...
soulseek		:= ["Qt5QWindowIcon",				 "C:\Program Files (x86)\SoulseekQt\SoulseekQt.exe"]
qbittorrent		:= ["Qt5152QWindowIcon",			 "C:\Program Files\qBittorrent\qbittorrent.exe"]
Picard			:= ["Qt5152QWindowIcon",			 "C:\Program Files\MusicBrainz Picard\picard.exe"]
; Misc.
OBS				:= ["Qt5152QWindowIcon",			 "C:\Program Files\obs-studio\bin\64bit\obs64.exe"]

/* File and Directory Variables.
 *
 * Standard AHK strings.
 */

; Directories
d_downloads    = "C:\Users\" . A_UserName . "\Downloads"
d_music 	   = "A:\Music"
d_pictures	   = "T:\Pictures"
d_repositories = "T:\Archives\Repositories"
d_software 	   = "S:\Computer programs\Windows"
d_videos 	   = "V:"
; Files
f_todo 	       = "C:\Users\" . A_UserName . "\Desktop\TODO.txt"
f_scratchpad   = "C:\Users\" . A_UserName . "\Desktop\Scratchpad.txt"

/* Bind Generic Variables
 *
 * This checks to make sure the programs sourced actually exist prior to
 * bind. Quite redundant, and not very modular. I'll think of a better way in
 * the future.
 */

; NOTE Future planning:

	; Classes
		; web_browsers
			; Example := ["xyz", "A:\y\x\w"]
		; music_players
			; Clementine := ["xyz", "A:\y\x\w"]
		; text_editors
		; video_players
		; torrent_client
		; terminal_client

; web_browser
if FileExist(MicrosoftEdge[2]) {
	web_browser := MicrosoftEdge
} else if FileExist(Chromium[2]) {
	web_browser := Chromium
} else if FileExist(Firefox[2]) {
	web_browser := Firefox
} else if FileExist(Qutebrowser[2]) {
	web_browser := Qutebrowser
} else {
	web_browser := MicrosoftEdge
}

; music_player
if FileExist(Clementine[2]) {
	music_player := Clementine
} else if FileExist(Foobar2000[2]) {
	music_player := Foobar2000
} else {
	music_player := Clementine
}

; text_editor
if FileExist(gVim[2]) {
	text_editor := gVim
} else if FileExist(VSCode[2]) {
	text_editor := VSCode
} else {
	text_editor := gVim
}

; video_player
if FileExist(mpv[2]) {
	video_player := mpv
} else if FileExist(VLC[2]) {
	video_player := VLC
} else {
	video_player := mpv
}

; torrent_client
; TODO Add more here.
if FileExist(qbittorrent[2]) {
	torrent_client := qbittorrent
} else {
	torrent_client := qbittorrent
}

; terminal_client
if FileExist(Cmder[2]) {
	terminal_client := Cmder
} else if FileExist(WindowsTerminal[2]) {
	terminal_client := WindowsTerminal
} else if FileExist(PowerShell[2]) {
	terminal_client := PowerShell
} else if FileExist(Cmd[2]) {
	terminal_client := Cmd
} else {
	terminal_client := Cmder
}

/* Windows + ?
 */

#b:: RaiseOrRun(web_browser[1],    web_browser[2])
#h:: RaiseOrRun(HexChat[1], 	   HexChat[2])
#m:: RaiseOrRun(music_player[1],   music_player[2])
#o:: RaiseOrRun(OBS[1], 		   OBS[2])
#p:: RaiseOrRun(Picard[1], 		   Picard[2])
#s:: RaiseOrRun(soulseek[1], 	   soulseek[2])
#t:: RaiseOrRun(torrent_client[1], torrent_client[2])
#v:: RaiseOrRun(video_player[1],   video_player[2])
#f:: Send {F11}

/* Windows + Shift + ?
 */

#+t:: RaiseOrRun(Telegram[1], 		 Telegram[2])
#+d:: RaiseOrRun(Discord[1], 		 Discord[2])
#+v:: RaiseOrRun(video_player[1], 	 video_player[2])
#+i:: ExecuteProgram(text_editor[2], A_ScriptFullPath)
#+r:: Reload

/* Windows + Ctrl + ?
 */

#^h:: Send ^#{Left}
#^l:: Send ^#{Right}
#^t:: ExecuteProgram(text_editor[2], f_todo)

/* Alt + ?
 */

!h:: Send  {Left}
!j:: Send  {Down}
!k:: Send    {Up}
!l:: Send {Right}

/* F1 - F12
 */

; Maximizes current window, but not the desktop, taskbar, start menu, or
; anything you wouldn't want to maximize normally.
$F1::
	if ( ! WinActive("ahk_class Progman") || ! WinActive("ahk_class WorkerW") || ! WinActive("ahk_Class DV2ControlHost") || (! WinActive("Start") && ! WinActive("ahk_class Button")) || ! WinActive("ahk_class Shell_TrayWnd"))
	{
		WinGet, MinMax, MinMax, A

		If (MinMax = 1)
		{
			WinRestore, A
			return
		}

		WinMaximize, A
		return
	}
$F2:: WinMinimize, A
$F4:: Send !{Tab}
$F6:: Send !{f4}
$F10:: Send {f11}
$F11:: Send ^{PgUp}
$F12:: Send ^{PgDn}
#F6::Run %Foobar2000% /prev
#F7::Run %Foobar2000% /pause
#F8::Run %Foobar2000% /next

/* Command keys
 */

#Enter:: RaiseOrRun(terminal_client[1], terminal_client[2])
#+Enter:: RaiseOrRun(terminal_client[1], terminal_client[2])
$Pause:: Send ^{w}
Capslock:: Escape

/* Microsoft Natural 4000 Ergonomic Keyboard Keys.
 *
 * If you don't have this keyboard, that's okay. The only thing 
 * you'll miss is the extended key set. Beside that, you can use 
 * this normally.
 */

MsNatural4000_Favorites1:
	RaiseOrRun(web_browser[1], web_browser[2])
	return
MsNatural4000_Favorites2:
	RaiseOrRun(terminal_client[1], terminal_client[2])
	return
MsNatural4000_Favorites3:
	RaiseOrRun(FileExplorer[1], FileExplorer[2])
	return
MsNatural4000_Favorites4:
	RaiseOrRun(text_editor[1], text_editor[2])
	return
MsNatural4000_Favorites5:
	RaiseOrRun(music_player[1], music_player[2])
	return

MsNatural4000_MyFavorites:
	RaiseOrRun(text_editor[1], text_editor[2])
	return

; Pressing NumpadEqual will toggle this script on/off.
MsNatural4000_NumpadEqual:
	Send ^{v}
	return
MsNatural4000_NumpadLeftBracket:
	Send ^#{Left}
	return
MsNatural4000_NumpadRightBracket:
	Send ^#{Right}
	return
MsNatural4000_ZoomDown:
	Send ^{-}
	return
MsNatural4000_ZoomUp:
	Send ^{+}
	return

/* Functions
 */

RaiseOrRun(WindowClass, ProgramPath)
{
    IfWinExist ahk_class %WindowClass%
    {
        WinActivateBottom, ahk_class %WindowClass%
        return
    }

    Run %ProgramPath%
    return
}

; Complete hack job (which is typical for AHK). Though, it works quite well if
; you click the taskbar first.
SwitchToWorkspace(WorkspaceID)
{
	WorkspaceID--

	; Go left 9 times.
	Loop, 9
	{
		Send ^#{Left}
	}

	Loop, %WorkspaceID%
	{
		Send ^#{Right}
	}
}

ExecuteProgram(ProgramPath, ProgramArgument)
{
	if (! ProgramArgument)
	{
		Run %ProgramPath%
		return
	}

	Run %ProgramPath% %ProgramArgument%
	return
}
