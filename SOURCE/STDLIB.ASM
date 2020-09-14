; ==============================================================================
; Title:   STDLIB.ASM
; Desc:    A variety of general-purpose sub-routines.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

SECTION "STDLIB", ROMX

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

; ------------------------------------------------------------------------------
; Halts execution until the system reaches the vertical blank.
; ------------------------------------------------------------------------------

waitvblank:
    ld   a,[LYC]            ; Check the current scan line begin drawn.
    cp   SCREEN_H           ; Compare it to the height of the screen.
    jr   nz,waitvblank      ; If past the screen height then continue.
    ret

; ==============================================================================
