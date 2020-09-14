; ==============================================================================
; Title:   MAIN.ASM
; Desc:    Main entry-point and game loop for the ROM.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

INCLUDE "DEFINE.ASM"
INCLUDE "STDLIB.ASM"
INCLUDE "HEADER.ASM"

SECTION "MAIN", ROM0[ADDR_ENTRY]

; ------------------------------------------------------------------------------
; This is the entry-point where the execution of our ROM begins.
; ------------------------------------------------------------------------------
EntryPoint:
    call WaitVBlank;        ; We want to disable the LCD so we can write into
    ld   a,[LCDC]           ; VRAM, so we wait until VBlank so we can do this.
    res  7,a                ; The flag to disable the LCD is at bit 7 of LCDC.
    ld   [LCDC],a
    xor  a                  ; ld a,0
    ld   [NR52],a           ; We turn off sound to save the system's power.

.loop                       ; Start executing the infinite main game loop.
    call WaitVBlank
    jr   .loop

; ==============================================================================
