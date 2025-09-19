    .section .note.GNU-stack,""
    .global calculate
    .text

calculate:
    push %rbx 

    # rbx = x
    mov %rdi, rbx 

    # a = x + 3
    mov %rbx, %rsi
    # rsi = a
    add $3, %rsi

    # b = f(x,a)
    mov %rbx, rdi
    call f
    # r8 = b
    mov %rax, %r8

    #c = f(b, x) (for f: b=x(rdi), x=y)
    mov %r8, rdi
    mov %rbx, %rsi
    call f
    # r9 = c
    mov %rax, %r9

    # d = f(x,c)
    mov %rdx, %rdi
    mov %r9, %rsi
    call f 
    # r10 = d
    mov %rax, %r10

    # answer = a+b+c+d 
    mov %rsi, rax
    add %r8, rax
    add %r9, rax
    add %r10, rax

    pop %rbx
    ret


