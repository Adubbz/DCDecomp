.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishLineGetUki__FPf
/* AA280 001AA180 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* AA284 001AA184 0000BF7F */  sq         $31, 0x0($sp)
/* AA288 001AA188 D501023C */  lui        $2, %hi(D_1D55F50)
/* AA28C 001AA18C 505F4524 */  addiu      $5, $2, %lo(D_1D55F50)
/* AA290 001AA190 0C86040C */  jal        sceVu0CopyVector
/* AA294 001AA194 00000000 */   nop
/* AA298 001AA198 0000BF7B */  lq         $31, 0x0($sp)
/* AA29C 001AA19C 1000BD27 */  addiu      $sp, $sp, 0x10
/* AA2A0 001AA1A0 0800E003 */  jr         $31
/* AA2A4 001AA1A4 00000000 */   nop
/* AA2A8 001AA1A8 00000000 */  nop
/* AA2AC 001AA1AC 00000000 */  nop
