#Persistent
#SingleInstance Force
#MaxThreadsPerHotkey 2

; === Configuration Constants ===
E_KEY_INTERVAL := 5000          ; E key press interval (5 seconds)
MAIN_CYCLE_DURATION := 4 * 60 * 1000  ; Main cycle duration (4 minutes)

; === Global Control Variables ===
mouseClickCounter := 0
isMouseSequenceRunning := false
isAutoPressingEnabled := true

; === Initialize Timers ===
SetTimer, AutoPressE, %E_KEY_INTERVAL%
SetTimer, MainCycleRoutine, %MAIN_CYCLE_DURATION%
Return

; ======== Auto E Key Press Routine ========
AutoPressE:
    If (isAutoPressingEnabled) {
        Send, e
    }
    Return

; ======== Main Cycle Handler ========
MainCycleRoutine:
    Send, e                    ; Initial E key press
    Sleep, 300                 ; Brief delay
    Send, 9                    ; Press 9 key
    Sleep, 300                 ; Additional delay
    
    ; Initialize mouse click sequence
    mouseClickCounter := 0
    isMouseSequenceRunning := true
    SetTimer, MouseClickHandler, 100
    Return

; ======== Mouse Click Sequence Controller ========
MouseClickHandler:
    If (mouseClickCounter < 20) {
        mouseClickCounter++
        Click                   ; Single left click
        
        ; Mid-sequence pause after 10 clicks
        If (mouseClickCounter = 10) {
            SetTimer, MouseClickHandler, Off
            Sleep, 10000        ; 10-second pause
            SetTimer, MouseClickHandler, 100
        }
        ; Stop sequence after 20 clicks
        Else If (mouseClickCounter >= 20) {
            SetTimer, MouseClickHandler, Off
            isMouseSequenceRunning := false
        }
    }
    Return

; ======== Control Hotkeys ========
Pause::isAutoPressingEnabled := !isAutoPressingEnabled  ; Toggle auto-pressing
^Esc::ExitApp                      ; Emergency exit shortcut
