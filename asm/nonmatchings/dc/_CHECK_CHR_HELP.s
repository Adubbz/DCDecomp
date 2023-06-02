.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_CHR_HELP__FP12RS_STACKDATAi
/* BD560 001BD460 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD564 001BD464 0000BF7F */  sq         $31, 0x0($sp)
/* BD568 001BD468 D501013C */  lui        $at, (0x1D567F4 >> 16)
/* BD56C 001BD46C F467258C */  lw         $5, (0x1D567F4 & 0xFFFF)($at)
/* BD570 001BD470 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BD574 001BD474 00000000 */   nop
/* BD578 001BD478 01000224 */  addiu      $2, $0, 0x1
/* BD57C 001BD47C 0000BF7B */  lq         $31, 0x0($sp)
/* BD580 001BD480 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD584 001BD484 0800E003 */  jr         $31
/* BD588 001BD488 00000000 */   nop
/* BD58C 001BD48C 00000000 */  nop
