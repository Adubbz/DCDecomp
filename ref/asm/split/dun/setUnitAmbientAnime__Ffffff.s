.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setUnitAmbientAnime__Ffffff
/* 015300 01DC1000 F0FFBD27 */  addiu       $29, $29, -0x10
/* 015304 01DC1004 0000BF7F */  sq          $31, 0x0($29)
/* 015308 01DC1008 F001013C */  lui         $1, %hi(unitAmbientAnime_rgb)
/* 01530C 01DC100C D0682EE4 */  swc1        $f14, %lo(unitAmbientAnime_rgb)($1)
/* 015310 01DC1010 F001013C */  lui         $1, %hi(unitAmbientAnime_rgb + 0x4)
/* 015314 01DC1014 D4682FE4 */  swc1        $f15, %lo(unitAmbientAnime_rgb + 0x4)($1)
/* 015318 01DC1018 F001013C */  lui         $1, %hi(unitAmbientAnime_rgb + 0x8)
/* 01531C 01DC101C D86830E4 */  swc1        $f16, %lo(unitAmbientAnime_rgb + 0x8)($1)
/* 015320 01DC1020 089F80AF */  sw          $0, -0x60F8($28)
/* 015324 01DC1024 049F8CE7 */  swc1        $f12, -0x60FC($28)
/* 015328 01DC1028 066B0046 */  mov.s       $f12, $f13
/* 01532C 01DC102C 2C44040C */  jal         fptosi
/* 015330 01DC1030 00000000 */   nop
/* 015334 01DC1034 0C9F82AF */  sw          $2, -0x60F4($28)
/* 015338 01DC1038 01000324 */  addiu       $3, $0, 0x1
/* 01533C 01DC103C 109F83AF */  sw          $3, -0x60F0($28)
/* 015340 01DC1040 0000BF7B */  lq          $31, 0x0($29)
/* 015344 01DC1044 1000BD27 */  addiu       $29, $29, 0x10
/* 015348 01DC1048 0800E003 */  jr          $31
/* 01534C 01DC104C 00000000 */   nop
