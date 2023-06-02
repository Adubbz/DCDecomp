.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitEyeCamera__FP10CCharacter
/* 69E90 00169D90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69E94 00169D94 0000BF7F */  sq         $31, 0x0($sp)
/* 69E98 00169D98 A000998C */  lw         $25, 0xA0($4)
/* 69E9C 00169D9C 7800398F */  lw         $25, 0x78($25)
/* 69EA0 00169DA0 09F82003 */  jalr       $25
/* 69EA4 00169DA4 00000000 */   nop
/* 69EA8 00169DA8 040040C4 */  lwc1       $f0, 0x4($2)
/* 69EAC 00169DAC 008F80E7 */  swc1       $f0, -0x7100($gp)
/* 69EB0 00169DB0 048F80AF */  sw         $0, -0x70FC($gp)
/* 69EB4 00169DB4 0000BF7B */  lq         $31, 0x0($sp)
/* 69EB8 00169DB8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 69EBC 00169DBC 0800E003 */  jr         $31
/* 69EC0 00169DC0 00000000 */   nop
/* 69EC4 00169DC4 00000000 */  nop
/* 69EC8 00169DC8 00000000 */  nop
/* 69ECC 00169DCC 00000000 */  nop
