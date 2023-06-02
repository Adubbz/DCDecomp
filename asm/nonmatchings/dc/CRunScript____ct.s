.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__10CRunScriptFv
/* 13DA40 0023D940 0C00828C */  lw         $2, 0xC($4)
/* 13DA44 0023D944 100082AC */  sw         $2, 0x10($4)
/* 13DA48 0023D948 0C00828C */  lw         $2, 0xC($4)
/* 13DA4C 0023D94C 140082AC */  sw         $2, 0x14($4)
/* 13DA50 0023D950 1C00828C */  lw         $2, 0x1C($4)
/* 13DA54 0023D954 200082AC */  sw         $2, 0x20($4)
/* 13DA58 0023D958 1C00828C */  lw         $2, 0x1C($4)
/* 13DA5C 0023D95C 240082AC */  sw         $2, 0x24($4)
/* 13DA60 0023D960 300080AC */  sw         $0, 0x30($4)
/* 13DA64 0023D964 000080AC */  sw         $0, 0x0($4)
/* 13DA68 0023D968 080080AC */  sw         $0, 0x8($4)
/* 13DA6C 0023D96C 180080AC */  sw         $0, 0x18($4)
/* 13DA70 0023D970 380080AC */  sw         $0, 0x38($4)
/* 13DA74 0023D974 28168070 */  paddub     $2, $4, $0
/* 13DA78 0023D978 0800E003 */  jr         $31
/* 13DA7C 0023D97C 00000000 */   nop
