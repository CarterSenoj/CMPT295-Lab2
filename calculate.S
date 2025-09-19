    .section .note.GNU-stack,""
    .global calculate
    .text

calculate:
    push %rbx 
    push %r12
    push %r13
    push %r14

    # rbx = x
    mov %rdi, %rbx 

    # a = x + 3
    mov %rbx, %r12
    # r12 = a
    add $3, %r12

    # b = f(x,a)
    mov %rbx, %rdi
    mov %r12, %rsi
    call f
    # r13 = b
    mov %rax, %r13

    #c = f(b, x)
    mov %r13, %rdi
    mov %rbx, %rsi
    call f
    # r14 = c
    mov %rax, %r14

    # d = f(x,c)
    mov %rbx, %rdi
    mov %r14, %rsi
    call f 
    # %rax = d
    # %rax is not call preserved
    # but f is not called after 
    # this point so its safe to 
    # use temp.

    # answer = a+b+c+d 
    add %r12, %rax
    add %r13, %rax
    add %r14, %rax

    pop %rbx
    pop %r12
    pop %r13
    pop %r14
    ret