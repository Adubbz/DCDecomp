.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdSyncS
/* AF38 0010AE38 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AF3C 0010AE3C 1000BFFF */  sd         $31, 0x10($sp)
/* AF40 0010AE40 0F008014 */  bnez       $4, .L0010AE80
/* AF44 0010AE44 0000B0FF */   sd        $16, 0x0($sp)
/* AF48 0010AE48 2500023C */  lui        $2, (0x250270 >> 16)
/* AF4C 0010AE4C 7002438C */  lw         $3, (0x250270 & 0xFFFF)($2)
/* AF50 0010AE50 03006018 */  blez       $3, .L0010AE60
/* AF54 0010AE54 2900043C */   lui       $4, %hi(D_00297140)
/* AF58 0010AE58 A611040C */  jal        printf
/* AF5C 0010AE5C 40718424 */   addiu     $4, $4, %lo(D_00297140)
.L0010AE60:
/* AF60 0010AE60 2A00103C */  lui        $16, %hi(D_002A4D60)
/* AF64 0010AE64 00000000 */  nop
.L0010AE68:
/* AF68 0010AE68 A65D040C */  jal        sceSifCheckStatRpc
/* AF6C 0010AE6C 604D0426 */   addiu     $4, $16, %lo(D_002A4D60)
/* AF70 0010AE70 FDFF4014 */  bnez       $2, .L0010AE68
/* AF74 0010AE74 2D100000 */   daddu     $2, $0, $0
/* AF78 0010AE78 05000010 */  b          .L0010AE90
/* AF7C 0010AE7C 1000BFDF */   ld        $31, 0x10($sp)
.L0010AE80:
/* AF80 0010AE80 2A00043C */  lui        $4, %hi(D_002A4D60)
/* AF84 0010AE84 A65D040C */  jal        sceSifCheckStatRpc
/* AF88 0010AE88 604D8424 */   addiu     $4, $4, %lo(D_002A4D60)
/* AF8C 0010AE8C 1000BFDF */  ld         $31, 0x10($sp)
.L0010AE90:
/* AF90 0010AE90 0000B0DF */  ld         $16, 0x0($sp)
/* AF94 0010AE94 0800E003 */  jr         $31
/* AF98 0010AE98 2000BD27 */   addiu     $sp, $sp, 0x20
/* AF9C 0010AE9C 00000000 */  nop
