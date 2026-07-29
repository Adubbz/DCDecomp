.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel terminate__3stdFv
/* 0229B0 001228B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0229B4 001228B4 0000BF7F */  sq          $31, 0x0($29)
/* 0229B8 001228B8 2500013C */  lui         $1, %hi(thandler__3std)
/* 0229BC 001228BC 200B228C */  lw          $2, %lo(thandler__3std)($1)
/* 0229C0 001228C0 09F84000 */  jalr        $2
/* 0229C4 001228C4 00000000 */   nop
/* 0229C8 001228C8 0000BF7B */  lq          $31, 0x0($29)
/* 0229CC 001228CC 0800E003 */  jr          $31
/* 0229D0 001228D0 1000BD27 */   addiu      $29, $29, 0x10
/* 0229D4 001228D4 00000000 */  nop
/* 0229D8 001228D8 00000000 */  nop
/* 0229DC 001228DC 00000000 */  nop
