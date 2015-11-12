MEMORY {
	ram: org=0x400, len=0x3fc00
	romf0: org=0xf00000, len=0x80000
}

SECTIONS {
	.init: {
		*(init)
		__prg_start = ALIGN(2);
	} > romf0

	.text: {
		*(CODE)
	} > ram AT> romf0

	.data: {
		. = ALIGN(2);
		*(DATA)
		. = ALIGN(2);
	} > ram AT> romf0

	.bss (NOLOAD): {
		__bss_start = .;
		*(BSS)
		__bss_end = ALIGN(2);
	} > ram

	__copy_len = ADDR(.bss) - ADDR(.text);
	__bss_len = __bss_end - __bss_start;
}

