; ==============================================================================
; Title:   DEFINE.ASM
; Desc:    Definitions for a number of general-purpose constants and macros.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

; ------------------------------------------------------------------------------
; ADRESS INFO
; Some general purpose addresses that are of convenience.
; ------------------------------------------------------------------------------

ADDR_HEADER   EQU $0100         ; Start of the ROM header section.
ADDR_ENTRY    EQU $0150         ; Start of ROM execution section.

; ------------------------------------------------------------------------------
; SCREEN INFO
; Information about the physical screen of the Game Boy.
; ------------------------------------------------------------------------------

SCREEN_W      EQU 160           ; Width of the screen in pixels.
SCREEN_H      EQU 144           ; Height of the screen in pixels.
SCREEN_W_TILE EQU 20            ; Width of the screen in tiles.
SCREEN_H_TILE EQU 18            ; Height of the screen in tiles.

; ------------------------------------------------------------------------------
; LCD CONTROL REGISTER (R/W)
; The bits control what elements are displayed on screen and how.
;
; Bit 7 - LCD Display Enable
; Bit 6 - Window Tile Map Display Select
; Bit 5 - Window Display Enable
; Bit 4 - BG and Window Tile Data Select
; Bit 3 - BG Tile Map Display Select
; Bit 2 - OBJ (Sprite) Size
; Bit 1 - OBJ (Sprite) Display Enable
; Bit 0 - BG Display Enable
; ------------------------------------------------------------------------------

LCDC          EQU $FF40

LCDC_OFF      EQU %00000000     ; Bit 7 - LCD Display Enable
LCDC_ON       EQU %00000000     ; Bit 7 - LCD Display Enable
LCDC_WIN9800  EQU %00000000     ; Bit 6 - Window Tile Map Display Select
LCDC_WIN9C00  EQU %01000000     ; Bit 6 - Window Tile Map Display Select
LCDC_WINOFF   EQU %00000000     ; Bit 5 - Window Display Enable
LCDC_WINON    EQU %00100000     ; Bit 5 - Window Display Enable
LCDC_BG8800   EQU %00000000     ; Bit 4 - BG and Window Tile Data Select
LCDC_BG8000   EQU %00010000     ; Bit 4 - BG and Window Tile Data Select
LCDC_BG9800   EQU %00000000     ; Bit 3 - BG Tile Map Display Select
LCDC_BG9C00   EQU %00001000     ; Bit 3 - BG Tile Map Display Select
LCDC_OBJ8     EQU %00000000     ; Bit 2 - OBJ (Sprite) Size
LCDC_OBJ16    EQU %00000100     ; Bit 2 - OBJ (Sprite) Size
LCDC_OBJOFF   EQU %00000000     ; Bit 1 - OBJ (Sprite) Display Enable
LCDC_OBJON    EQU %00000010     ; Bit 1 - OBJ (Sprite) Display Enable
LCDC_BGOFF    EQU %00000000     ; Bit 0 - BG Display Enable
LCDC_BGON     EQU %00000001     ; Bit 0 - BG Display Enable

; ------------------------------------------------------------------------------
; LCDC Y-COORDINATE (R)
; The current vertical scan-line that is being drawn [0 - 153].
; The range [144 - 153] is the VBlank period.
; ------------------------------------------------------------------------------

LYC           EQU $FF44

; ==============================================================================
