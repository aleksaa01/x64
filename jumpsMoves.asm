.data
.code
ConditionalJumps proc
	push rbx

	; Simple conditional jump example
	mov eax, -9
	add eax, -12
	jo Overflowed       ; Jump if Overflow Flag was set.
	jno DidntOverflow   ; Jump if Onverflow Flag was NOT set.
Overflowed:
	mov rax, 12
DidntOverflow:
	mov rax, 15


	; Usual setup for a loop.
	mov rcx, 10
LoopHead:
	dec rcx
	jnz LoopHead  ; Jump if not zero.


	; Example for the set instruction
	mov eax, 10
	mov ecx, 5
	cmp eax, ecx
	; set instruction sets an 8-bit register to 1 if some condition holds, 0 otherwise.
	sete al  ; Set al to 1 if values that were compared were equal, 0 otherwise
	mov eax, 5
	cmp eax, ecx
	sete al  ; Now it will be set to 1


	; These jumps are used for unsigned values
	mov rax, 100
	mov rbx, 90
	cmp rax, rbx
	jb WasBelow  ; In this case both mov instructions will execute.
	ja WasAbove
WasBelow:
	mov rax, rbx
WasAbove:
	mov rbx, rax


	ret
ConditionalJumps endp

ConditionalMoves proc
	push rbx

	; Simple example of conditional moves.
	mov ebx, 67
	mov eax, -1
	add eax, 1
	; Conditional Move - if Carry Flag was set, move ebx into eax
	; Remember that for instructoins mov and cmov, if you use 32-bit operands, 
	; top 32 bits of their 64 bit operands will be cleared.
	cmovc eax, ebx

	mov rax, -1
	add rax, 1
	; Clear the Carry Flag
	clc
	cmovc rax, rbx

	; Signed conditional moves
	mov rbx, 100
	mov rax, 50
	mov rcx, 90
	; You can use sub as well as cmp
	sub rax, rcx
	; Move rbx into rax if Signed Flag was set.
	cmovs rax, rbx

	pop rbx
	ret
ConditionalMoves endp

end