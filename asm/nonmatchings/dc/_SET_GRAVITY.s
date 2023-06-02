.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_GRAVITY__FP12RS_STACKDATAi
/* E6150 001E6050 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E6154 001E6054 1000BF7F */  sq         $31, 0x10($sp)
/* E6158 001E6058 0000B07F */  sq         $16, 0x0($sp)
/* E615C 001E605C E09C828F */  lw         $2, -0x6320($gp)
/* E6160 001E6060 9000508C */  lw         $16, 0x90($2)
/* E6164 001E6064 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E6168 001E6068 00000000 */   nop
/* E616C 001E606C E09C858F */  lw         $5, -0x6320($gp)
/* E6170 001E6070 80181000 */  sll        $3, $16, 2
/* E6174 001E6074 21207000 */  addu       $4, $3, $16
/* E6178 001E6078 80180400 */  sll        $3, $4, 2
/* E617C 001E607C 21188300 */  addu       $3, $4, $3
/* E6180 001E6080 00190300 */  sll        $3, $3, 4
/* E6184 001E6084 21186500 */  addu       $3, $3, $5
/* E6188 001E6088 0200013C */  lui        $at, (0x20000 >> 16)
/* E618C 001E608C 21086100 */  addu       $at, $3, $at
/* E6190 001E6090 A6E422A4 */  sh         $2, -0x1B5A($at)
/* E6194 001E6094 01000224 */  addiu      $2, $0, 0x1
/* E6198 001E6098 1000BF7B */  lq         $31, 0x10($sp)
/* E619C 001E609C 0000B07B */  lq         $16, 0x0($sp)
/* E61A0 001E60A0 2000BD27 */  addiu      $sp, $sp, 0x20
/* E61A4 001E60A4 0800E003 */  jr         $31
/* E61A8 001E60A8 00000000 */   nop
/* E61AC 001E60AC 00000000 */  nop
