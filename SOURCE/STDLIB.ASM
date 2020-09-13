; ==============================================================================
; Title:   STDLIB.ASM
; Desc:    A variety of general-purpose sub-routines.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

SECTION "STDLIB", ROMX

WaitVBlank:
    ld   a,[LCD_LINE_Y]
    cp   LCD_HEIGHT
    jr   nz,WaitVBlank
    ret

; ==============================================================================
