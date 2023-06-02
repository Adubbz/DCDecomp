.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DevInit__Fv
/* 27CA0 00127BA0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 27CA4 00127BA4 0000BF7F */  sq         $31, 0x0($sp)
/* 27CA8 00127BA8 01000424 */  addiu      $4, $0, 0x1
/* 27CAC 00127BAC F430040C */  jal        sceDmaReset
/* 27CB0 00127BB0 00000000 */   nop
/* 27CB4 00127BB4 1000A427 */  addiu      $4, $sp, 0x10
/* 27CB8 00127BB8 A631040C */  jal        sceDmaGetEnv
/* 27CBC 00127BBC 00000000 */   nop
/* 27CC0 00127BC0 00010224 */  addiu      $2, $0, 0x100
/* 27CC4 00127BC4 1600A2A7 */  sh         $2, 0x16($sp)
/* 27CC8 00127BC8 1000A427 */  addiu      $4, $sp, 0x10
/* 27CCC 00127BCC 3031040C */  jal        sceDmaPutEnv
/* 27CD0 00127BD0 00000000 */   nop
/* 27CD4 00127BD4 F448040C */  jal        sceGsResetPath
/* 27CD8 00127BD8 00000000 */   nop
/* 27CDC 00127BDC 0000BF7B */  lq         $31, 0x0($sp)
/* 27CE0 00127BE0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 27CE4 00127BE4 0800E003 */  jr         $31
/* 27CE8 00127BE8 00000000 */   nop
/* 27CEC 00127BEC 00000000 */  nop
