.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishLineGetHook__FPf
/* AA2B0 001AA1B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* AA2B4 001AA1B4 0000BF7F */  sq         $31, 0x0($sp)
/* AA2B8 001AA1B8 D501023C */  lui        $2, %hi(D_1D55FA0)
/* AA2BC 001AA1BC A05F4524 */  addiu      $5, $2, %lo(D_1D55FA0)
/* AA2C0 001AA1C0 0C86040C */  jal        sceVu0CopyVector
/* AA2C4 001AA1C4 00000000 */   nop
/* AA2C8 001AA1C8 0000BF7B */  lq         $31, 0x0($sp)
/* AA2CC 001AA1CC 1000BD27 */  addiu      $sp, $sp, 0x10
/* AA2D0 001AA1D0 0800E003 */  jr         $31
/* AA2D4 001AA1D4 00000000 */   nop
/* AA2D8 001AA1D8 00000000 */  nop
/* AA2DC 001AA1DC 00000000 */  nop
