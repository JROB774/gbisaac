; ==============================================================================
; Title:   HEADER.ASM
; Desc:    Data section for thw Game Boy ROM Header.
; Author:  Joshua Robertson
; License: MIT License
; ==============================================================================

; ==============================================================================

SECTION "HEADER", ROM0[ADDR_HEADER]

RomHeader:
    nop                                  ; [$0100 - $0103] Entry Point         ;
    jp   ADDR_ENTRY                                                            ;
    DB   $CE,$ED,$66,$66,$CC,$0D,$00,$0B ; [$0104 - $0133] Nintendo Logo       ;
    DB   $03,$73,$00,$83,$00,$0C,$00,$0D                                       ;
    DB   $00,$08,$11,$1F,$88,$89,$00,$0E                                       ;
    DB   $DC,$CC,$6E,$E6,$DD,$DD,$D9,$99                                       ;
    DB   $BB,$BB,$67,$63,$6E,$0E,$EC,$CC                                       ;
    DB   $DD,$DC,$99,$9F,$BB,$B9,$33,$3E                                       ;
    DB   "GBISAAC",$00,$00,$00,$00       ; [$0134 - $013E] ROM Title           ;
    DB   "JROB"                          ; [$013F - $0142] Manufacturer Code   ;
    DB   $00                             ; [$0143        ] CGB Flag            ;
    DB   "JR"                            ; [$0144 - $0145] New Licensee Code   ;
    DB   $00                             ; [$0146        ] SGB Flag            ;
    DB   $00                             ; [$0147        ] Cartridge Type      ;
    DB   $00                             ; [$0148        ] ROM Size            ;
    DB   $00                             ; [$0149        ] RAM Size            ;
    DB   $01                             ; [$014A        ] Destination Code    ;
    DB   $33                             ; [$014B        ] Old Licensee Code   ;
    DB   $00                             ; [$014C        ] ROM Version Number  ;
    DB   $FF                             ; [$014D        ] Header Checksum     ;
    DW   $FFFF                           ; [$014E - $014F] Global Checksum     ;

; ==============================================================================
