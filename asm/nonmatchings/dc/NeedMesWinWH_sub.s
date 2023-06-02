.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NeedMesWinWH_sub__FPiPiPiPiii
/* 4FE00 0014FD00 14002019 */  blez       $9, .L0014FD54
/* 4FE04 0014FD04 00000000 */   nop
/* 4FE08 0014FD08 0000838C */  lw         $3, 0x0($4)
/* 4FE0C 0014FD0C 21186900 */  addu       $3, $3, $9
/* 4FE10 0014FD10 000083AC */  sw         $3, 0x0($4)
/* 4FE14 0014FD14 0000A38C */  lw         $3, 0x0($5)
/* 4FE18 0014FD18 0000848C */  lw         $4, 0x0($4)
/* 4FE1C 0014FD1C 2A086400 */  slt        $at, $3, $4
/* 4FE20 0014FD20 02002010 */  beqz       $at, .L0014FD2C
/* 4FE24 0014FD24 00000000 */   nop
/* 4FE28 0014FD28 0000A4AC */  sw         $4, 0x0($5)
.L0014FD2C:
/* 4FE2C 0014FD2C 18202801 */  mult       $4, $9, $8
/* 4FE30 0014FD30 0000C38C */  lw         $3, 0x0($6)
/* 4FE34 0014FD34 21186400 */  addu       $3, $3, $4
/* 4FE38 0014FD38 0000C3AC */  sw         $3, 0x0($6)
/* 4FE3C 0014FD3C 0000E38C */  lw         $3, 0x0($7)
/* 4FE40 0014FD40 0000C48C */  lw         $4, 0x0($6)
/* 4FE44 0014FD44 2A086400 */  slt        $at, $3, $4
/* 4FE48 0014FD48 02002010 */  beqz       $at, .L0014FD54
/* 4FE4C 0014FD4C 00000000 */   nop
/* 4FE50 0014FD50 0000E4AC */  sw         $4, 0x0($7)
.L0014FD54:
/* 4FE54 0014FD54 0800E003 */  jr         $31
/* 4FE58 0014FD58 00000000 */   nop
/* 4FE5C 0014FD5C 00000000 */  nop
