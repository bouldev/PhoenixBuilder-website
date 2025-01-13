# Hello World
[Back](index.html)

To understand the format of `gcc`'s assembly code, we shall first see how `gcc`
itself generates that.  
We first write a Hello World program in C:
```
// hello_world.c
#include <stdio.h>

int main() {
	printf("Hello World!\n");
	return 0;
}
```
to generate the assembly code, run `gcc -S hello_world.c`. `gcc` then generates
an assembly code file `hello_world.s`, with content that looks like this:
> If instead of something like `%rax`, you see `x0`, your device runs on ARM64
architecture and you may need a different device or a VM to follow through this
tutorial.
```
// hello_world.s
	.file	"hello_world.c"
	.text
	.section	.rodata
.LC0:
	.string	"Hello World!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp	// Push the stack frame pointer
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	// Save the current stack pointer
				// As no stack space is allocated here,
				// no subtraction has been done on %rsp.
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rax	// Load string at .LC0 to %rax
	movq	%rax, %rdi	// Move %rax to %rdi (register for the first argument)
	call	puts@PLT	// Call `puts`, refer to `man puts` for info
	movl	$0, %eax	// Clear %eax (return value)
	popq	%rbp		// Recover saved stack pointer
	.cfi_def_cfa 7, 8
	ret			// Return
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-8) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
```
Here, `.section .rodata` marks data section, while `.text` marks executable
code. Anything follows with `:` is referable, which means their address can be
loaded to register, and it is possible to jump to such address. As the string
`"Hello World!"` is the only argument to `printf` and a new line is created,
`gcc` optimized the code to use `puts` instead.

With the format above memorized, we can now write our own Hello World program
in x86_64 assembly:
```
// hello.S
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
```
and compile it with `gcc hello.S -o hello`. Note that `printf` has more complicated
calling format, and the goal cannot be reached with simply loading `%rdi` register.

We can even move further and complete it with `syscall`, invoking kernel function
`sys_write`. Refer to [this](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
article for the registers to use.
```
// hello_sys.S

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
```

Can we go further and make our code run without glibc? Of course! Compile the
code below with `gcc -nostdlib hello_sys_st.S -o hello_sys_st`.
```
// hello_sys_st.S

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
```
However, as you probably have noticed above, `strlen` is a glibc function,
without glibc, you need to either hardcode the string length, or implement
your own `strlen`. Calling `sys_exit` is also necessary as there is no code
taking over control after `_start` returns, which would cause a Segmentation fault,
if not handled.