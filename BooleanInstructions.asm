.code
booleanInstruction proc
	mov eax, 10010101001b  ; this is how you declare binary constant in MASM
	mov ecx, 10010100100b
	; regular bitwise-and(&)
	and eax, ecx

	mov eax, 10010101001b
	mov ecx, 10010100100b
	; regular bitwise-or(|)
	or eax, ecx

	mov eax, 10010101001b
	; regular bitwise-not(~), it will flip all the bits.
	not eax

	mov eax, 10010101001b
	mov ecx, 10010100100b
	; regular bitwise-xor(^), 0-1 and 1-0 produce 1, 0-0 and 1-1 produce 0.
	; also operation "xor reg, reg" will zero that register.
	xor eax, ecx

	mov eax, 10010101001b
	mov ecx, 10010100100b
	; XNOR 0-0 and 1-1 produce 1, 1-0 and 0-1 produce 0.
	xor eax, ecx
	not eax

	; NOR would require or + not
	; NAND would require and + not

	ret
booleanInstruction endp
end