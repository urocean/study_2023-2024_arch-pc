%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите a: ',0h
msg3 db 'Результат: ',0h
section .bss
x: resb 80
a: resb 80
section .text
global _start
_start:

mov eax,msg1
call sprint

mov ecx,x
mov edx,80
call sread

mov eax,x
call atoi 
mov [x], eax

mov eax, msg2
call sprint

mov ecx,a
mov edx,80
call sread

mov eax,a
call atoi
mov [a], eax

cmp eax,[x]
je _fx
add eax,[x]
jmp _fin

_fx:
mov edx,6
mul edx

_fin:
mov ecx, eax
mov eax, msg3
call sprint ; Вывод сообщения 'Результат: '
mov eax,ecx
call iprintLF 
call quit 
