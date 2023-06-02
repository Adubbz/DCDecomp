.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_LOOP_SND__FP12RS_STACKDATAi
/* E4770 001E4670 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E4774 001E4674 2000BF7F */  sq         $31, 0x20($sp)
/* E4778 001E4678 1000B17F */  sq         $17, 0x10($sp)
/* E477C 001E467C 0000B07F */  sq         $16, 0x0($sp)
/* E4780 001E4680 E09C828F */  lw         $2, -0x6320($gp)
/* E4784 001E4684 9000458C */  lw         $5, 0x90($2)
/* E4788 001E4688 08009124 */  addiu      $17, $4, 0x8
/* E478C 001E468C A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E4790 001E4690 00000000 */   nop
/* E4794 001E4694 E09C838F */  lw         $3, -0x6320($gp)
/* E4798 001E4698 00110500 */  sll        $2, $5, 4
/* E479C 001E469C 21104500 */  addu       $2, $2, $5
/* E47A0 001E46A0 00810200 */  sll        $16, $2, 4
/* E47A4 001E46A4 21100302 */  addu       $2, $16, $3
/* E47A8 001E46A8 0600013C */  lui        $at, (0x60000 >> 16)
/* E47AC 001E46AC 21084100 */  addu       $at, $2, $at
/* E47B0 001E46B0 50EF20E4 */  swc1       $f0, -0x10B0($at)
/* E47B4 001E46B4 28262072 */  paddub     $4, $17, $0
/* E47B8 001E46B8 08009124 */  addiu      $17, $4, 0x8
/* E47BC 001E46BC A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E47C0 001E46C0 00000000 */   nop
/* E47C4 001E46C4 E09C828F */  lw         $2, -0x6320($gp)
/* E47C8 001E46C8 21100202 */  addu       $2, $16, $2
/* E47CC 001E46CC 0600013C */  lui        $at, (0x60000 >> 16)
/* E47D0 001E46D0 21084100 */  addu       $at, $2, $at
/* E47D4 001E46D4 54EF20E4 */  swc1       $f0, -0x10AC($at)
/* E47D8 001E46D8 28262072 */  paddub     $4, $17, $0
/* E47DC 001E46DC 08009124 */  addiu      $17, $4, 0x8
/* E47E0 001E46E0 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E47E4 001E46E4 00000000 */   nop
/* E47E8 001E46E8 E09C838F */  lw         $3, -0x6320($gp)
/* E47EC 001E46EC 21180302 */  addu       $3, $16, $3
/* E47F0 001E46F0 0600013C */  lui        $at, (0x60000 >> 16)
/* E47F4 001E46F4 21086100 */  addu       $at, $3, $at
/* E47F8 001E46F8 58EF22AC */  sw         $2, -0x10A8($at)
/* E47FC 001E46FC 28262072 */  paddub     $4, $17, $0
/* E4800 001E4700 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E4804 001E4704 00000000 */   nop
/* E4808 001E4708 E09C838F */  lw         $3, -0x6320($gp)
/* E480C 001E470C 21180302 */  addu       $3, $16, $3
/* E4810 001E4710 0600013C */  lui        $at, (0x60000 >> 16)
/* E4814 001E4714 21086100 */  addu       $at, $3, $at
/* E4818 001E4718 5CEF22AC */  sw         $2, -0x10A4($at)
/* E481C 001E471C 01000224 */  addiu      $2, $0, 0x1
/* E4820 001E4720 2000BF7B */  lq         $31, 0x20($sp)
/* E4824 001E4724 1000B17B */  lq         $17, 0x10($sp)
/* E4828 001E4728 0000B07B */  lq         $16, 0x0($sp)
/* E482C 001E472C 3000BD27 */  addiu      $sp, $sp, 0x30
/* E4830 001E4730 0800E003 */  jr         $31
/* E4834 001E4734 00000000 */   nop
/* E4838 001E4738 00000000 */  nop
/* E483C 001E473C 00000000 */  nop
