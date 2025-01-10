ENTRY(start)

SECTIONS {
    . = 0x1000000;

    /* Program code */
    .text :{
        KEEP(*(.text.start));
        *(.text .text.*);
    }

    /* Read-only data */
    .rodata : ALIGN(4) {
        *(.rodata .rodata.*);
    }

    /* Program data */
    .data : ALIGN(4) {
        *(.data .data.*);
    }

    /* data that should be zero-filled at startup -- read/write data stuff */
    .bss : ALIGN(4) {
        *(.bss .bss.* .sbss .sbss.*);

        . = ALIGN(4);
        . += 64 * 1024; /* 64KB */
        __stack_top = .;

        ASSERT(. < 0x1800000, "too large executable");
    }
}
