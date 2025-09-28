; الوظيفة الأولى - الضغط على زر 9 كل 4 دقائق + ضغطات الماوس
#Persistent
SetTimer, PressKeys, 240000 ; 240000 ميلي ثانية = 4 دقائق

PressKeys:
    Send, 9  ; الضغط على زر 9
    Sleep, 100
    
    ; 10 ضغطات متتالية بالماوس الأيسر
    Loop, 10 {
        Click  ; ضغط ماوس أيسر
        Sleep, 50  ; فاصل بين الضغطات
    }
    
    Sleep, 5000  ; انتظر 5 ثواني
    
    ; 10 ضغطات متتالية بالماوس الأيسر مرة أخرى
    Loop, 10 {
        Click  ; ضغط ماوس أيسر
        Sleep, 50  ; فاصل بين الضغطات
    }
Return

; الوظيفة الثانية - الضغط على المسطرة بفترات عشوائية
#Persistent
SetTimer, PressSpace, % RandomTimer()

PressSpace:
    Send, {Space}  ; الضغط على المسطرة (Space)
    SetTimer, PressSpace, % RandomTimer()  ; تحديد وقت جديد عشوائي
Return

RandomTimer() {
    ; مصفوفة تحتوي على الفترات الزمنية المطلوبة (بالثواني)
    intervals := [5000, 10000, 20000, 60000, 30000]
    
    ; اختيار عشوائي من المصفوفة
    Random, randomIndex, 1, intervals.Length()
    
    ; تحويل الثواني إلى ميلي ثانية وإرجاع القيمة
    return intervals[randomIndex]
}

; مفتاح لإيقاف/تشغيل الماكرو (اختياري)
Pause::Suspend