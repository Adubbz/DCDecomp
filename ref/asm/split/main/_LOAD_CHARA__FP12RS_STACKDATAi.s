.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_CHARA__FP12RS_STACKDATAi
/* 08C5D0 0018C4D0 60FFBD27 */  addiu       $29, $29, -0xA0
/* 08C5D4 0018C4D4 3000BF7F */  sq          $31, 0x30($29)
/* 08C5D8 0018C4D8 2000B27F */  sq          $18, 0x20($29)
/* 08C5DC 0018C4DC 1000B17F */  sq          $17, 0x10($29)
/* 08C5E0 0018C4E0 0000B07F */  sq          $16, 0x0($29)
/* 08C5E4 0018C4E4 08009224 */  addiu       $18, $4, 0x8
/* 08C5E8 0018C4E8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08C5EC 0018C4EC 00000000 */   nop
/* 08C5F0 0018C4F0 28864070 */  paddub      $16, $2, $0
/* 08C5F4 0018C4F4 FFFF0224 */  addiu       $2, $0, -0x1
/* 08C5F8 0018C4F8 2C000216 */  bne         $16, $2, .L0018C5AC
/* 08C5FC 0018C4FC 00000000 */   nop
/* 08C600 0018C500 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08C604 0018C504 1CD2308C */  lw          $16, %lo(EdEventInfo + 0x4C)($1)
/* 08C608 0018C508 28264072 */  paddub      $4, $18, $0
/* 08C60C 0018C50C F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 08C610 0018C510 00000000 */   nop
/* 08C614 0018C514 28364070 */  paddub      $6, $2, $0
/* 08C618 0018C518 0400C014 */  bnez        $6, .L0018C52C
/* 08C61C 0018C51C 00000000 */   nop
/* 08C620 0018C520 28160070 */  paddub      $2, $0, $0
/* 08C624 0018C524 73000010 */  b           .L0018C6F4
/* 08C628 0018C528 00000000 */   nop
.L0018C52C:
/* 08C62C 0018C52C A830060C */  jal         get_pack_file__Fv
/* 08C630 0018C530 00000000 */   nop
/* 08C634 0018C534 282E4070 */  paddub      $5, $2, $0
/* 08C638 0018C538 0400A014 */  bnez        $5, .L0018C54C
/* 08C63C 0018C53C 00000000 */   nop
/* 08C640 0018C540 28160070 */  paddub      $2, $0, $0
/* 08C644 0018C544 6B000010 */  b           .L0018C6F4
/* 08C648 0018C548 00000000 */   nop
.L0018C54C:
/* 08C64C 0018C54C B030060C */  jal         get_buffer__Fv
/* 08C650 0018C550 00000000 */   nop
/* 08C654 0018C554 283E4070 */  paddub      $7, $2, $0
/* 08C658 0018C558 B030060C */  jal         get_buffer__Fv
/* 08C65C 0018C55C 00000000 */   nop
/* 08C660 0018C560 28260072 */  paddub      $4, $16, $0
/* 08C664 0018C564 D401013C */  lui         $1, %hi(EdEventInfo + 0x70)
/* 08C668 0018C568 40D2288C */  lw          $8, %lo(EdEventInfo + 0x70)($1)
/* 08C66C 0018C56C 284E4070 */  paddub      $9, $2, $0
/* 08C670 0018C570 28560070 */  paddub      $10, $0, $0
/* 08C674 0018C574 A000198E */  lw          $25, 0xA0($16)
/* 08C678 0018C578 BC00398F */  lw          $25, 0xBC($25)
/* 08C67C 0018C57C 09F82003 */  jalr        $25
/* 08C680 0018C580 00000000 */   nop
/* 08C684 0018C584 28260072 */  paddub      $4, $16, $0
/* 08C688 0018C588 D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 08C68C 0018C58C 10D2258C */  lw          $5, %lo(EdEventInfo + 0x40)($1)
/* 08C690 0018C590 DCE0040C */  jal         SetMotionCamera__10CCharacterFP7CCamera
/* 08C694 0018C594 00000000 */   nop
/* 08C698 0018C598 0829060C */  jal         PrintMemory__Fv
/* 08C69C 0018C59C 00000000 */   nop
/* 08C6A0 0018C5A0 01000224 */  addiu       $2, $0, 0x1
/* 08C6A4 0018C5A4 53000010 */  b           .L0018C6F4
/* 08C6A8 0018C5A8 00000000 */   nop
.L0018C5AC:
/* 08C6AC 0018C5AC 28260072 */  paddub      $4, $16, $0
/* 08C6B0 0018C5B0 702C060C */  jal         GetNPC__Fi
/* 08C6B4 0018C5B4 00000000 */   nop
/* 08C6B8 0018C5B8 288E4070 */  paddub      $17, $2, $0
/* 08C6BC 0018C5BC 04002016 */  bnez        $17, .L0018C5D0
/* 08C6C0 0018C5C0 00000000 */   nop
/* 08C6C4 0018C5C4 28160070 */  paddub      $2, $0, $0
/* 08C6C8 0018C5C8 4A000010 */  b           .L0018C6F4
/* 08C6CC 0018C5CC 00000000 */   nop
.L0018C5D0:
/* 08C6D0 0018C5D0 28264072 */  paddub      $4, $18, $0
/* 08C6D4 0018C5D4 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 08C6D8 0018C5D8 00000000 */   nop
/* 08C6DC 0018C5DC 28364070 */  paddub      $6, $2, $0
/* 08C6E0 0018C5E0 0400C014 */  bnez        $6, .L0018C5F4
/* 08C6E4 0018C5E4 00000000 */   nop
/* 08C6E8 0018C5E8 28160070 */  paddub      $2, $0, $0
/* 08C6EC 0018C5EC 41000010 */  b           .L0018C6F4
/* 08C6F0 0018C5F0 00000000 */   nop
.L0018C5F4:
/* 08C6F4 0018C5F4 A830060C */  jal         get_pack_file__Fv
/* 08C6F8 0018C5F8 00000000 */   nop
/* 08C6FC 0018C5FC 282E4070 */  paddub      $5, $2, $0
/* 08C700 0018C600 0400A014 */  bnez        $5, .L0018C614
/* 08C704 0018C604 00000000 */   nop
/* 08C708 0018C608 28160070 */  paddub      $2, $0, $0
/* 08C70C 0018C60C 39000010 */  b           .L0018C6F4
/* 08C710 0018C610 00000000 */   nop
.L0018C614:
/* 08C714 0018C614 B030060C */  jal         get_buffer__Fv
/* 08C718 0018C618 00000000 */   nop
/* 08C71C 0018C61C 283E4070 */  paddub      $7, $2, $0
/* 08C720 0018C620 B030060C */  jal         get_buffer__Fv
/* 08C724 0018C624 00000000 */   nop
/* 08C728 0018C628 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F4)
/* 08C72C 0018C62C C4D3238C */  lw          $3, %lo(EdEventInfo + 0x1F4)($1)
/* 08C730 0018C630 21407000 */  addu        $8, $3, $16
/* 08C734 0018C634 28262072 */  paddub      $4, $17, $0
/* 08C738 0018C638 284E4070 */  paddub      $9, $2, $0
/* 08C73C 0018C63C 28560070 */  paddub      $10, $0, $0
/* 08C740 0018C640 A000398E */  lw          $25, 0xA0($17)
/* 08C744 0018C644 BC00398F */  lw          $25, 0xBC($25)
/* 08C748 0018C648 09F82003 */  jalr        $25
/* 08C74C 0018C64C 00000000 */   nop
/* 08C750 0018C650 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F4)
/* 08C754 0018C654 C4D3228C */  lw          $2, %lo(EdEventInfo + 0x1F4)($1)
/* 08C758 0018C658 21105000 */  addu        $2, $2, $16
/* 08C75C 0018C65C 8C1422AE */  sw          $2, 0x148C($17)
/* 08C760 0018C660 01000224 */  addiu       $2, $0, 0x1
/* 08C764 0018C664 6C1422AE */  sw          $2, 0x146C($17)
/* 08C768 0018C668 701422AE */  sw          $2, 0x1470($17)
/* 08C76C 0018C66C 741422AE */  sw          $2, 0x1474($17)
/* 08C770 0018C670 0043023C */  lui         $2, (0x43000000 >> 16)
/* 08C774 0018C674 EC0C22AE */  sw          $2, 0xCEC($17)
/* 08C778 0018C678 4000A427 */  addiu       $4, $29, 0x40
/* 08C77C 0018C67C 509F040C */  jal         __ct__10CFrameAttrFv
/* 08C780 0018C680 00000000 */   nop
/* 08C784 0018C684 4800A0A3 */  sb          $0, 0x48($29)
/* 08C788 0018C688 01000324 */  addiu       $3, $0, 0x1
/* 08C78C 0018C68C 4C00A3A3 */  sb          $3, 0x4C($29)
/* 08C790 0018C690 80201000 */  sll         $4, $16, 2
/* 08C794 0018C694 D401023C */  lui         $2, %hi(EdEventInfo + 0xB4)
/* 08C798 0018C698 84D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xB4)
/* 08C79C 0018C69C 21104400 */  addu        $2, $2, $4
/* 08C7A0 0018C6A0 000043AC */  sw          $3, 0x0($2)
/* 08C7A4 0018C6A4 D401023C */  lui         $2, %hi(EdEventInfo + 0xF4)
/* 08C7A8 0018C6A8 C4D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xF4)
/* 08C7AC 0018C6AC 21104400 */  addu        $2, $2, $4
/* 08C7B0 0018C6B0 000043AC */  sw          $3, 0x0($2)
/* 08C7B4 0018C6B4 28262072 */  paddub      $4, $17, $0
/* 08C7B8 0018C6B8 D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 08C7BC 0018C6BC 10D2258C */  lw          $5, %lo(EdEventInfo + 0x40)($1)
/* 08C7C0 0018C6C0 DCE0040C */  jal         SetMotionCamera__10CCharacterFP7CCamera
/* 08C7C4 0018C6C4 00000000 */   nop
/* 08C7C8 0018C6C8 BC00248E */  lw          $4, 0xBC($17)
/* 08C7CC 0018C6CC 06008010 */  beqz        $4, .L0018C6E8
/* 08C7D0 0018C6D0 00000000 */   nop
/* 08C7D4 0018C6D4 4000A527 */  addiu       $5, $29, 0x40
/* 08C7D8 0018C6D8 01000624 */  addiu       $6, $0, 0x1
/* 08C7DC 0018C6DC 04000724 */  addiu       $7, $0, 0x4
/* 08C7E0 0018C6E0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 08C7E4 0018C6E4 00000000 */   nop
.L0018C6E8:
/* 08C7E8 0018C6E8 0829060C */  jal         PrintMemory__Fv
/* 08C7EC 0018C6EC 00000000 */   nop
/* 08C7F0 0018C6F0 01000224 */  addiu       $2, $0, 0x1
.L0018C6F4:
/* 08C7F4 0018C6F4 3000BF7B */  lq          $31, 0x30($29)
/* 08C7F8 0018C6F8 2000B27B */  lq          $18, 0x20($29)
/* 08C7FC 0018C6FC 1000B17B */  lq          $17, 0x10($29)
/* 08C800 0018C700 0000B07B */  lq          $16, 0x0($29)
/* 08C804 0018C704 A000BD27 */  addiu       $29, $29, 0xA0
/* 08C808 0018C708 0800E003 */  jr          $31
/* 08C80C 0018C70C 00000000 */   nop
