.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetTexture__9CFireOmniFP8CTextureP8CTexture
/* 61BA0 00161AA0 340085AC */  sw         $5, 0x34($4)
/* 61BA4 00161AA4 380086AC */  sw         $6, 0x38($4)
/* 61BA8 00161AA8 01000324 */  addiu      $3, $0, 0x1
/* 61BAC 00161AAC 300083AC */  sw         $3, 0x30($4)
/* 61BB0 00161AB0 0800E003 */  jr         $31
/* 61BB4 00161AB4 00000000 */   nop
/* 61BB8 00161AB8 00000000 */  nop
/* 61BBC 00161ABC 00000000 */  nop
