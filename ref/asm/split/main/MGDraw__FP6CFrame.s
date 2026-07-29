.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGDraw__FP6CFrame
/* 02EE80 0012ED80 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02EE84 0012ED84 1000BF7F */  sq          $31, 0x10($29)
/* 02EE88 0012ED88 0000B07F */  sq          $16, 0x0($29)
/* 02EE8C 0012ED8C 28868070 */  paddub      $16, $4, $0
/* 02EE90 0012ED90 11000012 */  beqz        $16, .L0012EDD8
/* 02EE94 0012ED94 00000000 */   nop
/* 02EE98 0012ED98 D48B848F */  lw          $4, -0x742C($28)
/* 02EE9C 0012ED9C 0A83040C */  jal         sceVif1PkTerminate
/* 02EEA0 0012EDA0 00000000 */   nop
/* 02EEA4 0012EDA4 D48B828F */  lw          $2, -0x742C($28)
/* 02EEA8 0012EDA8 28260072 */  paddub      $4, $16, $0
/* 02EEAC 0012EDAC 0000458C */  lw          $5, 0x0($2)
/* 02EEB0 0012EDB0 C701023C */  lui         $2, %hi(mgRenderInfo)
/* 02EEB4 0012EDB4 20554624 */  addiu       $6, $2, %lo(mgRenderInfo)
/* 02EEB8 0012EDB8 5002198E */  lw          $25, 0x250($16)
/* 02EEBC 0012EDBC 0800398F */  lw          $25, 0x8($25)
/* 02EEC0 0012EDC0 09F82003 */  jalr        $25
/* 02EEC4 0012EDC4 00000000 */   nop
/* 02EEC8 0012EDC8 D48B848F */  lw          $4, -0x742C($28)
/* 02EECC 0012EDCC 282E4070 */  paddub      $5, $2, $0
/* 02EED0 0012EDD0 DE83040C */  jal         sceVif1PkReserve
/* 02EED4 0012EDD4 00000000 */   nop
.L0012EDD8:
/* 02EED8 0012EDD8 1000BF7B */  lq          $31, 0x10($29)
/* 02EEDC 0012EDDC 0000B07B */  lq          $16, 0x0($29)
/* 02EEE0 0012EDE0 2000BD27 */  addiu       $29, $29, 0x20
/* 02EEE4 0012EDE4 0800E003 */  jr          $31
/* 02EEE8 0012EDE8 00000000 */   nop
/* 02EEEC 0012EDEC 00000000 */  nop
