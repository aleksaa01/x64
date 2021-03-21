.code
IfStatements proc
	mov rax, 30
	mov rdx, 20
	mov rcx, 0
	mov r8d, 0

	; You can combine multiple cmov-s and and instruction to 
	; implement multiconditional if statement.
	; These instructions translate to this C++ code. And it's branchless code.
	; if (a >= b && b <= 100)
	;     c = b;
	cmp rax, rdx
	cmovge rcx, rdx
	cmp rdx, 100
	cmovle r8, rdx

	and rcx, r8

	ret
IfStatements endp
end