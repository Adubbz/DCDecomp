.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_IBOX_ANGLE__FP12RS_STACKDATAi
/* BD7F0 001BD6F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD7F4 001BD6F4 0000BF7F */  sq         $31, 0x0($sp)
/* BD7F8 001BD6F8 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BD7FC 001BD6FC 00000000 */   nop
/* BD800 001BD700 C89C838F */  lw         $3, -0x6338($gp)
/* BD804 001BD704 D501013C */  lui        $at, (0x1D567EC >> 16)
/* BD808 001BD708 EC67228C */  lw         $2, (0x1D567EC & 0xFFFF)($at)
/* BD80C 001BD70C 80110200 */  sll        $2, $2, 6
/* BD810 001BD710 21104300 */  addu       $2, $2, $3
/* BD814 001BD714 0100013C */  lui        $at, (0x10000 >> 16)
/* BD818 001BD718 21084100 */  addu       $at, $2, $at
/* BD81C 001BD71C 8CB620E4 */  swc1       $f0, -0x4974($at)
/* BD820 001BD720 01000224 */  addiu      $2, $0, 0x1
/* BD824 001BD724 0000BF7B */  lq         $31, 0x0($sp)
/* BD828 001BD728 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD82C 001BD72C 0800E003 */  jr         $31
/* BD830 001BD730 00000000 */   nop
/* BD834 001BD734 00000000 */  nop
/* BD838 001BD738 00000000 */  nop
/* BD83C 001BD73C 00000000 */  nop
