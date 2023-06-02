.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGDraw__FP6CFrame
/* 2EE80 0012ED80 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2EE84 0012ED84 1000BF7F */  sq         $31, 0x10($sp)
/* 2EE88 0012ED88 0000B07F */  sq         $16, 0x0($sp)
/* 2EE8C 0012ED8C 28868070 */  paddub     $16, $4, $0
/* 2EE90 0012ED90 11000012 */  beqz       $16, .L0012EDD8
/* 2EE94 0012ED94 00000000 */   nop
/* 2EE98 0012ED98 D48B848F */  lw         $4, -0x742C($gp)
/* 2EE9C 0012ED9C 0A83040C */  jal        sceVif1PkTerminate
/* 2EEA0 0012EDA0 00000000 */   nop
/* 2EEA4 0012EDA4 D48B828F */  lw         $2, -0x742C($gp)
/* 2EEA8 0012EDA8 28260072 */  paddub     $4, $16, $0
/* 2EEAC 0012EDAC 0000458C */  lw         $5, 0x0($2)
/* 2EEB0 0012EDB0 C701023C */  lui        $2, %hi(mgRenderInfo)
/* 2EEB4 0012EDB4 20554624 */  addiu      $6, $2, %lo(mgRenderInfo)
/* 2EEB8 0012EDB8 5002198E */  lw         $25, 0x250($16)
/* 2EEBC 0012EDBC 0800398F */  lw         $25, 0x8($25)
/* 2EEC0 0012EDC0 09F82003 */  jalr       $25
/* 2EEC4 0012EDC4 00000000 */   nop
/* 2EEC8 0012EDC8 D48B848F */  lw         $4, -0x742C($gp)
/* 2EECC 0012EDCC 282E4070 */  paddub     $5, $2, $0
/* 2EED0 0012EDD0 DE83040C */  jal        sceVif1PkReserve
/* 2EED4 0012EDD4 00000000 */   nop
.L0012EDD8:
/* 2EED8 0012EDD8 1000BF7B */  lq         $31, 0x10($sp)
/* 2EEDC 0012EDDC 0000B07B */  lq         $16, 0x0($sp)
/* 2EEE0 0012EDE0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2EEE4 0012EDE4 0800E003 */  jr         $31
/* 2EEE8 0012EDE8 00000000 */   nop
/* 2EEEC 0012EDEC 00000000 */  nop
