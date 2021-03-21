.data
myFloat real4 69.42

.code
; This is C Calling Convention for Microsoft operating systems.
; Linux does this differently, mostly when it comes to combining different types of parameters.

passingIntegersAndPointers proc
	; First parameter is in   rcx
	; Second parameter is in  rdx
	; Third parameter is in   r8
	; Fourth parameter is in  r9
	; Rest of the parameters are allocated on the stack.

	; Return value of type integer/pointer/obj/array has to be stored in  rax
	mov rax, 42
	ret
passingIntegersAndPointers endp

passingFloats proc
	; First parameter is in   xmm0
	; Second parameter is in  xmm1
	; Third parameter is in   xmm2
	; Fourth parameter is in  xmm3
	; Rest of the parameters are allocated on the stack.

	; Return value of type float/double has to be stored in  xmm0
	movss xmm0, real4 ptr [myFloat]
	ret
passingFloats endp

passingDifferentTypes proc
	; If first parameter is integer it will be in  rcx
	; If second parameter is float it will be in   xmm1
	; If third parameter is integer it will be in  r8
	; If fourth parameter is float it will be in   xmm3
	ret
passingDifferentTypes endp
end