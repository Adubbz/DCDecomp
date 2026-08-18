.include "macro.inc"

.include "macro.inc"

.section .rdata, "a"
glabel RO_002A101C
    /* 1A111C 002A101C B0002A00 */ .word __sinit_nowload.cpp

glabel RO_002A1020
    /* 1A1120 002A1020 F0002A00 */ .word __sinit_object.cpp

glabel RO_002A1024
    /* 1A1124 002A1024 20012A00 */ .word __sinit_sysmes.cpp

glabel RO_002A1028
    /* 1A1128 002A1028 50012A00 */ .word __sinit_objanime.cpp

glabel RO_002A102C
    /* 1A112C 002A102C 90012A00 */ .word __sinit_ebattle.cpp

glabel RO_002A1030
    /* 1A1130 002A1030 E0012A00 */ .word __sinit_editetc.cpp

glabel RO_002A1034
    /* 1A1134 002A1034 10022A00 */ .word __sinit_editloop.cpp

glabel RO_002A1038
    /* 1A1138 002A1038 50072A00 */ .word __sinit_editloop3.cpp

glabel RO_002A103C
    /* 1A113C 002A103C 30092A00 */ .word __sinit_edit_in.cpp

glabel RO_002A1040
    /* 1A1140 002A1040 300B2A00 */ .word __sinit_fishing.cpp

glabel RO_002A1044
    /* 1A1144 002A1044 200C2A00 */ .word __sinit_dbgimp.cpp

glabel RO_002A1048
    /* 1A1148 002A1048 600C2A00 */ .word __sinit_monstor.cpp

glabel RO_002A104C
    /* 1A114C 002A104C A00C2A00 */ .word __sinit_chargeshop.cpp

glabel RO_002A1050
    /* 1A1150 002A1050 E00C2A00 */ .word __sinit_dngmenu.cpp

glabel RO_002A1054
    /* 1A1154 002A1054 000E2A00 */ .word __sinit_menuetc.cpp

glabel RO_002A1058
    /* 1A1158 002A1058 C00E2A00 */ .word __sinit_menuetc2.cpp

glabel RO_002A105C
    /* 1A115C 002A105C F00E2A00 */ .word __sinit_menuetc4.cpp

glabel RO_002A1060
    /* 1A1160 002A1060 200F2A00 */ .word __sinit_m_effect.cpp

glabel __static_init_end
    /* 1A1164 002A1064 00000000 */ .word 0x00000000
    /* 1A1168 002A1068 00000000 */ .word 0x00000000
    /* 1A116C 002A106C 00000000 */ .word 0x00000000

glabel __vt__Q23std9exception
    /* 1A1170 002A1070 C08C2900 */ .word __RTTI__Q23std9exception
    /* 1A1174 002A1074 00000000 */ .word 0x00000000
    /* 1A1178 002A1078 90251200 */ .word __dt__Q23std9exceptionFv
    /* 1A117C 002A107C 00261200 */ .word what__Q23std9exceptionCFv

glabel __vt__Q23std13bad_exception
    /* 1A1180 002A1080 708D2900 */ .word __RTTI__Q23std13bad_exception
    /* 1A1184 002A1084 00000000 */ .word 0x00000000
    /* 1A1188 002A1088 002D1200 */ .word __dt__Q23std13bad_exceptionFv
    /* 1A118C 002A108C 902D1200 */ .word what__Q23std13bad_exceptionCFv

