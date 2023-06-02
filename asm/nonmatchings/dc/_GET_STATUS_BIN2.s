.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_STATUS_BIN2__FP12RS_STACKDATAi
/* E5E60 001E5D60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E5E64 001E5D64 0000BF7F */  sq         $31, 0x0($sp)
/* E5E68 001E5D68 E09C858F */  lw         $5, -0x6320($gp)
/* E5E6C 001E5D6C 9000A38C */  lw         $3, 0x90($5)
/* E5E70 001E5D70 80100300 */  sll        $2, $3, 2
/* E5E74 001E5D74 21184300 */  addu       $3, $2, $3
/* E5E78 001E5D78 80100300 */  sll        $2, $3, 2
/* E5E7C 001E5D7C 21106200 */  addu       $2, $3, $2
/* E5E80 001E5D80 00110200 */  sll        $2, $2, 4
/* E5E84 001E5D84 21104500 */  addu       $2, $2, $5
/* E5E88 001E5D88 0100013C */  lui        $at, (0x1E3E0 >> 16)
/* E5E8C 001E5D8C E0E32134 */  ori        $at, $at, (0x1E3E0 & 0xFFFF)
/* E5E90 001E5D90 21104100 */  addu       $2, $2, $at
/* E5E94 001E5D94 0000458C */  lw         $5, 0x0($2)
/* E5E98 001E5D98 000045AC */  sw         $5, 0x0($2)
/* E5E9C 001E5D9C B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E5EA0 001E5DA0 00000000 */   nop
/* E5EA4 001E5DA4 01000224 */  addiu      $2, $0, 0x1
/* E5EA8 001E5DA8 0000BF7B */  lq         $31, 0x0($sp)
/* E5EAC 001E5DAC 1000BD27 */  addiu      $sp, $sp, 0x10
/* E5EB0 001E5DB0 0800E003 */  jr         $31
/* E5EB4 001E5DB4 00000000 */   nop
/* E5EB8 001E5DB8 00000000 */  nop
/* E5EBC 001E5DBC 00000000 */  nop
