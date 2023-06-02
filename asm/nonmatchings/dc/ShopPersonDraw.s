.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopPersonDraw__Fi
/* E8470 001E8370 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E8474 001E8374 0000BF7F */  sq         $31, 0x0($sp)
/* E8478 001E8378 D901013C */  lui        $at, (0x1D90266 >> 16)
/* E847C 001E837C 66022484 */  lh         $4, (0x1D90266 & 0xFFFF)($at)
/* E8480 001E8380 38B4080C */  jal        MenuTextureReload__Fi
/* E8484 001E8384 00000000 */   nop
/* E8488 001E8388 80000424 */  addiu      $4, $0, 0x80
/* E848C 001E838C 1F00023C */  lui        $2, %hi(LocalShopPersonDraw__Fv)
/* E8490 001E8390 B0824524 */  addiu      $5, $2, %lo(LocalShopPersonDraw__Fv)
/* E8494 001E8394 A4AF080C */  jal        MenuPolygonDraw__FiPFv_v
/* E8498 001E8398 00000000 */   nop
/* E849C 001E839C 0000BF7B */  lq         $31, 0x0($sp)
/* E84A0 001E83A0 1000BD27 */  addiu      $sp, $sp, 0x10
/* E84A4 001E83A4 0800E003 */  jr         $31
/* E84A8 001E83A8 00000000 */   nop
/* E84AC 001E83AC 00000000 */  nop
