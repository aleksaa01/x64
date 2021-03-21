.data
myQWordVar sqword 0  ; This defines a signed quad word.

.code
AddSub proc
	mov rax, 5
	mov rcx, 12
	
	; this just adds rcx + rax into rax.
	add rax, rcx

	xor rcx, rcx
	; add instruction doesn't support 64-bit immediate values.
	; and it also sign-extends 32-bit values when you try to add them 
	; to 64-bit registers.
	add rcx, 2147483648  ; so this will result in a really big unsigned value or -2147483648
	mov myQWordVar, rcx  ; we are moving rcx into myQWordVar so we can see it in signed format.

	xor rcx, rcx
	; so if you want to add an immediate 64-bit value you need to use mov and add.
	mov rdx, 2147483648
	add rcx, rdx

	; sub is pretty much the same as add, it also sign-extends 32-bit immediate values
	; and doesn't allow you to use 64-bit immediate values.
	
	ret
AddSub endp

IncDec proc
	mov rax, 7
	; inc increments by one, but it doesn't change the carry flag.
	inc rax
	; so in this case where al=255 it will overflow it to al=255+1=0
	mov al, 255
	inc al

	; to change the carry flag you will have to use add
	mov al, 255
	add al, 1

	mov al, 0
	; dec will decrement by one, but same as inc, it won't affect the carry flag.
	; use sub if you need the carry flag.
	dec al

	ret
IncDec endp

end