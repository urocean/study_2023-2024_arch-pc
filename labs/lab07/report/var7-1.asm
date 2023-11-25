%include 'in_out.asm'
section .data

msg2 db "Наименьшее число: ",0h
A dd '45'
B dd '67'
C dd '15'

section .bss
min resb 10

section .text
global _start
_start:

; ---------- Записываем 'A' в переменную 'min'
mov ecx,[A] ; 'ecx = A'
mov [min],ecx ; 'min = A'

mov eax,min
call atoi ; Вызов подпрограммы перевода символа в число
mov [min],eax


check_A:
; ---------- Сравниваем 'A' и 'С' 
cmp ecx,[C] ; Сравниваем 'A' и 'С'
jl check_B ; если 'A<C', то переход на метку 'check_B',
mov ecx,[C] ; иначе 'ecx = C'
mov [min],ecx ; 'min = C'

mov eax,min
call atoi ; Вызов подпрограммы перевода символа в число
mov [min],eax
;


check_C:
; ---------- Сравниваем 'C' и 'B' 
cmp ecx,[B] ; Сравниваем 'C' и 'B'
jl fin; если 'C < B', то переход на метку 'fin',
mov ecx,[B] ; иначе 'ecx = B'
mov [min],ecx ; 'min = B'

mov eax,min
call atoi ; Вызов подпрограммы перевода символа в число
mov [min],eax
;


check_B:
; ---------- Сравниваем 'A' и 'B' 
cmp ecx,[B] ; Сравниваем 'A' и 'С'
jl fin; если 'A<B', то переход на метку 'fin',
mov ecx,[B] ; иначе 'ecx = B'
mov [min],ecx ; 'min = B'

mov eax,min
call atoi ; Вызов подпрограммы перевода символа в число
mov [min],eax
;


; ---------- Вывод результата
fin:
mov eax, msg2
call sprint ; Вывод сообщения 'Наименьшее число: '
mov eax,[min]
call iprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход
