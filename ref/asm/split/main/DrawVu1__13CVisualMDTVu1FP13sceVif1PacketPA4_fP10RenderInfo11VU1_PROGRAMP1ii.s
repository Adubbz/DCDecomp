.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawVu1__13CVisualMDTVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 036300 00136200 F0FFBD27 */  addiu       $29, $29, -0x10
/* 036304 00136204 0000BF7F */  sq          $31, 0x0($29)
/* 036308 00136208 C08B828F */  lw          $2, -0x7440($28)
/* 03630C 0013620C 80100200 */  sll         $2, $2, 2
/* 036310 00136210 21104400 */  addu        $2, $2, $4
/* 036314 00136214 2800428C */  lw          $2, 0x28($2)
/* 036318 00136218 180082AC */  sw          $2, 0x18($4)
/* 03631C 0013621C F0D2040C */  jal         DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 036320 00136220 00000000 */   nop
/* 036324 00136224 0000BF7B */  lq          $31, 0x0($29)
/* 036328 00136228 1000BD27 */  addiu       $29, $29, 0x10
/* 03632C 0013622C 0800E003 */  jr          $31
/* 036330 00136230 00000000 */   nop
/* 036334 00136234 00000000 */  nop
/* 036338 00136238 00000000 */  nop
/* 03633C 0013623C 00000000 */  nop
