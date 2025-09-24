#Persistent

; مؤقت للضغط العشوائي على المسطرة
SetTimer, PressKey, 1000

; مؤقت للضغط على زر 7 كل 5 دقائق ثم النقر بالماوس
SetTimer, PressSevenAndMouse, 240000 ; 300000 مللي ثانية = 5 دقائق

; مؤقت جديد للوظيفة الإضافية
SetTimer, NewFunction, 600000 ; سيتم تنفيذ الوظيفة الجديدة كل دقيقة (يمكنك تغيير الوقت حسب الحاجة)

return

; دالة الضغط العشوائي على المسطرة
PressKey:
    Random, randomTime, 1, 5
    
    if (randomTime = 1)
        sleepTime := 5000 ; 5 ثوان
    else if (randomTime = 2)
        sleepTime := 10000 ; 10 ثوان
    else if (randomTime = 3)
        sleepTime := 20000 ; 20 ثانية
    else if (randomTime = 4)
        sleepTime := 60000 ; 60 ثانية (دقيقة واحدة)
    else if (randomTime = 5)
        sleepTime := 30000 ; 30 ثانية
    
    Sleep, %sleepTime%
    Send, {Space} ; ضغط على مفتاح المسافة
    
    ; إعادة ضبط المؤقت
    SetTimer, PressKey, -1000
return

; دالة الضغط على زر 7 ثم النقر بالماوس
PressSevenAndMouse:
    Send, {7} ; الضغط على زر رقم 7
    Sleep, 500 ; انتظار نصف ثانية
    Click ; نقر بالزر الأيسر للماوس
return

; الوظيفة الجديدة
NewFunction:
    Send, {7} ; الضغط على زر 7
    Sleep, 500 ; انتظار نصف ثانية
    Click ; النقر بالزر الأيسر للماوس
    Sleep, 2000 ; انتظار ثانيتين
    Send, {7} ; الضغط على زر 7 مرة أخرى
    Sleep, 500 ; انتظار نصف ثانية
    Click ; النقر بالزر الأيسر للماوس مرة أخرى
return

; مفتاح لإيقاف التشغيل (F12)
F12::ExitApp