; ==============================================================================
; Title:   DEBUG.ASM
; Desc:    Macros and utilities useful for debugging with BGB.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

; ==============================================================================

IF DEF(DEBUG_BUILD)

; ------------------------------------------------------------------------------
; Macro that prints a debug message to the BGB emulator's debugger window.
;
; @param 1 : The message to print out to the debugger.
; ------------------------------------------------------------------------------

DBGMSG: MACRO
    ld   d,d
    jr   .end\@
    DW   $6464
    DW   $0000
    DB   \1
.end\@
    ENDM

ENDC ; DEBUG_BUILD

; ==============================================================================
