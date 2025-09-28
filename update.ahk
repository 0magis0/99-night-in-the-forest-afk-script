; AutoHotkey Script for Automated Key Presses and Mouse Clicks
; This script performs two main functions with configurable timing

; =============================================
; FUNCTION 1: Periodic 9 Key Press with Mouse Clicks
; =============================================
#Persistent
SetTimer, SendKeyAndClicks, 240000 ; Execute every 4 minutes (240,000 ms)

SendKeyAndClicks:
    ; Send the '9' key press
    Send, 9
    Sleep, 100 ; Short delay after key press
    
    ; Execute 10 consecutive left mouse clicks
    Loop, 10 {
        Click
        Sleep, 50 ; Inter-click interval
    }
    
    Sleep, 5000 ; 5-second pause between click sequences
    
    ; Execute another 10 consecutive left mouse clicks
    Loop, 10 {
        Click
        Sleep, 50 ; Inter-click interval
    }
Return

; =============================================
; FUNCTION 2: Randomized Spacebar Press
; =============================================
#Persistent
SetTimer, SendSpacebar, % GenerateRandomInterval()

SendSpacebar:
    Send, {Space}
    ; Reset timer with new random interval
    SetTimer, SendSpacebar, % GenerateRandomInterval()
Return

; =============================================
; FUNCTION: Generate Random Interval
; Returns a random time interval from predefined options
; =============================================
GenerateRandomInterval() {
    ; Available intervals in seconds
    IntervalOptions := [5000, 10000, 20000, 60000, 30000]
    
    ; Randomly select an interval index
    Random, SelectedIndex, 1, IntervalOptions.Length()
    
    ; Convert seconds to milliseconds and return
    return IntervalOptions[SelectedIndex]
}

; =============================================
; HOTKEY: Script Suspension Toggle
; Pause/Break key toggles script execution
; =============================================
Pause::Suspend
