section .text
    global ft_strlen

ft_strlen:
    xor rax, rax                ; i = 0
.loop:
    cmp byte [rdi + rax], 0     ; is s[i] == '\0' ?
    jmp.done                   ; if yes, jump out (which "jump if..." instruction?)
    inc rax                     ; i++
    jmp ___                     ; go back to the start of the loop
.done:
    ret                         ; rax already holds the answer
