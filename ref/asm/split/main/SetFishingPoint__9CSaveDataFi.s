.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetFishingPoint__9CSaveDataFi
/* 057E80 00157D80 DC0185AC */  sw          $5, 0x1DC($4)
/* 057E84 00157D84 DC01838C */  lw          $3, 0x1DC($4)
/* 057E88 00157D88 10276128 */  slti        $1, $3, 0x2710
/* 057E8C 00157D8C 03002014 */  bnez        $1, .L00157D9C
/* 057E90 00157D90 00000000 */   nop
/* 057E94 00157D94 0F270324 */  addiu       $3, $0, 0x270F
/* 057E98 00157D98 DC0183AC */  sw          $3, 0x1DC($4)
.L00157D9C:
/* 057E9C 00157D9C DC01838C */  lw          $3, 0x1DC($4)
/* 057EA0 00157DA0 02006104 */  bgez        $3, .L00157DAC
/* 057EA4 00157DA4 00000000 */   nop
/* 057EA8 00157DA8 DC0180AC */  sw          $0, 0x1DC($4)
.L00157DAC:
/* 057EAC 00157DAC 0800E003 */  jr          $31
/* 057EB0 00157DB0 00000000 */   nop
/* 057EB4 00157DB4 00000000 */  nop
/* 057EB8 00157DB8 00000000 */  nop
/* 057EBC 00157DBC 00000000 */  nop
