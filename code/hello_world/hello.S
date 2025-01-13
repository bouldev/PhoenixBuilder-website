
.section .rodata
.mystr:
	.string "Hello World!"
.text
.globl main
main:
	leaq .mystr(%rip), %rdi
	call puts@PLT
	movl $0, %eax
	ret

.section .note.GNU-stack,"",@progbits
