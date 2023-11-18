%include 'in_out.asm' 

SECTION .data
msg: DB 'Введите значение переменной х: ',0
rem: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

; ---- Вычисление выражения 5(x − 1)^2 

mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x
dec eax ; EAX = EAX - 1
mul eax ; EAX = EAX * EAX
mov ebx,5 ; EBX=5
mul ebx ; EAX=EAX*EBX
mov edi, eax ; запись результата вычисления в edi

; ---- Вывод результата на экран

mov eax,rem
call sprint 
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; 
call quit ; вызов подпрограммы завершения

