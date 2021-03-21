.data
lastFlags dq 0  ; 64-bit copy of flags register

.code
RestoreFlags proc
	push qword ptr [lastFlags]
	popfq
	ret
RestoreFlags endp

SaveFlags proc
	pushfq
	pop qword ptr [lastFlags]
	ret
SaveFlags endp

; int ShiftTest(unsigned long long *rcx)
; pass by reference in Assembly just means hey pass a pointer...
ShiftTest proc
	mov rdx, qword ptr [rcx]  ; p parameter
	
	call RestoreFlags  ; load the last flags

	;shl rdx, 1    ; shift all bits left by 1 position.
	;shr rdx, 1    ; shift all bits right by 1 position.
	;shr rdx, 64   ; immediate values operating on 64-bit regs are AND-ed by 63
	;shr edx, 32   ; immediate values operating on 32-bit regs are AND-ed by 31
	;shr dx, 16    ; but imm.vals. operating on 16-bit regs are not AND-ed by 15, but by 31.
	;shl edx, 1    ; Shifting by 1 left or right sets OF-Overflow Flag ! So you can check if sign changed.
	;shr edx, cl   ; You can shift by variable amount only if you use cl !!!

	;shr - logical shift right
	;sar - arithmetic shift right, it extends the most significant bit when shifting
	; Shifting left by one is same as multiplying by 2(sal and shr are the same)
	; And shifting right by one is same as dividing by 2, except for sar, 
	; which rounds towards -Inf, not towards 0 like division in C/C++.
	
	;Shifting by 0 is nop !


	; rotate left and right, pretty much same rules as for shifts.
	;rol rdx, 1
	;ror rdx, 1

	; rotate through the carry flag, basically it's like having a 65-bit number
	; it will move a bit through the carry flag before it adds it to the back/front.
	;rcl rdx, 1
	;rcr rdx, 1

	; set up to return the result in *rcx, and the carry flag in eax
	mov qword ptr [rcx], rdx

	mov eax, 0      ; assume there's no carry
	mov ecx, 1      ; move 1 into ecx
	cmovc eax, ecx  ; if the carry flag is set, move this 1 into EAX

	call SaveFlags  ; save flags

	ret
ShiftTest endp

; void ShiftDoubleTest(unsigned long long *rcx, unsigned long long *rdx)
ShiftDoubleTest proc
	push rbx  ; save rbx

	mov rax, qword ptr [rcx]  ; move param 1 into rax
	mov rbx, qword ptr [rdx]  ; move param 2 into rbx

	; So this is take N bits from rbx and put it at the start/end(left/right) of rax
	;shrd rax, rbx, 1  ; logical shift right double
	shld rax, rbx, 1   ; logical shift left double

	; place result in *rcx
	mov qword ptr [rcx], rax

	pop rbx  ; restore caller's RBX
	ret
ShiftDoubleTest endp
end