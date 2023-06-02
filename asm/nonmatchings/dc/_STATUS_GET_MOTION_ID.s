.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_GET_MOTION_ID__FP12RS_STACKDATAi
/* E36B0 001E35B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E36B4 001E35B4 0000BF7F */  sq         $31, 0x0($sp)
/* E36B8 001E35B8 E09C858F */  lw         $5, -0x6320($gp)
/* E36BC 001E35BC 9000A38C */  lw         $3, 0x90($5)
/* E36C0 001E35C0 10350224 */  addiu      $2, $0, 0x3510
/* E36C4 001E35C4 18106200 */  mult       $2, $3, $2
/* E36C8 001E35C8 21104500 */  addu       $2, $2, $5
/* E36CC 001E35CC 0200013C */  lui        $at, (0x20938 >> 16)
/* E36D0 001E35D0 21084100 */  addu       $at, $2, $at
/* E36D4 001E35D4 3809258C */  lw         $5, (0x20938 & 0xFFFF)($at)
/* E36D8 001E35D8 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E36DC 001E35DC 00000000 */   nop
/* E36E0 001E35E0 01000224 */  addiu      $2, $0, 0x1
/* E36E4 001E35E4 0000BF7B */  lq         $31, 0x0($sp)
/* E36E8 001E35E8 1000BD27 */  addiu      $sp, $sp, 0x10
/* E36EC 001E35EC 0800E003 */  jr         $31
/* E36F0 001E35F0 00000000 */   nop
/* E36F4 001E35F4 00000000 */  nop
/* E36F8 001E35F8 00000000 */  nop
/* E36FC 001E35FC 00000000 */  nop
