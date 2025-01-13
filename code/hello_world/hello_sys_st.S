
.section .rodata
.mystr:
	.string "Hello World!\n"
.text
.globl _start
_start:
	mov $13, %rdx
	lea .mystr(%rip), %rsi
	mov $0, %rdi // fd=0: stdout
	mov $1, %rax // sys_write
	syscall
	mov $0, %rdi
	mov $60, %rax // sys_exit
	syscall

.section .note.GNU-stack,"",@progbits
