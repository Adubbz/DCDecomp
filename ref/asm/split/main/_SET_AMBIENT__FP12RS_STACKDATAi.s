.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_AMBIENT__FP12RS_STACKDATAi
/* 093850 00193750 F0FFBD27 */  addiu       $29, $29, -0x10
/* 093854 00193754 0000BF7F */  sq          $31, 0x0($29)
/* 093858 00193758 01000224 */  addiu       $2, $0, 0x1
/* 09385C 0019375C D401013C */  lui         $1, %hi(EdEventInfo + 0x320)
/* 093860 00193760 F0D422AC */  sw          $2, %lo(EdEventInfo + 0x320)($1)
/* 093864 00193764 08008324 */  addiu       $3, $4, 0x8
/* 093868 00193768 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 09386C 0019376C 00000000 */   nop
/* 093870 00193770 D401013C */  lui         $1, %hi(EdEventInfo + 0x3B0)
/* 093874 00193774 80D520E4 */  swc1        $f0, %lo(EdEventInfo + 0x3B0)($1)
/* 093878 00193778 28266070 */  paddub      $4, $3, $0
/* 09387C 0019377C 08008324 */  addiu       $3, $4, 0x8
/* 093880 00193780 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 093884 00193784 00000000 */   nop
/* 093888 00193788 D401013C */  lui         $1, %hi(EdEventInfo + 0x3B4)
/* 09388C 0019378C 84D520E4 */  swc1        $f0, %lo(EdEventInfo + 0x3B4)($1)
/* 093890 00193790 28266070 */  paddub      $4, $3, $0
/* 093894 00193794 08008324 */  addiu       $3, $4, 0x8
/* 093898 00193798 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 09389C 0019379C 00000000 */   nop
/* 0938A0 001937A0 D401013C */  lui         $1, %hi(EdEventInfo + 0x3B8)
/* 0938A4 001937A4 88D520E4 */  swc1        $f0, %lo(EdEventInfo + 0x3B8)($1)
/* 0938A8 001937A8 0043023C */  lui         $2, (0x43000000 >> 16)
/* 0938AC 001937AC D401013C */  lui         $1, %hi(EdEventInfo + 0x3BC)
/* 0938B0 001937B0 8CD522AC */  sw          $2, %lo(EdEventInfo + 0x3BC)($1)
/* 0938B4 001937B4 0400A128 */  slti        $1, $5, 0x4
/* 0938B8 001937B8 06002014 */  bnez        $1, .L001937D4
/* 0938BC 001937BC 00000000 */   nop
/* 0938C0 001937C0 28266070 */  paddub      $4, $3, $0
/* 0938C4 001937C4 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 0938C8 001937C8 00000000 */   nop
/* 0938CC 001937CC D401013C */  lui         $1, %hi(EdEventInfo + 0x3BC)
/* 0938D0 001937D0 8CD520E4 */  swc1        $f0, %lo(EdEventInfo + 0x3BC)($1)
.L001937D4:
/* 0938D4 001937D4 01000224 */  addiu       $2, $0, 0x1
/* 0938D8 001937D8 0000BF7B */  lq          $31, 0x0($29)
/* 0938DC 001937DC 1000BD27 */  addiu       $29, $29, 0x10
/* 0938E0 001937E0 0800E003 */  jr          $31
/* 0938E4 001937E4 00000000 */   nop
/* 0938E8 001937E8 00000000 */  nop
/* 0938EC 001937EC 00000000 */  nop
