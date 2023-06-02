.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_LOCKON_DIST__FP12RS_STACKDATAi
/* E4E10 001E4D10 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E4E14 001E4D14 0000BF7F */  sq         $31, 0x0($sp)
/* E4E18 001E4D18 E09C828F */  lw         $2, -0x6320($gp)
/* E4E1C 001E4D1C 9000438C */  lw         $3, 0x90($2)
/* E4E20 001E4D20 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E4E24 001E4D24 00000000 */   nop
/* E4E28 001E4D28 E09C848F */  lw         $4, -0x6320($gp)
/* E4E2C 001E4D2C 80100300 */  sll        $2, $3, 2
/* E4E30 001E4D30 21184300 */  addu       $3, $2, $3
/* E4E34 001E4D34 80100300 */  sll        $2, $3, 2
/* E4E38 001E4D38 21106200 */  addu       $2, $3, $2
/* E4E3C 001E4D3C 00110200 */  sll        $2, $2, 4
/* E4E40 001E4D40 21104400 */  addu       $2, $2, $4
/* E4E44 001E4D44 0200013C */  lui        $at, (0x20000 >> 16)
/* E4E48 001E4D48 21084100 */  addu       $at, $2, $at
/* E4E4C 001E4D4C E8E420E4 */  swc1       $f0, -0x1B18($at)
/* E4E50 001E4D50 01000224 */  addiu      $2, $0, 0x1
/* E4E54 001E4D54 0000BF7B */  lq         $31, 0x0($sp)
/* E4E58 001E4D58 1000BD27 */  addiu      $sp, $sp, 0x10
/* E4E5C 001E4D5C 0800E003 */  jr         $31
/* E4E60 001E4D60 00000000 */   nop
/* E4E64 001E4D64 00000000 */  nop
/* E4E68 001E4D68 00000000 */  nop
/* E4E6C 001E4D6C 00000000 */  nop
