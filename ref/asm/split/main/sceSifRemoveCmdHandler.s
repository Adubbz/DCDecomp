.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifRemoveCmdHandler
/* 016998 00116898 04008104 */  bgez        $4, .L001168AC
/* 01699C 0011689C C0180400 */   sll        $3, $4, 3
/* 0169A0 001168A0 2A00023C */  lui         $2, %hi(B_002A5924)
/* 0169A4 001168A4 03000010 */  b           .L001168B4
/* 0169A8 001168A8 2459448C */   lw         $4, %lo(B_002A5924)($2)
.L001168AC:
/* 0169AC 001168AC 2A00023C */  lui         $2, %hi(B_002A592C)
/* 0169B0 001168B0 2C59448C */  lw          $4, %lo(B_002A592C)($2)
.L001168B4:
/* 0169B4 001168B4 21186400 */  addu        $3, $3, $4
/* 0169B8 001168B8 0800E003 */  jr          $31
/* 0169BC 001168BC 000060AC */   sw         $0, 0x0($3)
