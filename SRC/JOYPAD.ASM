; ==============================================================================
; Title:   JOYPAD.ASM
; Desc:    Sub-routines used for handling the joypad.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

SECTION "JOYPAD-VARS", WRAM0

JPAD_P15_CUR :: DS 1        ; Current state of P15 (button keys).
JPAD_P15_OLD :: DS 1        ; Previous state of P15 (button keys).
JPAD_P14_CUR :: DS 1        ; Current state of P14 (direction keys).
JPAD_P14_OLD :: DS 1        ; Previous state of P14 (direction keys).

; ==============================================================================

SECTION "JOYPAD", ROMX

; ------------------------------------------------------------------------------
; Moves the previous joypad state from JPAD_P1x_CUR to JPAD_P1x_OLD and then
; gets the current joypad state from the system and stores it in JPAD_P1x_CUR.
; ------------------------------------------------------------------------------

updatejpad:
    ld   hl,P1              ; Setup P1 so that we can get retrieve P15 state.
    ld   a,P1_5
    ld   [hl],a             ; Cache the current P15 state in the A register.
    ld   a,[hl]
    ld   hl,JPAD_P15_CUR    ; Cache the previous P15 state in the B register.
    ld   b,[hl]
    ld   [hl],a             ; Save the current P15 state.
    ld   hl,JPAD_P15_OLD
    ld   [hl],b             ; Save the previous P15 state.
    ld   hl,P1              ; Setup P1 so that we can get retrieve P14 state.
    ld   a,P1_4
    ld   [hl],a             ; Cache the current P14 state in the A register.
    ld   a,[hl]
    ld   hl,JPAD_P14_CUR    ; Cache the previous P14 state in the B register.
    ld   b,[hl]
    ld   [hl],a             ; Save the current P14 state.
    ld   hl,JPAD_P14_OLD
    ld   [hl],b             ; Save the previous P14 state.
    ret

; ------------------------------------------------------------------------------
; Clears the current and previous joypad states, setting them to zsro.
; ------------------------------------------------------------------------------

clearjpad:
    ld   hl,JPAD_P15_CUR    ; Load the current P15 state and set it to zero.
    ld   [hl],$00
    ld   hl,JPAD_P15_OLD    ; Load the previous P15 state and set it to zero.
    ld   [hl],$00
    ld   hl,JPAD_P14_CUR    ; Load the current P14 state and set it to zero.
    ld   [hl],$00
    ld   hl,JPAD_P14_OLD    ; Load the previous P14 state and set it to zero.
    ld   [hl],$00
    ret

; ==============================================================================
