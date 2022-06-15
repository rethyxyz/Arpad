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

/* Includes
 */

; For Microsoft Natural 4000 Ergonomic Keyboard extended keyset.
#Include %A_ScriptDir%\Natural_keyboard_4000_support.ahk

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

/* Program Variables
 *
 * Window Class: [1]
 * EXE paths:    [2]
 */

; Windows internal programs
FileExplorer	:= ["CabinetWClass", 	"C:\Windows\explorer.exe"]

; Shells and terminals.
WindowsTerminal	:= ["CASCADIA_HOSTING_WINDOW_CLASS",	"C:\Users\" . A_UserName . "\AppData\Local\Microsoft\WindowsApps\wt.exe"]
PowerShell		:= ["ConsoleWindowClass", 				"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"]
Cmder			:= ["VirtualConsoleClass", 				"C:\Users\" . A_UserName . "\Downloads\cmder\Cmder.exe"]

; Text editors and IDEs.
gVim			:= ["Vim",					"C:\tools\vim\vim82\gvim.exe"]
VSCode			:= ["Chrome_WidgetWin_1",	"C:\Program Files\Microsoft VS Code\Code.exe"]

; Web browsers.
Firefox			:= ["MozillaWindowClass", 	"C:\Program Files\Mozilla Firefox\firefox.exe"]
MicrosoftEdge 	:= ["Chrome_WidgetWin_1", 	"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"]
Chromium		:= ["Chrome_WidgetWin_1", 	"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"]
Qutebrowser		:= ["Qt5152QWindowIcon", 	"C:\Program Files\qutebrowser\qutebrowser.exe"]

; Chat clients.
Discord			:= ["Chrome_WidgetWin_1", 	"C:\Users\" . A_UserName . "\AppData\Local\Discord\app-1.0.9003\Discord.exe"]
HexChat			:= ["gdkWindowToplevel",	"C:\Program Files\HexChat\hexchat.exe"]
Telegram		:= ["Qt5152QWindowIcon",	"C:\Users\" . A_UserName . "\AppData\Roaming\Telegram Desktop\Telegram.exe"]

; Music clients.
Clementine		:= ["QWidget",									"C:\Program Files (x86)\Clementine\clementine.exe"]
Foobar2000		:= ["{97E27FAA-C0B3-4b8e-A693-ED7881E99FC1}",	"C:\Program Files (x86)\foobar2000\foobar2000.exe"]

; Video clients.
VLC				:= ["Qt5QWindowIcon", 	"C:\Program Files\VideoLAN\VLC\vlc.exe"]

; Legal downloading...
Soulseek		:= ["Qt5QWindowIcon",		"C:\Program Files (x86)\SoulseekQt\SoulseekQt.exe"]
qBittorrent		:= ["Qt5152QWindowIcon",	"C:\Program Files\qBittorrent\qbittorrent.exe"]
Picard			:= ["Qt5152QWindowIcon",	"C:\Program Files\MusicBrainz Picard\picard.exe"]

; Misc.
OBS				:= ["Qt5152QWindowIcon",	"C:\Program Files\obs-studio\bin\64bit\obs64.exe"]

/* Directories
 */

DownloadsDirectory 		= "C:\Users\" . A_UserName . "\Downloads"
MusicDirectory 			= "A:\Music"
PicturesDirectory 		= "T:\Pictures"
SoftwareDirectory 		= "S:\Computer programs\Windows"
VideosDirectory 		= "V:"
RepositoriesDirectory 	= "T:\Archives\Repositories"

/* Files
 */

TODOFile 			= "C:\Users\" . A_UserName . "\Desktop\TODO.txt"
ScratchPadFile 		= "C:\Users\" . A_UserName . "\Desktop\ScratchPad.txt"

/* Windows + ?
 */

#b:: RaiseOrRun(MicrosoftEdge[1], 	MicrosoftEdge[2])
#c:: RaiseOrRun(Clementine[1], 		Clementine[2])
#h:: RaiseOrRun(HexChat[1], 		HexChat[2])
#n:: RaiseOrRun(Foobar2000[1], 		Foobar2000[2])
#o:: RaiseOrRun(OBS[1], 			OBS[2])
#q:: RaiseOrRun(qBittorrent[1], 	qBittorrent[2])
#s:: RaiseOrRun(Soulseek[1], 		Soulseek[2])
#t:: RaiseOrRun(Telegram[1], 		Telegram[2])
#v:: RaiseOrRun(VSCode[1], 			VSCode[2])
#p:: RaiseOrRun(Picard[1], 			Picard[2])
#f:: Send {F11}

/* Windows + Shift + ?
 */

#+d:: RaiseOrRun(Discord[1], 		Discord[2])
#+q:: RaiseOrRun(Qutebrowser[1], 	Qutebrowser[2])
#+v:: RaiseOrRun(VLC[1], 			VLC[2])
#+i:: ExecuteProgram(gVim[2], 		A_ScriptFullPath)
#+t:: ExecuteProgram(gVim[2], 		TODOFile)
#+r:: Reload

/* Windows + Ctrl + ?
 */

#^h:: Send ^#{Left}
#^l:: Send ^#{Right}

/* Alt + ?
 */

!h:: Send {Left}
!j:: Send {Down}
!k:: Send {Up}
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

#Enter:: RaiseOrRun(Cmder[1], Cmder[2])
#+Enter:: RaiseOrRun(Cmder[1], Cmder[2])
$Pause:: Send ^{w}
Capslock:: Escape

/* Microsoft Natural 4000 Ergonomic Keyboard Keys.
 *
 * If you don't have this keyboard, that's okay. The only thing 
 * you'll miss is the extended key set. Beside that, you can use 
 * rethy-key-system normally.
 */

MsNatural4000_Favorites1:
	RaiseOrRun(MicrosoftEdge[1], MicrosoftEdge[2])
	return
MsNatural4000_Favorites2:
	RaiseOrRun(Cmder[1], Cmder[2])
	return
MsNatural4000_Favorites3:
	RaiseOrRun(FileExplorer[1], FileExplorer[2])
	return
MsNatural4000_Favorites4:
	RaiseOrRun(gVim[1], gVim[2])
	return
MsNatural4000_Favorites5:
	RaiseOrRun(Foobar2000[1], Foobar2000[2])
	return

MsNatural4000_MyFavorites:
	RaiseOrRun(gVim[1], gVim[2])
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
