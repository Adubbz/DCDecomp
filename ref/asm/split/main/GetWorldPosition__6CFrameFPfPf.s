.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetWorldPosition__6CFrameFPfPf
/* 028E60 00128D60 90FFBD27 */  addiu       $29, $29, -0x70
/* 028E64 00128D64 2000BF7F */  sq          $31, 0x20($29)
/* 028E68 00128D68 1000B17F */  sq          $17, 0x10($29)
/* 028E6C 00128D6C 0000B07F */  sq          $16, 0x0($29)
/* 028E70 00128D70 288EA070 */  paddub      $17, $5, $0
/* 028E74 00128D74 2886C070 */  paddub      $16, $6, $0
/* 028E78 00128D78 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 028E7C 00128D7C 0C00C2AC */  sw          $2, 0xC($6)
/* 028E80 00128D80 3000A527 */  addiu       $5, $29, 0x30
/* 028E84 00128D84 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 028E88 00128D88 00000000 */   nop
/* 028E8C 00128D8C 28262072 */  paddub      $4, $17, $0
/* 028E90 00128D90 3000A527 */  addiu       $5, $29, 0x30
/* 028E94 00128D94 28360072 */  paddub      $6, $16, $0
/* 028E98 00128D98 6285040C */  jal         sceVu0ApplyMatrix
/* 028E9C 00128D9C 00000000 */   nop
/* 028EA0 00128DA0 2000BF7B */  lq          $31, 0x20($29)
/* 028EA4 00128DA4 1000B17B */  lq          $17, 0x10($29)
/* 028EA8 00128DA8 0000B07B */  lq          $16, 0x0($29)
/* 028EAC 00128DAC 7000BD27 */  addiu       $29, $29, 0x70
/* 028EB0 00128DB0 0800E003 */  jr          $31
/* 028EB4 00128DB4 00000000 */   nop
/* 028EB8 00128DB8 00000000 */  nop
/* 028EBC 00128DBC 00000000 */  nop
