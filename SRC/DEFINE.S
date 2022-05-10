; ==============================================================================

ADDRHEAD     EQU $0100     ; start of ROMB0 header section
ADDRMAIN     EQU $0150     ; start of ROMB0 execution
SCRW         EQU 160       ; screen width in pixels
SCRH         EQU 144       ; screen height in pixels
REG_NR52     EQU $FF26     ; audio control bits (R/W)
REG_LCDC     EQU $FF40     ; LCD control bits (R/W)
REG_LY       EQU $FF44     ; LCDC y coordinate [0-153] [144-153]=vblank (R)
REG_BGP      EQU $FF47     ; BG palette data (W)

; ==============================================================================
