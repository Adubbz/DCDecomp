.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawVu1__13CVisualMDTVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 36300 00136200 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 36304 00136204 0000BF7F */  sq         $31, 0x0($sp)
/* 36308 00136208 C08B828F */  lw         $2, -0x7440($gp)
/* 3630C 0013620C 80100200 */  sll        $2, $2, 2
/* 36310 00136210 21104400 */  addu       $2, $2, $4
/* 36314 00136214 2800428C */  lw         $2, 0x28($2)
/* 36318 00136218 180082AC */  sw         $2, 0x18($4)
/* 3631C 0013621C F0D2040C */  jal        DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 36320 00136220 00000000 */   nop
/* 36324 00136224 0000BF7B */  lq         $31, 0x0($sp)
/* 36328 00136228 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3632C 0013622C 0800E003 */  jr         $31
/* 36330 00136230 00000000 */   nop
/* 36334 00136234 00000000 */  nop
/* 36338 00136238 00000000 */  nop
/* 3633C 0013623C 00000000 */  nop
