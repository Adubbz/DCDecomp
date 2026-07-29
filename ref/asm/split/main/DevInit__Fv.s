.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DevInit__Fv
/* 027CA0 00127BA0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 027CA4 00127BA4 0000BF7F */  sq          $31, 0x0($29)
/* 027CA8 00127BA8 01000424 */  addiu       $4, $0, 0x1
/* 027CAC 00127BAC F430040C */  jal         sceDmaReset
/* 027CB0 00127BB0 00000000 */   nop
/* 027CB4 00127BB4 1000A427 */  addiu       $4, $29, 0x10
/* 027CB8 00127BB8 A631040C */  jal         sceDmaGetEnv
/* 027CBC 00127BBC 00000000 */   nop
/* 027CC0 00127BC0 00010224 */  addiu       $2, $0, 0x100
/* 027CC4 00127BC4 1600A2A7 */  sh          $2, 0x16($29)
/* 027CC8 00127BC8 1000A427 */  addiu       $4, $29, 0x10
/* 027CCC 00127BCC 3031040C */  jal         sceDmaPutEnv
/* 027CD0 00127BD0 00000000 */   nop
/* 027CD4 00127BD4 F448040C */  jal         sceGsResetPath
/* 027CD8 00127BD8 00000000 */   nop
/* 027CDC 00127BDC 0000BF7B */  lq          $31, 0x0($29)
/* 027CE0 00127BE0 3000BD27 */  addiu       $29, $29, 0x30
/* 027CE4 00127BE4 0800E003 */  jr          $31
/* 027CE8 00127BE8 00000000 */   nop
/* 027CEC 00127BEC 00000000 */  nop
