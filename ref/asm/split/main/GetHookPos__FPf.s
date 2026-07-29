.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetHookPos__FPf
/* 0A9CC0 001A9BC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0A9CC4 001A9BC4 0000BF7F */  sq          $31, 0x0($29)
/* 0A9CC8 001A9BC8 D501023C */  lui         $2, %hi(hookp)
/* 0A9CCC 001A9BCC B0624524 */  addiu       $5, $2, %lo(hookp)
/* 0A9CD0 001A9BD0 0C86040C */  jal         sceVu0CopyVector
/* 0A9CD4 001A9BD4 00000000 */   nop
/* 0A9CD8 001A9BD8 0000BF7B */  lq          $31, 0x0($29)
/* 0A9CDC 001A9BDC 1000BD27 */  addiu       $29, $29, 0x10
/* 0A9CE0 001A9BE0 0800E003 */  jr          $31
/* 0A9CE4 001A9BE4 00000000 */   nop
/* 0A9CE8 001A9BE8 00000000 */  nop
/* 0A9CEC 001A9BEC 00000000 */  nop
