.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_IBOX_ANGLE__FP12RS_STACKDATAi
/* 0BD7F0 001BD6F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD7F4 001BD6F4 0000BF7F */  sq          $31, 0x0($29)
/* 0BD7F8 001BD6F8 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BD7FC 001BD6FC 00000000 */   nop
/* 0BD800 001BD700 C89C838F */  lw          $3, -0x6338($28)
/* 0BD804 001BD704 D501013C */  lui         $1, %hi(BtEventInfo + 0xAC)
/* 0BD808 001BD708 EC67228C */  lw          $2, %lo(BtEventInfo + 0xAC)($1)
/* 0BD80C 001BD70C 80110200 */  sll         $2, $2, 6
/* 0BD810 001BD710 21104300 */  addu        $2, $2, $3
/* 0BD814 001BD714 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BD818 001BD718 21084100 */  addu        $1, $2, $1
/* 0BD81C 001BD71C 8CB620E4 */  swc1        $f0, -0x4974($1)
/* 0BD820 001BD720 01000224 */  addiu       $2, $0, 0x1
/* 0BD824 001BD724 0000BF7B */  lq          $31, 0x0($29)
/* 0BD828 001BD728 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD82C 001BD72C 0800E003 */  jr          $31
/* 0BD830 001BD730 00000000 */   nop
/* 0BD834 001BD734 00000000 */  nop
/* 0BD838 001BD738 00000000 */  nop
/* 0BD83C 001BD73C 00000000 */  nop
