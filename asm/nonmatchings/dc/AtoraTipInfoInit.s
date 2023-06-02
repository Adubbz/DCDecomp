.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraTipInfoInit__Fv
/* 11A160 0021A060 E496838F */  lw         $3, -0x691C($gp)
/* 11A164 0021A064 000060AC */  sw         $0, 0x0($3)
/* 11A168 0021A068 FFFF0424 */  addiu      $4, $0, -0x1
/* 11A16C 0021A06C E496838F */  lw         $3, -0x691C($gp)
/* 11A170 0021A070 080064AC */  sw         $4, 0x8($3)
/* 11A174 0021A074 E496838F */  lw         $3, -0x691C($gp)
/* 11A178 0021A078 0C0064AC */  sw         $4, 0xC($3)
/* 11A17C 0021A07C E496838F */  lw         $3, -0x691C($gp)
/* 11A180 0021A080 100064A4 */  sh         $4, 0x10($3)
/* 11A184 0021A084 0800E003 */  jr         $31
/* 11A188 0021A088 00000000 */   nop
/* 11A18C 0021A08C 00000000 */  nop
