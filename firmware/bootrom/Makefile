CROSS_AS=vasmm68k_mot
CROSS_LD=vlink
CROSS_CC=vc
CROSS_ASFLAGS=-Fvobj -m68020up
CROSS_LDSCRIPT=bootrom.ld
CROSS_LDFLAGS=-brawbin1 -T $(CROSS_LDSCRIPT)

LOADER_OBJS=startup.o
LOADER_INCS=hardware.i
LOADER_IMAGE=bootrom.img

all: $(LOADER_IMAGE)

$(LOADER_IMAGE) : $(LOADER_OBJS) $(LOADER_INCS)
	$(CROSS_LD) $(CROSS_LDFLAGS) -o $(LOADER_IMAGE) $(LOADER_OBJS)

%.o : %.S
	$(CROSS_AS) $(CROSS_ASFLAGS) -Fvobj -o $@ $<

#%.o : %.c
#	$(CROSS_CC) $(CROSS_CFLAGS) -c $<

clean :
	rm -f $(LOADER_IMAGE) $(LOADER_OBJS)

