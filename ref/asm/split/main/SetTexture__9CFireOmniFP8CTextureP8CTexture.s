.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetTexture__9CFireOmniFP8CTextureP8CTexture
/* 061BA0 00161AA0 340085AC */  sw          $5, 0x34($4)
/* 061BA4 00161AA4 380086AC */  sw          $6, 0x38($4)
/* 061BA8 00161AA8 01000324 */  addiu       $3, $0, 0x1
/* 061BAC 00161AAC 300083AC */  sw          $3, 0x30($4)
/* 061BB0 00161AB0 0800E003 */  jr          $31
/* 061BB4 00161AB4 00000000 */   nop
/* 061BB8 00161AB8 00000000 */  nop
/* 061BBC 00161ABC 00000000 */  nop
