.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AddDay__9CSaveDataFi
/* 057E10 00157D10 F0FFBD27 */  addiu       $29, $29, -0x10
/* 057E14 00157D14 0000BF7F */  sq          $31, 0x0($29)
/* 057E18 00157D18 D801828C */  lw          $2, 0x1D8($4)
/* 057E1C 00157D1C 21104500 */  addu        $2, $2, $5
/* 057E20 00157D20 D80182AC */  sw          $2, 0x1D8($4)
/* 057E24 00157D24 D801858C */  lw          $5, 0x1D8($4)
/* 057E28 00157D28 305F050C */  jal         SetDay__9CSaveDataFi
/* 057E2C 00157D2C 00000000 */   nop
/* 057E30 00157D30 0000BF7B */  lq          $31, 0x0($29)
/* 057E34 00157D34 1000BD27 */  addiu       $29, $29, 0x10
/* 057E38 00157D38 0800E003 */  jr          $31
/* 057E3C 00157D3C 00000000 */   nop
