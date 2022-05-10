; ==============================================================================
; Title:   MAIN.ASM
; Desc:    Main entry-point and game loop for the ROM.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

INCLUDE "DEFINE.ASM"
INCLUDE "DEBUG.ASM"
INCLUDE "STDLIB.ASM"
INCLUDE "JOYPAD.ASM"
INCLUDE "HEADER.ASM"

SECTION "MAIN", ROM0[ADDR_ENTRY]

; ------------------------------------------------------------------------------
; This is the entry-point where the execution of our ROM begins.
; ------------------------------------------------------------------------------

entrypoint:
    call lcdoff             ; We disable the LCD so we can write into VRAM.
    call sndoff             ; We turn off sound to save the system's power.

    call lcdon              ; Turn on the LCD so we can see the screen.
.loop                       ; Start executing the infinite main game loop.
    call updatejpad
    call waitvblank
    jr   .loop

; ==============================================================================
