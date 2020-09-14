; ==============================================================================
; Title:   STDLIB.ASM
; Desc:    A variety of general-purpose sub-routines.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

SECTION "STDLIB", ROMX

; ------------------------------------------------------------------------------
; Halts execution until the system reaches the vertical blank.
; ------------------------------------------------------------------------------
waitvblank:
    ld   a,[LYC]
    cp   SCREEN_H
    jr   nz,waitvblank
    ret

; ------------------------------------------------------------------------------
; Based on the memset function from the C standard library.
; Sets a block of memory to a specific value.
;
; @param hl : Destination address to set.
; @param d  : Value to set.
; @param bc : Number of bytes to set.
; ------------------------------------------------------------------------------
memset:
.loop
    ld   a,d                ; Load the value to set memory to.
    ld   [hli],a            ; Set the byte and increment the pointer.
    dec  bc                 ; Decrement the size counter.
    ld   a,b                ; Check to see if there are still bytes to set by
    or   c                  ; comparing the upper and lower bytes using OR to
    jr   nz,.loop           ; see if any bits are set. If so, then continue.
    ret

; ==============================================================================
