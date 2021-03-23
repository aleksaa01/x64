.data
myIntegers1 dd 0, 1, 2, 3
myIntegers2 dd 10, 10, 10, 10

myFloats1 real4 1.0, 1.1, 1.2, 1.3
myFloats2 real4 2.0, 3.0, 4.0, 5.0

.code
TestSIMD proc
	; Move unaligned double-quardwords
	movdqu xmm0, xmmword ptr [myIntegers1]
	movdqu xmm1, xmmword ptr [myIntegers2]

	; Packed addition of DWords
	paddd xmm0, xmm1
	; Packed subtraction of DWords
	psubd xmm0, xmm1

	; Move aligned packed signle-precision floating point values(or just say singles)
	movaps xmm0, xmmword ptr [myFloats1]
	movaps xmm1, xmmword ptr [myFloats2]

	; Add packed singles
	addps xmm0, xmm1
	; Subtract packed singles
	subps xmm0, xmm1
	; Multiply packed singles
	mulps xmm0, xmm1
	; Divide packed singles
	divps xmm0, xmm1

	ret
TestSIMD endp
end