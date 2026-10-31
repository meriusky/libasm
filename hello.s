section .data
    msg db "Hello, I'm trying my best for this to work!", 10       ; the string, 10 = newline
    len equ $ - msg                ; length = current address - start of msg

section .text
    global _start

_start:
    mov rax, 2                     ; syscall number 1 = write
    mov rdi, 1                     ; 1st argument: fd = 1 (stdout)
    lea rsi, [rel msg]             ; 2nd argument: address of the string
    mov rdx, len                   ; 3rd argument: number of bytes
    syscall                        ; ask the kernel to do it
i
    mov rax, 60                    ; syscall number 60 = exit
    xor rdi, rdi                   ; exit code 0 (xor of a register with itself = 0)
    syscall

;some explenations: the 10 before msg, places bytes in the memory one after another
;db means "difene bytes", the string is stored as one byte per char

;Why it still worked when I changed the message? Bc of-> len equ $ - msg
; $ = the current address, which is the number of bytes. The assembler calculates it for you

;What are rax, rdi, rsi, rdx and syscall?

;Registers are tiny storage boxes inside the CPU, 64 bits each. They’re far faster than RAM, and assembly has no variables, so you work with them directly. The names are historical, but each has a conventional job:

;Register	Used for
;rax		Return value of functions, and the syscall number
;rdi		1st argument
;rsi		2nd argument
;rdx		3rd argument
;rcx		4th argument
;r8, r9		5th and 6th arguments

;syscall is a CPU instruction that means “kernel, please do something for me”. Your program can’t write to the screen or open files by itself, only the kernel can.
