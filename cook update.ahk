#Persistent
#SingleInstance Force
#MaxThreadsPerHotkey 2

; === التوقيتات الأساسية ===
TimerInterval := 5000          ; ضغط E كل 5 ثواني
MainCycle := 4 * 60 * 1000     ; الدورة الرئيسية كل 4 دقائق

; === متغيرات التحكم ===
ClickCount := 0
IsMouseSequenceActive := false
_keepFiring := true

; === بدء المؤقتات ===
SetTimer, PressEKey, %TimerInterval%
SetTimer, FourMinuteCycle, %MainCycle%
Return

; ======== ضغط E كل 5 ثواني ========
PressEKey:
    If (_keepFiring) {
        Send, e
    }
    Return

; ======== الدورة كل 4 دقائق ========
FourMinuteCycle:
    Send, e                    ; الضغط على E أولاً
    Sleep, 300                 ; انتظار 300 مللي ثانية
    Send, 9                    ; ثم الضغط على 7
    Sleep, 300                 ; انتظار آخر
    
    ; بدء سلسلة النقرات اليسرى
    ClickCount := 0
    IsMouseSequenceActive := true
    SetTimer, MouseClickSequence, 100
    Return

; ======== تسلسل النقرات ========
MouseClickSequence:
    If (ClickCount < 20) {
        ClickCount++
        Click                   ; نقرة يسارية واحدة
        
        If (ClickCount = 10) {
            SetTimer, MouseClickSequence, Off
            Sleep, 10000        ; انتظار 10 ثواني بعد 10 نقرات
            SetTimer, MouseClickSequence, 100
        }
        Else If (ClickCount >= 20) {
            SetTimer, MouseClickSequence, Off
            IsMouseSequenceActive := false
        }
    }
    Return

; ======== إيقاف/تشغيل السكريبت ========
Pause::_keepFiring := !_keepFiring  ; زر Pause لإيقاف/تشغيل الضغط التلقائي
^Esc::ExitApp                      ; Ctrl+Esc لإغلاق السكريبت