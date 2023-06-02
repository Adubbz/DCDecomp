.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaCallback
/* CF68 0010CE68 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* CF6C 0010CE6C 2900043C */  lui        $4, %hi(D_00297448)
/* CF70 0010CE70 0000BFFF */  sd         $31, 0x0($sp)
/* CF74 0010CE74 A611040C */  jal        printf
/* CF78 0010CE78 48748424 */   addiu     $4, $4, %lo(D_00297448)
/* CF7C 0010CE7C 0000BFDF */  ld         $31, 0x0($sp)
/* CF80 0010CE80 2D100000 */  daddu      $2, $0, $0
/* CF84 0010CE84 0800E003 */  jr         $31
/* CF88 0010CE88 1000BD27 */   addiu     $sp, $sp, 0x10
/* CF8C 0010CE8C 00000000 */  nop
