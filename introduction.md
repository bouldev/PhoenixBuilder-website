# Introduction
[Back](index.html)

x86_64 architecture, also known as AMD64, was originally announced by AMD as a
form of backward-compatible 64-bit instruction set [1]. It is widely
used on desktop computers / laptops nowadays.
This tutorial aims to walk you through the basic concepts of x86_64
assembly and make you confident in reading / writing x86_64 assembly code.

## Registers
There are 16 general registers in x86_64 architecture, all 64-bit long.
For x86 (i386) architecture, there are 8 general registers (eax-edi).
In addition, the 16-bit real mode has ax-di 16-bit registers.
- rax
- rbx
- rcx
- rdx
- rsp
- rbp
- rsi
- rdi
- r8 - r15

In x86_64, specific bit ranges are accessible through lower-bit register names.
For example: when `rax: 0x00000000deadbeef`, accessing `eax` gives you `0xdeadbeef`,
`ax` gives `0xbeef`, and `al` for `0xef`.
## Calling conventions
Back in 32-bit Windows, all arguments were pushed into stack, which is 
unnecessarily performance-consuming, especially when we have many more
registers in x86_64. In x86_64 Linux,
the first 6 arguments are placed into 6 registers respectively:
`rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`; excessive arguments are pushed
into stack [2]. The return value is stored in `rax`.  
The chart below, *copied from the System V ABI documentation*, gives
a thorough view of the calling conventions in using registers.
| Register | Usage | Callee Saved |
| -------- | ----- | ------------ |
| rax | temporary register; with variable arguments passes information about the number of vector registers used; 1<sup>st</sup> return register | No |
| rbx | callee-saved register | Yes |
| rcx | used to pass 4<sup>th</sup> integer argument to functions | No |
| rdx | used to pass 3<sup>rd</sup> argument to functions; 2<sup>nd</sup> return register | No |
| rsp | stack pointer | Yes |
| rbp | callee-saved register; optionally used as frame pointer | Yes |
| rsi | used to pass 2<sup>nd</sup> argument to functions | No |
| rdi | used to pass 1<sup>st</sup> argument to functions | No |
| r8  | used to pass 5<sup>th</sup> argument to functions | No |
| r9  | used to pass 6<sup>th</sup> argument to functions | No |
| r10 | temporary register, used for passing a function’s static chain pointer | No |
| r11 | temporary register | No |
| r12-r14 | callee-saved registers | Yes |
| r15 | callee-saved register; optionally used as GOT base pointer | Yes |
| xmm0-xmm1 | used to pass and return floating point arguments | No |
| xmm2-xmm7 | used to pass floating point arguments | No |
## Toolsets
We use **AT&T Syntax** for writing assembly, which should not be having
so much difference than Intel syntax. In addition, `gcc` is used for compiling
assembly programs in this tutorial.

## References
- [1] "AMD Discloses New Technologies At Microporcessor Forum," AMD, Sunnyvale,
	CA, USA. Accessed: Jan. 12, 2025. [Online]. Available:
	https://web.archive.org/web/20120308030806/http://www.amd.com/us/press-releases/Pages/Press_Release_751.aspx
- [2] H.J. Lu et al., *System V Application Binary Interface*, (2024). Accessed:
	Jan. 13, 2025. [Online]. Available: 
	https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/artifacts/master/raw/x86-64-ABI/abi.pdf?job=build