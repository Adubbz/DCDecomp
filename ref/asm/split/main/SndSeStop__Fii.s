.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSeStop__Fii
/* 05A9B0 0015A8B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 05A9B4 0015A8B4 0000BF7F */  sq          $31, 0x0($29)
/* 05A9B8 0015A8B8 2846A070 */  paddub      $8, $5, $0
/* 05A9BC 0015A8BC 2C68050C */  jal         GetSeInfo__Fi
/* 05A9C0 0015A8C0 00000000 */   nop
/* 05A9C4 0015A8C4 283E4070 */  paddub      $7, $2, $0
/* 05A9C8 0015A8C8 0900E010 */  beqz        $7, .L0015A8F0
/* 05A9CC 0015A8CC 00000000 */   nop
/* 05A9D0 0015A8D0 8068050C */  jal         GetPortNo__Fi
/* 05A9D4 0015A8D4 00000000 */   nop
/* 05A9D8 0015A8D8 0000E680 */  lb          $6, 0x0($7)
/* 05A9DC 0015A8DC 0100E780 */  lb          $7, 0x1($7)
/* 05A9E0 0015A8E0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05A9E4 0015A8E4 282E4070 */  paddub      $5, $2, $0
/* 05A9E8 0015A8E8 BC16050C */  jal         SE_Stop__6CSoundFiiii
/* 05A9EC 0015A8EC 00000000 */   nop
.L0015A8F0:
/* 05A9F0 0015A8F0 0000BF7B */  lq          $31, 0x0($29)
/* 05A9F4 0015A8F4 1000BD27 */  addiu       $29, $29, 0x10
/* 05A9F8 0015A8F8 0800E003 */  jr          $31
/* 05A9FC 0015A8FC 00000000 */   nop
