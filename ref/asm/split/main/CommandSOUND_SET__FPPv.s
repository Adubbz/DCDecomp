.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandSOUND_SET__FPPv
/* 0771A0 001770A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0771A4 001770A4 0000BF7F */  sq          $31, 0x0($29)
/* 0771A8 001770A8 0000828C */  lw          $2, 0x0($4)
/* 0771AC 001770AC 0000438C */  lw          $3, 0x0($2)
/* 0771B0 001770B0 C08F828F */  lw          $2, -0x7040($28)
/* 0771B4 001770B4 4C0043AC */  sw          $3, 0x4C($2)
/* 0771B8 001770B8 C08F838F */  lw          $3, -0x7040($28)
/* 0771BC 001770BC 2A00023C */  lui         $2, %hi(LIT_873__2)
/* 0771C0 001770C0 70A84424 */  addiu       $4, $2, %lo(LIT_873__2)
/* 0771C4 001770C4 4C00658C */  lw          $5, 0x4C($3)
/* 0771C8 001770C8 A611040C */  jal         printf
/* 0771CC 001770CC 00000000 */   nop
/* 0771D0 001770D0 0000BF7B */  lq          $31, 0x0($29)
/* 0771D4 001770D4 1000BD27 */  addiu       $29, $29, 0x10
/* 0771D8 001770D8 0800E003 */  jr          $31
/* 0771DC 001770DC 00000000 */   nop
