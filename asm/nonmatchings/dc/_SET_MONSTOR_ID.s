.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MONSTOR_ID__FP12RS_STACKDATAi
/* BC730 001BC630 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* BC734 001BC634 4000BF7F */  sq         $31, 0x40($sp)
/* BC738 001BC638 3000B37F */  sq         $19, 0x30($sp)
/* BC73C 001BC63C 2000B27F */  sq         $18, 0x20($sp)
/* BC740 001BC640 1000B17F */  sq         $17, 0x10($sp)
/* BC744 001BC644 0000B07F */  sq         $16, 0x0($sp)
/* BC748 001BC648 2896A070 */  paddub     $18, $5, $0
/* BC74C 001BC64C 08009324 */  addiu      $19, $4, 0x8
/* BC750 001BC650 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC754 001BC654 00000000 */   nop
/* BC758 001BC658 28864070 */  paddub     $16, $2, $0
/* BC75C 001BC65C FFFF1124 */  addiu      $17, $0, -0x1
/* BC760 001BC660 02000224 */  addiu      $2, $0, 0x2
/* BC764 001BC664 0E004216 */  bne        $18, $2, .L001BC6A0
/* BC768 001BC668 00000000 */   nop
/* BC76C 001BC66C 28266072 */  paddub     $4, $19, $0
/* BC770 001BC670 08009324 */  addiu      $19, $4, 0x8
/* BC774 001BC674 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC778 001BC678 00000000 */   nop
/* BC77C 001BC67C 08004010 */  beqz       $2, .L001BC6A0
/* BC780 001BC680 00000000 */   nop
/* BC784 001BC684 28260070 */  paddub     $4, $0, $0
/* BC788 001BC688 CCE4760C */  jal        func_1DB9330
/* BC78C 001BC68C 00000000 */   nop
/* BC790 001BC690 E09C848F */  lw         $4, -0x6320($gp)
/* BC794 001BC694 282E0070 */  paddub     $5, $0, $0
/* BC798 001BC698 7C7E070C */  jal        CleanViewMonstor__12CMonstorUnitFi
/* BC79C 001BC69C 00000000 */   nop
.L001BC6A0:
/* BC7A0 001BC6A0 05000224 */  addiu      $2, $0, 0x5
/* BC7A4 001BC6A4 1E004216 */  bne        $18, $2, .L001BC720
/* BC7A8 001BC6A8 00000000 */   nop
/* BC7AC 001BC6AC 28266072 */  paddub     $4, $19, $0
/* BC7B0 001BC6B0 08009324 */  addiu      $19, $4, 0x8
/* BC7B4 001BC6B4 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC7B8 001BC6B8 00000000 */   nop
/* BC7BC 001BC6BC 281E4070 */  paddub     $3, $2, $0
/* BC7C0 001BC6C0 28266072 */  paddub     $4, $19, $0
/* BC7C4 001BC6C4 08009324 */  addiu      $19, $4, 0x8
/* BC7C8 001BC6C8 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BC7CC 001BC6CC 00000000 */   nop
/* BC7D0 001BC6D0 5000A0E7 */  swc1       $f0, 0x50($sp)
/* BC7D4 001BC6D4 28266072 */  paddub     $4, $19, $0
/* BC7D8 001BC6D8 08009324 */  addiu      $19, $4, 0x8
/* BC7DC 001BC6DC 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BC7E0 001BC6E0 00000000 */   nop
/* BC7E4 001BC6E4 5400A0E7 */  swc1       $f0, 0x54($sp)
/* BC7E8 001BC6E8 28266072 */  paddub     $4, $19, $0
/* BC7EC 001BC6EC 08009324 */  addiu      $19, $4, 0x8
/* BC7F0 001BC6F0 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BC7F4 001BC6F4 00000000 */   nop
/* BC7F8 001BC6F8 5800A0E7 */  swc1       $f0, 0x58($sp)
/* BC7FC 001BC6FC 08006010 */  beqz       $3, .L001BC720
/* BC800 001BC700 00000000 */   nop
/* BC804 001BC704 28260070 */  paddub     $4, $0, $0
/* BC808 001BC708 CCE4760C */  jal        func_1DB9330
/* BC80C 001BC70C 00000000 */   nop
/* BC810 001BC710 E09C848F */  lw         $4, -0x6320($gp)
/* BC814 001BC714 282E0070 */  paddub     $5, $0, $0
/* BC818 001BC718 7C7E070C */  jal        CleanViewMonstor__12CMonstorUnitFi
/* BC81C 001BC71C 00000000 */   nop
.L001BC720:
/* BC820 001BC720 06000224 */  addiu      $2, $0, 0x6
/* BC824 001BC724 22004216 */  bne        $18, $2, .L001BC7B0
/* BC828 001BC728 00000000 */   nop
/* BC82C 001BC72C 28266072 */  paddub     $4, $19, $0
/* BC830 001BC730 08009324 */  addiu      $19, $4, 0x8
/* BC834 001BC734 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC838 001BC738 00000000 */   nop
/* BC83C 001BC73C 28964070 */  paddub     $18, $2, $0
/* BC840 001BC740 28266072 */  paddub     $4, $19, $0
/* BC844 001BC744 08009324 */  addiu      $19, $4, 0x8
/* BC848 001BC748 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BC84C 001BC74C 00000000 */   nop
/* BC850 001BC750 5000A0E7 */  swc1       $f0, 0x50($sp)
/* BC854 001BC754 28266072 */  paddub     $4, $19, $0
/* BC858 001BC758 08009324 */  addiu      $19, $4, 0x8
/* BC85C 001BC75C 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BC860 001BC760 00000000 */   nop
/* BC864 001BC764 5400A0E7 */  swc1       $f0, 0x54($sp)
/* BC868 001BC768 28266072 */  paddub     $4, $19, $0
/* BC86C 001BC76C 08009324 */  addiu      $19, $4, 0x8
/* BC870 001BC770 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BC874 001BC774 00000000 */   nop
/* BC878 001BC778 5800A0E7 */  swc1       $f0, 0x58($sp)
/* BC87C 001BC77C 28266072 */  paddub     $4, $19, $0
/* BC880 001BC780 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC884 001BC784 00000000 */   nop
/* BC888 001BC788 288E4070 */  paddub     $17, $2, $0
/* BC88C 001BC78C 08004012 */  beqz       $18, .L001BC7B0
/* BC890 001BC790 00000000 */   nop
/* BC894 001BC794 28260070 */  paddub     $4, $0, $0
/* BC898 001BC798 CCE4760C */  jal        func_1DB9330
/* BC89C 001BC79C 00000000 */   nop
/* BC8A0 001BC7A0 E09C848F */  lw         $4, -0x6320($gp)
/* BC8A4 001BC7A4 282E0070 */  paddub     $5, $0, $0
/* BC8A8 001BC7A8 7C7E070C */  jal        CleanViewMonstor__12CMonstorUnitFi
/* BC8AC 001BC7AC 00000000 */   nop
.L001BC7B0:
/* BC8B0 001BC7B0 E09C848F */  lw         $4, -0x6320($gp)
/* BC8B4 001BC7B4 282E0072 */  paddub     $5, $16, $0
/* BC8B8 001BC7B8 5000A627 */  addiu      $6, $sp, 0x50
/* BC8BC 001BC7BC 283E2072 */  paddub     $7, $17, $0
/* BC8C0 001BC7C0 AC80070C */  jal        SetupViewMonstor__12CMonstorUnitFiPfi
/* BC8C4 001BC7C4 00000000 */   nop
/* BC8C8 001BC7C8 01000224 */  addiu      $2, $0, 0x1
/* BC8CC 001BC7CC 4000BF7B */  lq         $31, 0x40($sp)
/* BC8D0 001BC7D0 3000B37B */  lq         $19, 0x30($sp)
/* BC8D4 001BC7D4 2000B27B */  lq         $18, 0x20($sp)
/* BC8D8 001BC7D8 1000B17B */  lq         $17, 0x10($sp)
/* BC8DC 001BC7DC 0000B07B */  lq         $16, 0x0($sp)
/* BC8E0 001BC7E0 6000BD27 */  addiu      $sp, $sp, 0x60
/* BC8E4 001BC7E4 0800E003 */  jr         $31
/* BC8E8 001BC7E8 00000000 */   nop
/* BC8EC 001BC7EC 00000000 */  nop
