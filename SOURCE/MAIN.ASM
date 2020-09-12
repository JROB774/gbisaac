INCLUDE "HEADER.ASM"

SECTION "MAIN", ROM0[$0150]
EntryPoint:
.lockup
    jr .lockup
