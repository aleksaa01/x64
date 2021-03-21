.code
machineCode proc
	; dummy instructions(could be anything else), to showcase usage of inline machine code.
	mov eax, eax

	; straight up machine code, use disassembly window to figure out what it does.
	;db 45, 78, 19, 23

	; dummy instructions(could be anything else), to showcase using machine code.
	mov eax, eax
	ret
machineCode endp
end