.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MOTION_CHANGE_STEP__FP12RS_STACKDATAi
/* E58C0 001E57C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E58C4 001E57C4 0000BF7F */  sq         $31, 0x0($sp)
/* E58C8 001E57C8 E09C828F */  lw         $2, -0x6320($gp)
/* E58CC 001E57CC 9000458C */  lw         $5, 0x90($2)
/* E58D0 001E57D0 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E58D4 001E57D4 00000000 */   nop
/* E58D8 001E57D8 E09C838F */  lw         $3, -0x6320($gp)
/* E58DC 001E57DC 10350224 */  addiu      $2, $0, 0x3510
/* E58E0 001E57E0 1830A200 */  mult       $6, $5, $2
/* E58E4 001E57E4 2110C300 */  addu       $2, $6, $3
/* E58E8 001E57E8 0200013C */  lui        $at, (0x20000 >> 16)
/* E58EC 001E57EC 21084100 */  addu       $at, $2, $at
/* E58F0 001E57F0 C8FF20E4 */  swc1       $f0, -0x38($at)
/* E58F4 001E57F4 28260070 */  paddub     $4, $0, $0
/* E58F8 001E57F8 09000010 */  b          .L001E5820
/* E58FC 001E57FC 00000000 */   nop
.L001E5800:
/* E5900 001E5800 2118C700 */  addu       $3, $6, $7
/* E5904 001E5804 B0110224 */  addiu      $2, $0, 0x11B0
/* E5908 001E5808 18108200 */  mult       $2, $4, $2
/* E590C 001E580C 21104300 */  addu       $2, $2, $3
/* E5910 001E5810 0200013C */  lui        $at, (0x21178 >> 16)
/* E5914 001E5814 21084100 */  addu       $at, $2, $at
/* E5918 001E5818 781120E4 */  swc1       $f0, (0x21178 & 0xFFFF)($at)
/* E591C 001E581C 01008424 */  addiu      $4, $4, 0x1
.L001E5820:
/* E5920 001E5820 E09C878F */  lw         $7, -0x6320($gp)
/* E5924 001E5824 80100500 */  sll        $2, $5, 2
/* E5928 001E5828 21184500 */  addu       $3, $2, $5
/* E592C 001E582C 80100300 */  sll        $2, $3, 2
/* E5930 001E5830 21106200 */  addu       $2, $3, $2
/* E5934 001E5834 00110200 */  sll        $2, $2, 4
/* E5938 001E5838 21104700 */  addu       $2, $2, $7
/* E593C 001E583C 0200013C */  lui        $at, (0x20000 >> 16)
/* E5940 001E5840 21084100 */  addu       $at, $2, $at
/* E5944 001E5844 84E42284 */  lh         $2, -0x1B7C($at)
/* E5948 001E5848 2A108200 */  slt        $2, $4, $2
/* E594C 001E584C ECFF4014 */  bnez       $2, .L001E5800
/* E5950 001E5850 00000000 */   nop
/* E5954 001E5854 01000224 */  addiu      $2, $0, 0x1
/* E5958 001E5858 0000BF7B */  lq         $31, 0x0($sp)
/* E595C 001E585C 1000BD27 */  addiu      $sp, $sp, 0x10
/* E5960 001E5860 0800E003 */  jr         $31
/* E5964 001E5864 00000000 */   nop
/* E5968 001E5868 00000000 */  nop
/* E596C 001E586C 00000000 */  nop