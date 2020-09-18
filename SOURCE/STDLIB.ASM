; ==============================================================================
; Title:   STDLIB.ASM
; Desc:    A variety of general-purpose sub-routines.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

SECTION "STDLIB", ROMX

; ------------------------------------------------------------------------------
; Turns off the LCD display.
; ------------------------------------------------------------------------------

lcdoff:
    call waitvblank;        ; Wait until VBlank so that we can turn off the LCD.
    ld   a,[LCDC]
    res  7,a                ; The flag to disable the LCD is at bit 7 of LCDC.
    ld   [LCDC],a
    ret

; ------------------------------------------------------------------------------
; Turns on the LCD display.
; ------------------------------------------------------------------------------

lcdon:
    ld   a,[LCDC]
    set  7,a                ; The flag to enable the LCD is at bit 7 of LCDC.
    ld   [LCDC],a
    ret

; ------------------------------------------------------------------------------
; Turns off the system sound.
; ------------------------------------------------------------------------------

sndoff:
    ld   a,[NR52]
    res  7,a                ; The flag to disable sound is at bit 7 of NR52.
    ld   [NR52],a
    ret

; ------------------------------------------------------------------------------
; Turns on the system sound.
; ------------------------------------------------------------------------------

sndon:
    ld   a,[NR52]
    set  7,a                ; The flag to enable sound is at bit 7 of NR52.
    ld   [NR52],a
    ret

; ------------------------------------------------------------------------------
; Halts execution until the system reaches the vertical blank.
; This should only be called if LCD is on, or flow will hang.
; ------------------------------------------------------------------------------

waitvblank:
    ld   a,[LYC]            ; Check the current scan line being drawn.
    cp   SCREEN_H           ; Compare it to the height of the screen.
    jr   nz,waitvblank      ; If past the screen height then continue.
    ret

; ------------------------------------------------------------------------------
; Based on the memcpy function from the C standard library.
; Copies one block of memory to another block of memory.
;
; @param hl : Destination address.
; @param de : Source address.
; @param bc : Number of bytes to copy.
; ------------------------------------------------------------------------------

memcpy:
    ld   a,[de]             ; Grab one byte from the source location.
    ld   [hli],a            ; Copy to the destination and increment the pointer.
    inc  de                 ; Move to the next source byte.
    dec  bc                 ; Decrement the size counter.
    ld   a,b                ; Check to see if there are still bytes to copy by
    or   c                  ; comparing the upper and lower bytes using OR to
    jr   nz,memcpy          ; see if any bits are set. If so, then continue.
    ret

; ------------------------------------------------------------------------------
; Based on the memset function from the C standard library.
; Sets a block of memory to a specific byte value.
;
; @param hl : Destination address.
; @param d  : Value to set.
; @param bc : Number of bytes to set.
; ------------------------------------------------------------------------------

memset:
    ld   a,d                ; Load the value to set memory to.
    ld   [hli],a            ; Set the byte and increment the pointer.
    dec  bc                 ; Decrement the size counter.
    ld   a,b                ; Check to see if there are still bytes to set by
    or   c                  ; comparing the upper and lower bytes using OR to
    jr   nz,memset          ; see if any bits are set. If so, then continue.
    ret

; ==============================================================================
