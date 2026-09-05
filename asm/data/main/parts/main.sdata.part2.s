.include "macro.inc"

.include "macro.inc"

.section .sdata, "wa"
glabel play_time_count
    /* 1A1F94 002A1E94 01000000 */ .word 0x00000001

glabel "@905"
    /* 1A1F98 002A1E98 28952900 */ .word "@903"
    /* 1A1F9C 002A1E9C 30952900 */ .word "@904"

glabel "@398"
    /* 1A1FA0 002A1EA0 0A000000 */ .word 0x0000000A
    /* 1A1FA4 002A1EA4 00000000 */ .word 0x00000000

glabel "@540"
    /* 1A1FA8 002A1EA8 203B2C09 */ .word 0x092C3B20
    /* 1A1FAC 002A1EAC 0A0D0000 */ .word 0x00000D0A

glabel "@565"
    /* 1A1FB0 002A1EB0 203B2C09 */ .word 0x092C3B20
    /* 1A1FB4 002A1EB4 0A0D0000 */ .word 0x00000D0A

glabel Mes1MakeFlg
    /* 1A1FB8 002A1EB8 01000000 */ .word 0x00000001

glabel Mes2MakeFlg
    /* 1A1FBC 002A1EBC 01000000 */ .word 0x00000001
