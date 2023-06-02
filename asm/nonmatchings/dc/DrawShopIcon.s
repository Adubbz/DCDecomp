.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawShopIcon__Fiiii
/* E78D0 001E77D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E78D4 001E77D4 0000BF7F */  sq         $31, 0x0($sp)
/* E78D8 001E77D8 50000324 */  addiu      $3, $0, 0x50
/* E78DC 001E77DC A2000824 */  addiu      $8, $0, 0xA2
/* E78E0 001E77E0 0300C010 */  beqz       $6, .L001E77F0
/* E78E4 001E77E4 00000000 */   nop
/* E78E8 001E77E8 28006324 */  addiu      $3, $3, 0x28
/* E78EC 001E77EC C8000824 */  addiu      $8, $0, 0xC8
.L001E77F0:
/* E78F0 001E77F0 14000224 */  addiu      $2, $0, 0x14
/* E78F4 001E77F4 2000A2AF */  sw         $2, 0x20($sp)
/* E78F8 001E77F8 2400A3AF */  sw         $3, 0x24($sp)
/* E78FC 001E77FC 2800A8AF */  sw         $8, 0x28($sp)
/* E7900 001E7800 28000224 */  addiu      $2, $0, 0x28
/* E7904 001E7804 2C00A2AF */  sw         $2, 0x2C($sp)
/* E7908 001E7808 1000A4AF */  sw         $4, 0x10($sp)
/* E790C 001E780C 1400A5AF */  sw         $5, 0x14($sp)
/* E7910 001E7810 1800A8AF */  sw         $8, 0x18($sp)
/* E7914 001E7814 1C00A2AF */  sw         $2, 0x1C($sp)
/* E7918 001E7818 8894848F */  lw         $4, -0x6B78($gp)
/* E791C 001E781C 1000A527 */  addiu      $5, $sp, 0x10
/* E7920 001E7820 2000A627 */  addiu      $6, $sp, 0x20
/* E7924 001E7824 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* E7928 001E7828 00000000 */   nop
/* E792C 001E782C 0000BF7B */  lq         $31, 0x0($sp)
/* E7930 001E7830 3000BD27 */  addiu      $sp, $sp, 0x30
/* E7934 001E7834 0800E003 */  jr         $31
/* E7938 001E7838 00000000 */   nop
/* E793C 001E783C 00000000 */  nop
