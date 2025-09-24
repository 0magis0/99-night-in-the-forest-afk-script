#Persistent

; Timer for random spacebar presses
SetTimer, RandomSpacePress, 1000

; Timer for pressing 7 key and mouse click every 4 minutes
SetTimer, PressSevenWithClick, 240000

; Timer for additional functionality every 10 minutes
SetTimer, AdditionalSequence, 600000

return

; Function for random interval spacebar pressing
RandomSpacePress:
    Random, randomInterval, 1, 5
    
    if (randomInterval = 1)
        waitTime := 5000
    else if (randomInterval = 2)
        waitTime := 10000
    else if (randomInterval = 3)
        waitTime := 20000
    else if (randomInterval = 4)
        waitTime := 60000
    else if (randomInterval = 5)
        waitTime := 30000
    
    Sleep, %waitTime%
    Send, {Space}
    
    ; Reset timer
    SetTimer, RandomSpacePress, -1000
return

; Function for 7 key press followed by mouse click
PressSevenWithClick:
    Send, {7}
    Sleep, 500
    Click
return

; Additional sequence function
AdditionalSequence:
    Send, {7}
    Sleep, 500
    Click
    Sleep, 2000
    Send, {7}
    Sleep, 500
    Click
return

; Exit script with F12 key
F12::ExitApp
