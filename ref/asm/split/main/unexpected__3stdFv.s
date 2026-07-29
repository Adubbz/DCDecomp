.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel unexpected__3stdFv
/* 022980 00122880 F0FFBD27 */  addiu       $29, $29, -0x10
/* 022984 00122884 0000BF7F */  sq          $31, 0x0($29)
/* 022988 00122888 2500013C */  lui         $1, %hi(uhandler__3std)
/* 02298C 0012288C 280B228C */  lw          $2, %lo(uhandler__3std)($1)
/* 022990 00122890 09F84000 */  jalr        $2
/* 022994 00122894 00000000 */   nop
/* 022998 00122898 0000BF7B */  lq          $31, 0x0($29)
/* 02299C 0012289C 0800E003 */  jr          $31
/* 0229A0 001228A0 1000BD27 */   addiu      $29, $29, 0x10
/* 0229A4 001228A4 00000000 */  nop
/* 0229A8 001228A8 00000000 */  nop
/* 0229AC 001228AC 00000000 */  nop
