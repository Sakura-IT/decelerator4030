	include hardware.i

	global start

	code

start:
	lea		$40000,sp		; set stack pointer 

	move.l		testdata,testbss	; just a test...

	move.w		#$0200,bplcon0(a4)	; blank screen
	move.w		#0,bpldat(a4)		; zero bitplane data
	move.w		#$0340,color(a4)	; shitty green

	move.b		ciaabase+ciasdr,d3	; read key scan code

	cmpi.b		#$b9,d3
	beq		fpressed
fnotpressed:
	jmp		menu	

fpressed:
	move.w		#$0340,color(a4)	; shitty green
.1:	jmp		.1

	data

testdata:
	dc.l		$12345678	

	bss

testbss:
	ds.l		1

; vim: set ft=asm68k:
