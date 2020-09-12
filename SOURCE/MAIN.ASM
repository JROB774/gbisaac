INCLUDE "HARDWARE.INC"

SECTION "Header", ROM0[$0100]
EntryPoint:  ; this is where execution begins
    di       ; disable interrupts. that way we can avoid dealing with them
    jp Start ; leave this tiny space!

REPT $0150 - $0104
    db 0
ENDR

SECTION "GameCode", ROM0
Start:
    ; turn off the LCD
.waitVBlank
    ld a, [rLY]
    cp 144            ; check if the LCD is past VBlank
    jr c, .waitVBlank
    xor a             ; we only need to reset a value with bit 7 reset, but 0 does the job
    ld [rLCDC], a     ; we will have to write to LCDC again later, so it's not a bother, really

    ; LCD is off so we can now access VRAM!

    ld hl, $9000
    ld de, FontTiles
    ld bc, FontTilesEnd - FontTiles
.copyFont
    ld a, [de]  ; grab 1 byte form the source
    ld [hli], a ; place it at the destination, incrementing hl
    inc de      ; move to the next byte
    dec bc      ; decrement count
    ld a, b     ; check if count is 0 since 'dec bc' doesn't update flags
    or c
    jr nz, .copyFont

    ld hl, $9800 ; this will print the string at the top-left corner of the screen
    ld de, HelloWorldStr
.copyString
    ld a, [de]
    ld [hli], a
    inc de
    and a              ; check if the byte we copied is zero
    jr nz, .copyString ; continue if it's not

    ; init display registers

    ; set the palette
    ld a, %11100100
    ld [rBGP], a

    ; set the scroll
    xor a; ld a, 0
    ld [rSCY], a
    ld [rSCX], a

    ; shut sound down
    ld [rNR52], a

    ; turn screen on, display background
    ld a, %10000001
    ld [rLCDC], a

    ; lock up
.lockup
    jr .lockup

SECTION "Font", ROM0
FontTiles:
INCBIN "FONT.CHR"
FontTilesEnd:

SECTION "HelloWorldString", ROM0
HelloWorldStr:
    db "Hello World!", 0
