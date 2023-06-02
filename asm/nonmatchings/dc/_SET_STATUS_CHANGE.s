.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_STATUS_CHANGE__FP12RS_STACKDATAi
/* E5C80 001E5B80 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* E5C84 001E5B84 3000BF7F */  sq         $31, 0x30($sp)
/* E5C88 001E5B88 2000B27F */  sq         $18, 0x20($sp)
/* E5C8C 001E5B8C 1000B17F */  sq         $17, 0x10($sp)
/* E5C90 001E5B90 0000B07F */  sq         $16, 0x0($sp)
/* E5C94 001E5B94 08009224 */  addiu      $18, $4, 0x8
/* E5C98 001E5B98 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E5C9C 001E5B9C 00000000 */   nop
/* E5CA0 001E5BA0 28864070 */  paddub     $16, $2, $0
/* E5CA4 001E5BA4 28264072 */  paddub     $4, $18, $0
/* E5CA8 001E5BA8 08009224 */  addiu      $18, $4, 0x8
/* E5CAC 001E5BAC 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E5CB0 001E5BB0 00000000 */   nop
/* E5CB4 001E5BB4 288E4070 */  paddub     $17, $2, $0
/* E5CB8 001E5BB8 28264072 */  paddub     $4, $18, $0
/* E5CBC 001E5BBC 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E5CC0 001E5BC0 00000000 */   nop
/* E5CC4 001E5BC4 04004004 */  bltz       $2, .L001E5BD8
/* E5CC8 001E5BC8 00000000 */   nop
/* E5CCC 001E5BCC 10004128 */  slti       $at, $2, 0x10
/* E5CD0 001E5BD0 04002014 */  bnez       $at, .L001E5BE4
/* E5CD4 001E5BD4 00000000 */   nop
.L001E5BD8:
/* E5CD8 001E5BD8 01000224 */  addiu      $2, $0, 0x1
/* E5CDC 001E5BDC 14000010 */  b          .L001E5C30
/* E5CE0 001E5BE0 00000000 */   nop
.L001E5BE4:
/* E5CE4 001E5BE4 04000006 */  bltz       $16, .L001E5BF8
/* E5CE8 001E5BE8 00000000 */   nop
/* E5CEC 001E5BEC 0500012A */  slti       $at, $16, 0x5
/* E5CF0 001E5BF0 02002014 */  bnez       $at, .L001E5BFC
/* E5CF4 001E5BF4 00000000 */   nop
.L001E5BF8:
/* E5CF8 001E5BF8 28860070 */  paddub     $16, $0, $0
.L001E5BFC:
/* E5CFC 001E5BFC E09C848F */  lw         $4, -0x6320($gp)
/* E5D00 001E5C00 80180200 */  sll        $3, $2, 2
/* E5D04 001E5C04 21186200 */  addu       $3, $3, $2
/* E5D08 001E5C08 80100300 */  sll        $2, $3, 2
/* E5D0C 001E5C0C 21106200 */  addu       $2, $3, $2
/* E5D10 001E5C10 00110200 */  sll        $2, $2, 4
/* E5D14 001E5C14 21184400 */  addu       $3, $2, $4
/* E5D18 001E5C18 40101000 */  sll        $2, $16, 1
/* E5D1C 001E5C1C 21104300 */  addu       $2, $2, $3
/* E5D20 001E5C20 0200013C */  lui        $at, (0x20000 >> 16)
/* E5D24 001E5C24 21084100 */  addu       $at, $2, $at
/* E5D28 001E5C28 FAE331A4 */  sh         $17, -0x1C06($at)
/* E5D2C 001E5C2C 01000224 */  addiu      $2, $0, 0x1
.L001E5C30:
/* E5D30 001E5C30 3000BF7B */  lq         $31, 0x30($sp)
/* E5D34 001E5C34 2000B27B */  lq         $18, 0x20($sp)
/* E5D38 001E5C38 1000B17B */  lq         $17, 0x10($sp)
/* E5D3C 001E5C3C 0000B07B */  lq         $16, 0x0($sp)
/* E5D40 001E5C40 4000BD27 */  addiu      $sp, $sp, 0x40
/* E5D44 001E5C44 0800E003 */  jr         $31
/* E5D48 001E5C48 00000000 */   nop
/* E5D4C 001E5C4C 00000000 */  nop
