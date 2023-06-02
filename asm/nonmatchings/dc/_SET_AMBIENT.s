.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_AMBIENT__FP12RS_STACKDATAi
/* 93850 00193750 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 93854 00193754 0000BF7F */  sq         $31, 0x0($sp)
/* 93858 00193758 01000224 */  addiu      $2, $0, 0x1
/* 9385C 0019375C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 93860 00193760 F0D422AC */  sw         $2, -0x2B10($at)
/* 93864 00193764 08008324 */  addiu      $3, $4, 0x8
/* 93868 00193768 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9386C 0019376C 00000000 */   nop
/* 93870 00193770 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 93874 00193774 80D520E4 */  swc1       $f0, -0x2A80($at)
/* 93878 00193778 28266070 */  paddub     $4, $3, $0
/* 9387C 0019377C 08008324 */  addiu      $3, $4, 0x8
/* 93880 00193780 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 93884 00193784 00000000 */   nop
/* 93888 00193788 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9388C 0019378C 84D520E4 */  swc1       $f0, -0x2A7C($at)
/* 93890 00193790 28266070 */  paddub     $4, $3, $0
/* 93894 00193794 08008324 */  addiu      $3, $4, 0x8
/* 93898 00193798 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9389C 0019379C 00000000 */   nop
/* 938A0 001937A0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 938A4 001937A4 88D520E4 */  swc1       $f0, -0x2A78($at)
/* 938A8 001937A8 0043023C */  lui        $2, (0x43000000 >> 16)
/* 938AC 001937AC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 938B0 001937B0 8CD522AC */  sw         $2, -0x2A74($at)
/* 938B4 001937B4 0400A128 */  slti       $at, $5, 0x4
/* 938B8 001937B8 06002014 */  bnez       $at, .L001937D4
/* 938BC 001937BC 00000000 */   nop
/* 938C0 001937C0 28266070 */  paddub     $4, $3, $0
/* 938C4 001937C4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 938C8 001937C8 00000000 */   nop
/* 938CC 001937CC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 938D0 001937D0 8CD520E4 */  swc1       $f0, -0x2A74($at)
.L001937D4:
/* 938D4 001937D4 01000224 */  addiu      $2, $0, 0x1
/* 938D8 001937D8 0000BF7B */  lq         $31, 0x0($sp)
/* 938DC 001937DC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 938E0 001937E0 0800E003 */  jr         $31
/* 938E4 001937E4 00000000 */   nop
/* 938E8 001937E8 00000000 */  nop
/* 938EC 001937EC 00000000 */  nop
