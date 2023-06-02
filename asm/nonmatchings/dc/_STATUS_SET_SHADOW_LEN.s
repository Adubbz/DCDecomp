.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_SET_SHADOW_LEN__FP12RS_STACKDATAi
/* E37B0 001E36B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E37B4 001E36B4 0000BF7F */  sq         $31, 0x0($sp)
/* E37B8 001E36B8 E09C828F */  lw         $2, -0x6320($gp)
/* E37BC 001E36BC 9000438C */  lw         $3, 0x90($2)
/* E37C0 001E36C0 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E37C4 001E36C4 00000000 */   nop
/* E37C8 001E36C8 E09C848F */  lw         $4, -0x6320($gp)
/* E37CC 001E36CC 80100300 */  sll        $2, $3, 2
/* E37D0 001E36D0 21184300 */  addu       $3, $2, $3
/* E37D4 001E36D4 80100300 */  sll        $2, $3, 2
/* E37D8 001E36D8 21106200 */  addu       $2, $3, $2
/* E37DC 001E36DC 00110200 */  sll        $2, $2, 4
/* E37E0 001E36E0 21104400 */  addu       $2, $2, $4
/* E37E4 001E36E4 0200013C */  lui        $at, (0x20000 >> 16)
/* E37E8 001E36E8 21084100 */  addu       $at, $2, $at
/* E37EC 001E36EC 9CE420E4 */  swc1       $f0, -0x1B64($at)
/* E37F0 001E36F0 01000224 */  addiu      $2, $0, 0x1
/* E37F4 001E36F4 0000BF7B */  lq         $31, 0x0($sp)
/* E37F8 001E36F8 1000BD27 */  addiu      $sp, $sp, 0x10
/* E37FC 001E36FC 0800E003 */  jr         $31
/* E3800 001E3700 00000000 */   nop
/* E3804 001E3704 00000000 */  nop
/* E3808 001E3708 00000000 */  nop
/* E380C 001E370C 00000000 */  nop
