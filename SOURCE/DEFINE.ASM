; ==============================================================================
; Title:   DEFINE.ASM
; Desc:    Definitions for a number of general-purpose constants and macros.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

ADDR_HEADER EQU $0100   ; memory address that marks the start of the ROM header
ADDR_ENTRY  EQU $0150   ; memory address that marks the start of ROM execution

LCD_WIDTH   EQU 160     ; width of the LCD screen in pixels
LCD_HEIGHT  EQU 144     ; height of the LCD screen in pixels
LCD_LINE_Y  EQU $FF44   ; current y-coordinate of the LCDC [0 - 153]

; ==============================================================================
