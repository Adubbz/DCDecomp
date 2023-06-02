.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_SET_DEAD__FP12RS_STACKDATAi
/* E2F30 001E2E30 E09C858F */  lw         $5, -0x6320($gp)
/* E2F34 001E2E34 9000A38C */  lw         $3, 0x90($5)
/* E2F38 001E2E38 FFFF0424 */  addiu      $4, $0, -0x1
/* E2F3C 001E2E3C 80100300 */  sll        $2, $3, 2
/* E2F40 001E2E40 21184300 */  addu       $3, $2, $3
/* E2F44 001E2E44 80100300 */  sll        $2, $3, 2
/* E2F48 001E2E48 21106200 */  addu       $2, $3, $2
/* E2F4C 001E2E4C 00110200 */  sll        $2, $2, 4
/* E2F50 001E2E50 21104500 */  addu       $2, $2, $5
/* E2F54 001E2E54 0200013C */  lui        $at, (0x20000 >> 16)
/* E2F58 001E2E58 21084100 */  addu       $at, $2, $at
/* E2F5C 001E2E5C D0E324AC */  sw         $4, -0x1C30($at)
/* E2F60 001E2E60 E09C838F */  lw         $3, -0x6320($gp)
/* E2F64 001E2E64 4C00628C */  lw         $2, 0x4C($3)
/* E2F68 001E2E68 FFFF4224 */  addiu      $2, $2, -0x1
/* E2F6C 001E2E6C 4C0062AC */  sw         $2, 0x4C($3)
/* E2F70 001E2E70 01000224 */  addiu      $2, $0, 0x1
/* E2F74 001E2E74 0800E003 */  jr         $31
/* E2F78 001E2E78 00000000 */   nop
/* E2F7C 001E2E7C 00000000 */  nop
