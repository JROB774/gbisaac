; ==============================================================================

SECTION "HEADER", ROM0[ADDRHEAD]
; ------------------------------------------------------------------------------
Header:
NOP                    ; [$0100-$0103] entry point
JP ADDRMAIN
; ------------------------------------------------------------------------------
; [$0104-$0133] nintendo logo (must match exactly or ROM will fail boot)
; ------------------------------------------------------------------------------
DB $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D
DB $00,$08,$11,$1F,$88,$89,$00,$0E,$DC,$CC,$6E,$E6,$DD,$DD,$D9,$99
DB $BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E
DB "BINDINGISAAC.GB"   ; [$0134-$0142] rom title
DB $00                 ; [$0143]       CGB flag ($00=GB $C0=CGB $80=GB+CGB)
DW $0000               ; [$0144-$0145] game manufacturer code
DB $00                 ; [$0146]       SGB flag ($00=normal $03=SGB)
; ------------------------------------------------------------------------------
; [$0147] cartridge type (used to enable extra hardware features)
; ------------------------------------------------------------------------------
; $00 - ROM only                      $12 - MBC3+RAM
; $01 - MBC1                          $13 - MBC3+RAM+BATTERY
; $02 - MBC1+RAM                      $19 - MBC5
; $03 - MBC2+RAM+BATTERY              $1A - MBC5+RAM
; $05 - MBC2                          $1B - MBC5+RAM+BATTERY
; $06 - MBC2+BATTERY                  $1C - MBC5+RUMBLE
; $08 - ROM+RAM                       $1D - MBC5+RUMBLE+RAM
; $09 - ROM+RAM+BATTERY               $1E - MBC5+RUMBLE+RAM+BATTERY
; $0B - MMM01                         $20 - MBC6
; $0C - MMM01+RAM                     $22 - MBC7+SENSOR+RUMBLE+RAM+BATTERY
; $0D - MMM01+RAM+BATTERY             $FC - POCKET CAMERA
; $0F - MBC3+TIMER+BATTERY            $FD - BANDAI TAMA5
; $10 - MBC3+TIMER+RAM+BATTERY        $FE - HuC3
; $11 - MBC3                          $FF - HuC1+RAM+BATTERY
DB $00
; ------------------------------------------------------------------------------
; [$0148] ROM size
; ------------------------------------------------------------------------------
; $00 -  32kb (no ROM banking)        $06 -   2mb (128 banks) (125 MBC1)
; $01 -  64kb ( 4 banks)              $07 -   4mb (256 banks)
; $02 - 128kb ( 8 banks)              $08 -   8mb (512 banks)
; $03 - 256kb (16 banks)              $52 - 1.1mb ( 72 banks)
; $04 - 512kb (32 banks)              $53 - 1.2mb ( 80 banks)
; $05 -   1mb (64 banks) (63 MBC1)    $54 - 1.5mb ( 96 banks)
DB $00
; ------------------------------------------------------------------------------
; [$0149] RAM size
; ------------------------------------------------------------------------------
; $00 - none
; $01 - 2kb
; $02 - 8kb
; $03 - 32kb (4 banks of 8kb each)
; $04 - 128kb (16 banks of 8kb each)
; $05 - 64kb (8 banks of 8kb each)
DB $00
DB $01                 ; [$014A]       destination code ($00=JP $01=EU/US)
DB $33                 ; [$014B]       old licensee code ($33 for SGB)
DB $00                 ; [$014C]       ROM version number
DB $00                 ; [$014D]       header checksum
DW $0000               ; [$014E-$014F] global checksum
; ------------------------------------------------------------------------------

; ==============================================================================
