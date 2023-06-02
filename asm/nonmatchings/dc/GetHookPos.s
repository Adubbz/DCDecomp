.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetHookPos__FPf
/* A9CC0 001A9BC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* A9CC4 001A9BC4 0000BF7F */  sq         $31, 0x0($sp)
/* A9CC8 001A9BC8 D501023C */  lui        $2, %hi(hookp)
/* A9CCC 001A9BCC B0624524 */  addiu      $5, $2, %lo(hookp)
/* A9CD0 001A9BD0 0C86040C */  jal        sceVu0CopyVector
/* A9CD4 001A9BD4 00000000 */   nop
/* A9CD8 001A9BD8 0000BF7B */  lq         $31, 0x0($sp)
/* A9CDC 001A9BDC 1000BD27 */  addiu      $sp, $sp, 0x10
/* A9CE0 001A9BE0 0800E003 */  jr         $31
/* A9CE4 001A9BE4 00000000 */   nop
/* A9CE8 001A9BE8 00000000 */  nop
/* A9CEC 001A9BEC 00000000 */  nop
