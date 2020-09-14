; ==============================================================================
; Title:   DEFINE.ASM
; Desc:    Definitions for a number of general-purpose constants and macros.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

; ------------------------------------------------------------------------------
; MEMORY MAP
; Start addresses for the different sections of the Game Boy's memory.
; ------------------------------------------------------------------------------

MEM_ROMB0     EQU $0000         ; [$0000-$3FFF] 16KB ROM Bank 00
MEM_ROMB1     EQU $4000         ; [$4000-$7FFF] 16KB ROM Bank 01-NN (Switchable)
MEM_VRAM      EQU $8000         ; [$8000-$9FFF] 8KB Video RAM
MEM_ERAM      EQU $A000         ; [$A000-$BFFF] 8KB External RAM
MEM_WRAM0     EQU $C000         ; [$C000-$CFFF] 4KB Work RAM Bank 00
MEM_WRAM1     EQU $D000         ; [$D000-$DFFF] 4KB Work RAM Bank 01
MEM_ECHORAM   EQU $E000         ; [$E000-$FDFF] Mirror of WRAM (Not Used)
MEM_OAM       EQU $FE00         ; [$FE00-$FE9F] Sprite Attribute Table (OAM)
MEM_INVALID   EQU $FEA0         ; [$FEA0-$FEFF] Not Usable
MEM_IO        EQU $FF00         ; [$FF00-$FF7F] I/O Registers
MEM_HRAM      EQU $FF80         ; [$FF80-$FFFE] High RAM

; ------------------------------------------------------------------------------
; ADRESS INFO
; Some general purpose addresses that are of convenience.
; ------------------------------------------------------------------------------

ADDR_HEADER   EQU $0100         ; Start of ROMB0 Header Section
ADDR_ENTRY    EQU $0150         ; Start of ROMB0 Execution

; ------------------------------------------------------------------------------
; SCREEN INFO
; Information about the physical screen of the Game Boy.
; ------------------------------------------------------------------------------

SCREEN_W      EQU 160           ; Screen Width in Pixels
SCREEN_H      EQU 144           ; Screen Height in Pixels
SCREEN_W_TILE EQU 20            ; Screen Width in Tiles
SCREEN_H_TILE EQU 18            ; Screen Height in Tiles

; ------------------------------------------------------------------------------
; VRAM MEMORY MAP
; Important addresses for the different sections of VRAM.
; ------------------------------------------------------------------------------

VRAM_TBLOCK0  EQU $8000         ; [$8000-$87FF] First Block of 128 Tiles
VRAM_TBLOCK1  EQU $8800         ; [$8800-$8FFF] Second Block of 128 Tiles
VRAM_TBLOCK2  EQU $9000         ; [$9000-$97FF] Third Block of 128 Tiles
VRAM_SCREEN0  EQU $9800         ; [$9800-$9BFF] Background Tile Map
VRAM_SCREEN1  EQU $9C00         ; [$9C00-$9FFF] Window Tile Map

; ------------------------------------------------------------------------------
; PALETTE REGISTERS (W)
; The bits of each register control the palette for backgrounds and objects.
;
; Bit 7-6 - Shade for Color %11
; Bit 5-4 - Shade for Color %10
; Bit 3-2 - Shade for Color %01
; Bit 1-0 - Shade for Color %00
; ------------------------------------------------------------------------------

BGP           EQU $FF47         ; Background Palette Data
OBP0          EQU $FF48         ; Object Palette 0 Data
OBP1          EQU $FF49         ; Object Palette 1 Data

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

; ------------------------------------------------------------------------------
; NR52 SOUND ON/OFF (R/W)
; The bits control toggling sound on/off and display the sound status.
;
; Bit 7 - Toggle Sound On/Off
; Bit 3 - Sound 4 On Flag (Read-Only)
; Bit 2 - Sound 3 On Flag (Read-Only)
; Bit 1 - Sound 2 On Flag (Read-Only)
; Bit 0 - Sound 1 On Flag (Read-Only)
; ------------------------------------------------------------------------------

NR52          EQU $FF26

NR52_OFF      EQU %00000000     ; Bit 7 - Toggle Sound On/Off
NR52_ON       EQU %10000000     ; Bit 7 - Toggle Sound On/Off
NR52_SOUND4   EQU $00001000     ; Bit 3 - Sound 4 On Flag (Read-Only)
NR52_SOUND3   EQU $00000100     ; Bit 2 - Sound 3 On Flag (Read-Only)
NR52_SOUND2   EQU $00000010     ; Bit 1 - Sound 2 On Flag (Read-Only)
NR52_SOUND1   EQU $00000001     ; Bit 0 - Sound 1 On Flag (Read-Only)

; ==============================================================================
