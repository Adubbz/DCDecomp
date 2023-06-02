.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_BIN2__FP12RS_STACKDATAi
/* E5C20 001E5B20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E5C24 001E5B24 1000BF7F */  sq         $31, 0x10($sp)
/* E5C28 001E5B28 0000B07F */  sq         $16, 0x0($sp)
/* E5C2C 001E5B2C E09C828F */  lw         $2, -0x6320($gp)
/* E5C30 001E5B30 9000508C */  lw         $16, 0x90($2)
/* E5C34 001E5B34 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E5C38 001E5B38 00000000 */   nop
/* E5C3C 001E5B3C E09C858F */  lw         $5, -0x6320($gp)
/* E5C40 001E5B40 80181000 */  sll        $3, $16, 2
/* E5C44 001E5B44 21207000 */  addu       $4, $3, $16
/* E5C48 001E5B48 80180400 */  sll        $3, $4, 2
/* E5C4C 001E5B4C 21188300 */  addu       $3, $4, $3
/* E5C50 001E5B50 00190300 */  sll        $3, $3, 4
/* E5C54 001E5B54 21186500 */  addu       $3, $3, $5
/* E5C58 001E5B58 0200013C */  lui        $at, (0x20000 >> 16)
/* E5C5C 001E5B5C 21086100 */  addu       $at, $3, $at
/* E5C60 001E5B60 E0E322AC */  sw         $2, -0x1C20($at)
/* E5C64 001E5B64 01000224 */  addiu      $2, $0, 0x1
/* E5C68 001E5B68 1000BF7B */  lq         $31, 0x10($sp)
/* E5C6C 001E5B6C 0000B07B */  lq         $16, 0x0($sp)
/* E5C70 001E5B70 2000BD27 */  addiu      $sp, $sp, 0x20
/* E5C74 001E5B74 0800E003 */  jr         $31
/* E5C78 001E5B78 00000000 */   nop
/* E5C7C 001E5B7C 00000000 */  nop
