.data
.code
; div  - this is for unsigned division
; idiv - this is for signed division
DivAndIDiv proc
	push rbx


	; example of using div
	mov ax, 50
	mov bl, 3
	; This will divide BL from AX.
	; It will store the result in AL, and remainder in AH.
	div bl  ; ax is the implied operator

	; For 16 bits and above, implied operator is compound register DX:AX, EDX:EAX, RDX:RAX
	; this just allows you to devide larger numbers.
	; Be careful to clear DX if you have smaller values than (2^16-1)
	mov ax, 50
	xor dx, dx
	mov cx, 3
	; result will be stored in AX, and remainder will be stored in DX
	div cx

	; Example with 32-bit operands
	mov eax, 7871
	xor edx, edx
	mov ecx, 78
	; Result stored in EAX, remainder stored in EDX
	div ecx     ; Implied operator is compound register EDX:EAX


	; Example with 64-bit operands
	mov rax, 79871
	mov rdx, 4
	mov rbx, 1238
	; result stored in RAX, remainder stored in RDX
	div rbx      ; Implied operator = compound register RDX:RAX

	pop rbx
	ret
DivAndIDiv endp

; Parameters: x in rcx, y in rdx
GCD_Asm proc
	mov rax, 0  ; Error value
	cmp rcx, 0
	je Finished
	cmp rdx, 0
	je Finished

	push rbx
	mov rbx, rdx  ; Move y into rbx, so we can use rdx with div instruction

LoopHead:
	xor rdx, rdx  ; Zero out rdx
	mov rax, rcx  ; Move x into rax
	div rbx       ; rax=result, rdx=remainder
	mov rcx, rbx  ; copy x to y
	mov rbx, rdx  ; copy remainder to rbx
	cmp rdx, 0
	jne LoopHead

	mov rax, rcx

	pop rbx
Finished:
	ret
GCD_Asm endp

end