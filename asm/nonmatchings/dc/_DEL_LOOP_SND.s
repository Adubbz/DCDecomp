.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DEL_LOOP_SND__FP12RS_STACKDATAi
/* E48B0 001E47B0 E09C858F */  lw         $5, -0x6320($gp)
/* E48B4 001E47B4 9000A48C */  lw         $4, 0x90($5)
/* E48B8 001E47B8 FFFF0324 */  addiu      $3, $0, -0x1
/* E48BC 001E47BC 00110400 */  sll        $2, $4, 4
/* E48C0 001E47C0 21104400 */  addu       $2, $2, $4
/* E48C4 001E47C4 00110200 */  sll        $2, $2, 4
/* E48C8 001E47C8 21104500 */  addu       $2, $2, $5
/* E48CC 001E47CC 0600013C */  lui        $at, (0x60000 >> 16)
/* E48D0 001E47D0 21084100 */  addu       $at, $2, $at
/* E48D4 001E47D4 5CEF23AC */  sw         $3, -0x10A4($at)
/* E48D8 001E47D8 01000224 */  addiu      $2, $0, 0x1
/* E48DC 001E47DC 0800E003 */  jr         $31
/* E48E0 001E47E0 00000000 */   nop
/* E48E4 001E47E4 00000000 */  nop
/* E48E8 001E47E8 00000000 */  nop
/* E48EC 001E47EC 00000000 */  nop
