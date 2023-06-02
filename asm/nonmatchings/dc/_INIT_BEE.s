.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _INIT_BEE__FP12RS_STACKDATAi
/* BD210 001BD110 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD214 001BD114 0000BF7F */  sq         $31, 0x0($sp)
/* BD218 001BD118 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BD21C 001BD11C 00000000 */   nop
/* BD220 001BD120 D501013C */  lui        $at, (0x1D567D4 >> 16)
/* BD224 001BD124 D46722AC */  sw         $2, (0x1D567D4 & 0xFFFF)($at)
/* BD228 001BD128 D501013C */  lui        $at, (0x1D567D4 >> 16)
/* BD22C 001BD12C D467238C */  lw         $3, (0x1D567D4 & 0xFFFF)($at)
/* BD230 001BD130 40110300 */  sll        $2, $3, 5
/* BD234 001BD134 21184300 */  addu       $3, $2, $3
/* BD238 001BD138 80100300 */  sll        $2, $3, 2
/* BD23C 001BD13C 21106200 */  addu       $2, $3, $2
/* BD240 001BD140 40190200 */  sll        $3, $2, 5
/* BD244 001BD144 EB01023C */  lui        $2, %hi(D_1EA851C)
/* BD248 001BD148 1C854224 */  addiu      $2, $2, %lo(D_1EA851C)
/* BD24C 001BD14C 21104300 */  addu       $2, $2, $3
/* BD250 001BD150 0000448C */  lw         $4, 0x0($2)
/* BD254 001BD154 0F000524 */  addiu      $5, $0, 0xF
/* BD258 001BD158 0865070C */  jal        InitBee__FP6CFramei
/* BD25C 001BD15C 00000000 */   nop
/* BD260 001BD160 01000224 */  addiu      $2, $0, 0x1
/* BD264 001BD164 0000BF7B */  lq         $31, 0x0($sp)
/* BD268 001BD168 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD26C 001BD16C 0800E003 */  jr         $31
/* BD270 001BD170 00000000 */   nop
/* BD274 001BD174 00000000 */  nop
/* BD278 001BD178 00000000 */  nop
/* BD27C 001BD17C 00000000 */  nop
