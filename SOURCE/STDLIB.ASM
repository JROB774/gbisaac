; ==============================================================================
; Title:   STDLIB.ASM
; Desc:    A variety of general-purpose sub-routines.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

SECTION "STDLIB", ROMX

WaitVBlank:
    ld   a,[LYC]
    cp   SCREEN_H
    jr   nz,WaitVBlank
    ret

; ==============================================================================
