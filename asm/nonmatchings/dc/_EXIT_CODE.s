.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EXIT_CODE__FP12RS_STACKDATAi
/* 8BEA0 0018BDA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8BEA4 0018BDA4 0000BF7F */  sq         $31, 0x0($sp)
/* 8BEA8 0018BDA8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8BEAC 0018BDAC 00000000 */   nop
/* 8BEB0 0018BDB0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BEB4 0018BDB4 1CD622AC */  sw         $2, -0x29E4($at)
/* 8BEB8 0018BDB8 01000224 */  addiu      $2, $0, 0x1
/* 8BEBC 0018BDBC 0000BF7B */  lq         $31, 0x0($sp)
/* 8BEC0 0018BDC0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8BEC4 0018BDC4 0800E003 */  jr         $31
/* 8BEC8 0018BDC8 00000000 */   nop
/* 8BECC 0018BDCC 00000000 */  nop
