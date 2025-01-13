
.section .rodata
.mystr:
	.string "Hello World!\n"
.text
.globl main
main:
	lea .mystr(%rip), %rdi
	call strlen@PLT
	mov %rax, %rdx
	lea .mystr(%rip), %rsi
	mov $0, %rdi // fd=0: stdout
	mov $1, %rax // sys_write
	syscall
	mov $0, %eax
	ret

.section .note.GNU-stack,"",@progbits
