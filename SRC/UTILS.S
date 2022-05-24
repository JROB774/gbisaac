; ==============================================================================

SECTION "UTILS", ROMX
; ------------------------------------------------------------------------------
; halts execution until we are in the vertical blank region of the screen
; this should only be called if the LCD is on or else execution will hang
; ------------------------------------------------------------------------------
WaitVbl:  LD   A,[R_LY]
          CP   SCRH
          JP   NZ,WaitVbl    ; halt until we're past the screen height
          RET
; ------------------------------------------------------------------------------
; disables the LCD display
; ------------------------------------------------------------------------------
LCDOff:   CALL WaitVbl       ; wait for vblank to avoid hardware damage!
          LD   A,[R_LCDC]
          RES  7,A           ; flag to disable is at bit 7 of LCDC
          LD   [R_LCDC],A
          RET
; ------------------------------------------------------------------------------
; enables the LCD display
; ------------------------------------------------------------------------------
LCDOn:    LD   A,[R_LCDC]
          SET  7,A           ; flag to enable is at bit 7 of LCDC
          LD   [R_LCDC],A
          RET
; ------------------------------------------------------------------------------
; disables the audio system
; ------------------------------------------------------------------------------
SndOff:   LD   A,[R_NR52]
          RES  7,A           ; flag to disable is at bit 7 of NR52
          LD   [R_NR52],A
          RET
; ------------------------------------------------------------------------------
; enables the audio system
; ------------------------------------------------------------------------------
SndOn:    LD   A,[R_NR52]
          SET  7,A           ; flag to enable is at bit 7 of NR5
          LD   [R_NR52],A
          RET
; ------------------------------------------------------------------------------
; copys a block of memory from a source location to a destination location
; ------------------------------------------------------------------------------
; @param HL : destination address
; @param DE : source address
; @param BC : byte count to copy
; ------------------------------------------------------------------------------
MemCpy:   LD   A,[DE]
          LD   [HL+],A       ; copy to the destination and increment pointer
          INC  DE
          DEC  BC
          LD   A,B
          OR   C             ; or B and C to check for non-zero counter
          JR   NZ,MemCpy
          RET
; ------------------------------------------------------------------------------
; assigns a block of memory at a location to a specific byte value
; ------------------------------------------------------------------------------
; @param HL : destination address
; @param D  : value to set
; @param BC : byte count to set
; ------------------------------------------------------------------------------
MemSet:   LD   A,D
          LD   [HL+],A       ; set byte at destination and increment pointer
          DEC  BC
          LD   A,B
          OR   C             ; or B and C to check for non-zero counter
          JR   NZ,MemSet
          RET
; ------------------------------------------------------------------------------

; ==============================================================================
