.code
FlagsFunction proc
	; CF - Carry Flag (set to 1 whenever there is an overflow).
	; In visual studio CF is called CY.
	;mov rax, -1
	;add rax, 1  ; after this instruction CF will be set.

	; PF - Parity Flag (not really used these days, it's for backwards-compatibility)
	; PE is set to 1 if number of 1's in the low 8 bits is even.
	;mov eax, 3  ; PE will be set to 1, because 3 = 0b11
	;and eax, eax
	;mov eax, 7  ; PE will be set to 0, because 7 = 0b111
	;and eax, eax

	; AF - Auxiliary Carry (not really used these days, it's for backwards-compatibility)
	; In visual studio AF is called AC
	; Set if there is an overflow in the lowest nibble(4bits) of your result.
	;mov eax, 15
	;add eax, 1  ; 1111 + 1 = 10000 (overflow of the first 4 bits)

	; ZF - Zero Flag = Set to 1 if result was 0
	; ZR in visual studio
	; some instructions don't set this flag, like mov.
	;xor eax, eax  ; Will set zero flag to 1
	;add eax, 5    ; Will set zero flag to 0
	; for example cmp instruction only sets the flags
	;cmp eax, ecx  ; ZF will be set if eax-ecx=0

	; SF - Sign Flag = Set to 1 if result of instruction was negative.
	; PL in visual studio
	;mov eax, 7
	;mov ecx, 12
	;sub eax, ecx  ; This will set SF to 1, because 7-12=-5 (negative result)

	; DF - Direction Flag = used with string instruction
	; UP in visual studio
	; DF=0(Reading string forwards), DF=1(Reading string backwards)
	;std  ;set direction flag
	;cld  ;clear direction flag

	; OF - Overflow Flag = signed overflow
	; OV in visual studio
	; it's set if sign changed AND the original signs were the same
	; for example adding two negative values, or two positive values
	;mov al, 255
	;shr al, 1  ; value turns from positive to positive, OF is set to 1
	;add al, 1  ; value turns from positive to negative, OF is set to 1

	; This is how you can read all bits of the flags register.
	;pushfq   ; will push the entire 64-bit flags register onto the stack
	;pop rax  ; pop flags into register rax
	; then you can change the flags, push them onto stack and the use popfq 
	; to pop them back into flags register.
	;push rax
	;popfq
	
	ret 
FlagsFunction endp
end