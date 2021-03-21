.data
; db is a shorthand for byte, where prefix 'd' means 'define'.
; others are dw, dd, dq, which represent word, double word and quad word respectively.
myByte db 78
myWord dw ?  ; if you don't care about initializing the value, you can put '?'.

myFloat real4 89.5

.code
dataSegment proc
	mov ax, myWord
	mov cl, myByte

	mov al, byte ptr [myByte]  ; Move the value of this byte pointer to al

	; Assembly doesn't care about data types, so you can easily move 32-bit float 
	; into a 32-bit integer register.
	mov eax, real4 ptr [myFloat]
	
	ret
dataSegment endp
end