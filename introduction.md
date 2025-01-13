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
- rcx
- rdx
- rbx
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
The chart below, copied from the System V ABI documentation, gives
a thorough view of the calling conventions in using registers.

## References
- [1] "AMD Discloses New Technologies At Microporcessor Forum," AMD, Sunnyvale,
	CA, USA. Accessed: Jan. 12, 2025. [Online]. Available:
	https://web.archive.org/web/20120308030806/http://www.amd.com/us/press-releases/Pages/Press_Release_751.aspx
- [2] H.J. Lu et al., *System V Application Binary Interface*, (2024). Accessed:
	Jan. 13, 2025. [Online]. Available: 
	https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/artifacts/master/raw/x86-64-ABI/abi.pdf?job=build