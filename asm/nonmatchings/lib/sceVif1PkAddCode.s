.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkAddCode
/* 21110 00121010 0000828C */  lw         $2, 0x0($4)
/* 21114 00121014 000045AC */  sw         $5, 0x0($2)
/* 21118 00121018 04004224 */  addiu      $2, $2, 0x4
/* 2111C 0012101C 0800E003 */  jr         $31
/* 21120 00121020 000082AC */   sw        $2, 0x0($4)
/* 21124 00121024 00000000 */  nop
