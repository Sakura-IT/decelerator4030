	include		hardware.i

	xref		__prg_start
	xref		__copy_len
	xref		__bss_start
	xref		__bss_end
	xref		start

	section		"init",code

	dc.w		$1111
	jmp		$F00008			; this MUST be here 
init:						; $F00008
	move.l		#$020000,d0		; delay
delay:	subq.l		#1,d0 
	bgt.s		delay

	move.b		#3,ciaabase+ciaddra
	move.b		#2,ciaabase		; dim LED

	lea		custombase,a4		; load custom chips address
	move.w		#$7FFF,d0
	move.w		d0,intena(a4)		; disable all interrupts
	move.w		d0,intreq(a4)		; clear all pending interrupts
	move.w		d0,dmacon(a4)		; disable all DMA

	; copy code and data to RAM
	lea		__prg_start(pc),a0
	lea		start,a1
	move.l		#__copy_len,d0
.1:	move.w		(a0)+,(a1)+
	subq.l		#2,d0
	bne		.1

	; clear bss
	lea		__bss_start,a0
	move.l		#__bss_len,d0
.2:	clr.w		(a0)+
	subq.l		#2,d0

	jmp		start			; jump with execution to RAM

; vim: set ft=asm68k:
