.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_IBOX__FP12RS_STACKDATAi
/* BCA00 001BC900 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* BCA04 001BC904 0000BF7F */  sq         $31, 0x0($sp)
/* BCA08 001BC908 08008324 */  addiu      $3, $4, 0x8
/* BCA0C 001BC90C 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BCA10 001BC910 00000000 */   nop
/* BCA14 001BC914 1000A0E7 */  swc1       $f0, 0x10($sp)
/* BCA18 001BC918 28266070 */  paddub     $4, $3, $0
/* BCA1C 001BC91C 08008324 */  addiu      $3, $4, 0x8
/* BCA20 001BC920 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BCA24 001BC924 00000000 */   nop
/* BCA28 001BC928 1400A0E7 */  swc1       $f0, 0x14($sp)
/* BCA2C 001BC92C 28266070 */  paddub     $4, $3, $0
/* BCA30 001BC930 08008324 */  addiu      $3, $4, 0x8
/* BCA34 001BC934 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BCA38 001BC938 00000000 */   nop
/* BCA3C 001BC93C 1800A0E7 */  swc1       $f0, 0x18($sp)
/* BCA40 001BC940 803F023C */  lui        $2, (0x3F800000 >> 16)
/* BCA44 001BC944 1C00A2AF */  sw         $2, 0x1C($sp)
/* BCA48 001BC948 28266070 */  paddub     $4, $3, $0
/* BCA4C 001BC94C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCA50 001BC950 00000000 */   nop
/* BCA54 001BC954 C89C848F */  lw         $4, -0x6338($gp)
/* BCA58 001BC958 1000A527 */  addiu      $5, $sp, 0x10
/* BCA5C 001BC95C 28364070 */  paddub     $6, $2, $0
/* BCA60 001BC960 01000724 */  addiu      $7, $0, 0x1
/* BCA64 001BC964 28460070 */  paddub     $8, $0, $0
/* BCA68 001BC968 9020070C */  jal        SetTreasureBox__11CDungeonMapFPfiii
/* BCA6C 001BC96C 00000000 */   nop
/* BCA70 001BC970 01000224 */  addiu      $2, $0, 0x1
/* BCA74 001BC974 0000BF7B */  lq         $31, 0x0($sp)
/* BCA78 001BC978 2000BD27 */  addiu      $sp, $sp, 0x20
/* BCA7C 001BC97C 0800E003 */  jr         $31
/* BCA80 001BC980 00000000 */   nop
/* BCA84 001BC984 00000000 */  nop
/* BCA88 001BC988 00000000 */  nop
/* BCA8C 001BC98C 00000000 */  nop
