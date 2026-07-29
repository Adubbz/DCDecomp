.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetMIniMapStatus__Fi
/* 0155C0 01DC12C0 01000324 */  addiu       $3, $0, 0x1
/* 0155C4 01DC12C4 0A008310 */  beq         $4, $3, .L01DC12F0_2FC8F0
/* 0155C8 01DC12C8 00000000 */   nop
/* 0155CC 01DC12CC 03008010 */  beqz        $4, .L01DC12DC_2FC8DC
/* 0155D0 01DC12D0 00000000 */   nop
/* 0155D4 01DC12D4 08000010 */  b           .L01DC12F8_2FC8F8
/* 0155D8 01DC12D8 00000000 */   nop
.L01DC12DC_2FC8DC:
/* 0155DC 01DC12DC C09D838F */  lw          $3, -0x6240($28)
/* 0155E0 01DC12E0 C49D83AF */  sw          $3, -0x623C($28)
/* 0155E4 01DC12E4 C09D80AF */  sw          $0, -0x6240($28)
/* 0155E8 01DC12E8 03000010 */  b           .L01DC12F8_2FC8F8
/* 0155EC 01DC12EC 00000000 */   nop
.L01DC12F0_2FC8F0:
/* 0155F0 01DC12F0 C49D838F */  lw          $3, -0x623C($28)
/* 0155F4 01DC12F4 C09D83AF */  sw          $3, -0x6240($28)
.L01DC12F8_2FC8F8:
/* 0155F8 01DC12F8 0800E003 */  jr          $31
/* 0155FC 01DC12FC 00000000 */   nop
