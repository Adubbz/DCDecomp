.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_REFERENCE__FP12RS_STACKDATAi
/* 0E6670 001E6570 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0E6674 001E6574 2000BF7F */  sq          $31, 0x20($29)
/* 0E6678 001E6578 1000B17F */  sq          $17, 0x10($29)
/* 0E667C 001E657C 0000B07F */  sq          $16, 0x0($29)
/* 0E6680 001E6580 E09C828F */  lw          $2, -0x6320($28)
/* 0E6684 001E6584 9000508C */  lw          $16, 0x90($2)
/* 0E6688 001E6588 08009124 */  addiu       $17, $4, 0x8
/* 0E668C 001E658C 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E6690 001E6590 00000000 */   nop
/* 0E6694 001E6594 282E4070 */  paddub      $5, $2, $0
/* 0E6698 001E6598 28262072 */  paddub      $4, $17, $0
/* 0E669C 001E659C B085070C */  jal         GetStackString__FP12RS_STACKDATA__3
/* 0E66A0 001E65A0 00000000 */   nop
/* 0E66A4 001E65A4 04004014 */  bnez        $2, .L001E65B8
/* 0E66A8 001E65A8 00000000 */   nop
/* 0E66AC 001E65AC 01000224 */  addiu       $2, $0, 0x1
/* 0E66B0 001E65B0 19000010 */  b           .L001E6618
/* 0E66B4 001E65B4 00000000 */   nop
.L001E65B8:
/* 0E66B8 001E65B8 E09C838F */  lw          $3, -0x6320($28)
/* 0E66BC 001E65BC 0100013C */  lui         $1, (0x1FD8C >> 16)
/* 0E66C0 001E65C0 8CFD2134 */  ori         $1, $1, (0x1FD8C & 0xFFFF)
/* 0E66C4 001E65C4 21306100 */  addu        $6, $3, $1
/* 0E66C8 001E65C8 10350424 */  addiu       $4, $0, 0x3510
/* 0E66CC 001E65CC 18180402 */  mult        $3, $16, $4
/* 0E66D0 001E65D0 2118C300 */  addu        $3, $6, $3
/* 0E66D4 001E65D4 0000708C */  lw          $16, 0x0($3)
/* 0E66D8 001E65D8 1818A470 */  mult1       $3, $5, $4
/* 0E66DC 001E65DC 2118C300 */  addu        $3, $6, $3
/* 0E66E0 001E65E0 0000648C */  lw          $4, 0x0($3)
/* 0E66E4 001E65E4 282E4070 */  paddub      $5, $2, $0
/* 0E66E8 001E65E8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0E66EC 001E65EC 00000000 */   nop
/* 0E66F0 001E65F0 04004014 */  bnez        $2, .L001E6604
/* 0E66F4 001E65F4 00000000 */   nop
/* 0E66F8 001E65F8 01000224 */  addiu       $2, $0, 0x1
/* 0E66FC 001E65FC 06000010 */  b           .L001E6618
/* 0E6700 001E6600 00000000 */   nop
.L001E6604:
/* 0E6704 001E6604 28260072 */  paddub      $4, $16, $0
/* 0E6708 001E6608 282E4070 */  paddub      $5, $2, $0
/* 0E670C 001E660C 60A0040C */  jal         SetReference__6CFrameFP6CFrame
/* 0E6710 001E6610 00000000 */   nop
/* 0E6714 001E6614 01000224 */  addiu       $2, $0, 0x1
.L001E6618:
/* 0E6718 001E6618 2000BF7B */  lq          $31, 0x20($29)
/* 0E671C 001E661C 1000B17B */  lq          $17, 0x10($29)
/* 0E6720 001E6620 0000B07B */  lq          $16, 0x0($29)
/* 0E6724 001E6624 3000BD27 */  addiu       $29, $29, 0x30
/* 0E6728 001E6628 0800E003 */  jr          $31
/* 0E672C 001E662C 00000000 */   nop
