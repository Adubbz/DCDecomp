.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawShopIcon__Fiiii
/* 0E78D0 001E77D0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0E78D4 001E77D4 0000BF7F */  sq          $31, 0x0($29)
/* 0E78D8 001E77D8 50000324 */  addiu       $3, $0, 0x50
/* 0E78DC 001E77DC A2000824 */  addiu       $8, $0, 0xA2
/* 0E78E0 001E77E0 0300C010 */  beqz        $6, .L001E77F0
/* 0E78E4 001E77E4 00000000 */   nop
/* 0E78E8 001E77E8 28006324 */  addiu       $3, $3, 0x28
/* 0E78EC 001E77EC C8000824 */  addiu       $8, $0, 0xC8
.L001E77F0:
/* 0E78F0 001E77F0 14000224 */  addiu       $2, $0, 0x14
/* 0E78F4 001E77F4 2000A2AF */  sw          $2, 0x20($29)
/* 0E78F8 001E77F8 2400A3AF */  sw          $3, 0x24($29)
/* 0E78FC 001E77FC 2800A8AF */  sw          $8, 0x28($29)
/* 0E7900 001E7800 28000224 */  addiu       $2, $0, 0x28
/* 0E7904 001E7804 2C00A2AF */  sw          $2, 0x2C($29)
/* 0E7908 001E7808 1000A4AF */  sw          $4, 0x10($29)
/* 0E790C 001E780C 1400A5AF */  sw          $5, 0x14($29)
/* 0E7910 001E7810 1800A8AF */  sw          $8, 0x18($29)
/* 0E7914 001E7814 1C00A2AF */  sw          $2, 0x1C($29)
/* 0E7918 001E7818 8894848F */  lw          $4, -0x6B78($28)
/* 0E791C 001E781C 1000A527 */  addiu       $5, $29, 0x10
/* 0E7920 001E7820 2000A627 */  addiu       $6, $29, 0x20
/* 0E7924 001E7824 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0E7928 001E7828 00000000 */   nop
/* 0E792C 001E782C 0000BF7B */  lq          $31, 0x0($29)
/* 0E7930 001E7830 3000BD27 */  addiu       $29, $29, 0x30
/* 0E7934 001E7834 0800E003 */  jr          $31
/* 0E7938 001E7838 00000000 */   nop
/* 0E793C 001E783C 00000000 */  nop
