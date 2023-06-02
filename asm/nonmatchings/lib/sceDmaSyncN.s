.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaSyncN
/* CEF0 0010CDF0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* CEF4 0010CDF4 2900043C */  lui        $4, %hi(D_002973F0)
/* CEF8 0010CDF8 0000BFFF */  sd         $31, 0x0($sp)
/* CEFC 0010CDFC A611040C */  jal        printf
/* CF00 0010CE00 F0738424 */   addiu     $4, $4, %lo(D_002973F0)
/* CF04 0010CE04 0000BFDF */  ld         $31, 0x0($sp)
/* CF08 0010CE08 2D100000 */  daddu      $2, $0, $0
/* CF0C 0010CE0C 0800E003 */  jr         $31
/* CF10 0010CE10 1000BD27 */   addiu     $sp, $sp, 0x10
/* CF14 0010CE14 00000000 */  nop
