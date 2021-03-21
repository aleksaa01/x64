.data
bity db 7
myByte db 56

.code
MovAndLea proc
	mov rax, 89  ; move immediate value to register
	; if you are moving value from one register to another they have to be of the same size
	; so "mov cx, ax" would be valid, while "mov cx, eax" wouldn't be valid.
	mov cx, ax

	; you can move from a register to memory, and from memory to a register.
	; but you can't move from memory to memory.
	mov bity, cl
	mov al, bity

	; you can also move immediate value into memory
	mov bity, 20

	; nop means no-operation and is used for padding.
	; if you want multi byte nop you can use "mov rax, rax"(3 byte nop)
	; and "mov al, al"(2 byte nop)

	; this lea instruction will store an address of "myByte" into rax.
	; doing the same thing with mov would dereference the "myByte" address, 
	; take the value from it and store it in rax.
	lea rax, myByte

	; now that we have a memory address in rax, we can say something like this,
	; which means move immediate value of 7 into whatever rax is pointing to.
	mov byte ptr [rax], 7

	ret
MovAndLea endp
end