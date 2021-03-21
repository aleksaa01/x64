.data
; declare Point structure
Point struct
	x dd ?
	y dd ?
Point ends

myPoint Point {0, 0}  ; define myPoint of type Point, initialized to: (x=0, y=0)


defaultArguments struct
	x dd 100
	y dd 100
defaultArguments ends

Arg1 defaultArguments {}      ; Arg1.x = 100, Arg1.y = 100
Arg2 defaultArguments {, 50}  ; Arg2.x = 100, Arg2.y = 50
Arg3 defaultArguments {0, 0}  ; Arg3.x = 0, Arg3.y = 0


myUnion union
	small db ?
	medium dw ?
	large dd ?
	huge dq ?
myUnion ends  ; unions end with "ends", same as structures

pp myUnion { 0ffffffffh }  ; First member(small) will be set to low 8 bits !!!


.code
Structs proc
	; if you are using structure declared in C++, then you have to worry about alignment !
	mov myPoint.y, 100  ; move 100 into the y member of myPoint
	; if you have pointer to structure myPoint in rcx, then you would do
	; This means rcx + 4, if you typed "[rcx].Point.x" then that would be rcx + 0.
	mov [rcx].Point.y, 100  ; treat whatever rcx is pointing to as Point structure.
	ret
Structs endp

Unions proc
	mov pp.large, 3400537897
	ret
Unions endp
end