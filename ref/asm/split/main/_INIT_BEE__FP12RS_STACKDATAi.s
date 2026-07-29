.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _INIT_BEE__FP12RS_STACKDATAi
/* 0BD210 001BD110 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD214 001BD114 0000BF7F */  sq          $31, 0x0($29)
/* 0BD218 001BD118 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BD21C 001BD11C 00000000 */   nop
/* 0BD220 001BD120 D501013C */  lui         $1, %hi(BtEventInfo + 0x94)
/* 0BD224 001BD124 D46722AC */  sw          $2, %lo(BtEventInfo + 0x94)($1)
/* 0BD228 001BD128 D501013C */  lui         $1, %hi(BtEventInfo + 0x94)
/* 0BD22C 001BD12C D467238C */  lw          $3, %lo(BtEventInfo + 0x94)($1)
/* 0BD230 001BD130 40110300 */  sll         $2, $3, 5
/* 0BD234 001BD134 21184300 */  addu        $3, $2, $3
/* 0BD238 001BD138 80100300 */  sll         $2, $3, 2
/* 0BD23C 001BD13C 21106200 */  addu        $2, $3, $2
/* 0BD240 001BD140 40190200 */  sll         $3, $2, 5
/* 0BD244 001BD144 EB01023C */  lui         $2, %hi(NPCUnit + 0xBC)
/* 0BD248 001BD148 1C854224 */  addiu       $2, $2, %lo(NPCUnit + 0xBC)
/* 0BD24C 001BD14C 21104300 */  addu        $2, $2, $3
/* 0BD250 001BD150 0000448C */  lw          $4, 0x0($2)
/* 0BD254 001BD154 0F000524 */  addiu       $5, $0, 0xF
/* 0BD258 001BD158 0865070C */  jal         InitBee__FP6CFramei
/* 0BD25C 001BD15C 00000000 */   nop
/* 0BD260 001BD160 01000224 */  addiu       $2, $0, 0x1
/* 0BD264 001BD164 0000BF7B */  lq          $31, 0x0($29)
/* 0BD268 001BD168 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD26C 001BD16C 0800E003 */  jr          $31
/* 0BD270 001BD170 00000000 */   nop
/* 0BD274 001BD174 00000000 */  nop
/* 0BD278 001BD178 00000000 */  nop
/* 0BD27C 001BD17C 00000000 */  nop
