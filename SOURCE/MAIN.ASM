; ==============================================================================

INCLUDE "DEFINE.ASM"
INCLUDE "HEADER.ASM"

SECTION "MAIN", ROM0[ADDR_ENTRY]
EntryPoint:
.lockup
    jr .lockup

; ==============================================================================
