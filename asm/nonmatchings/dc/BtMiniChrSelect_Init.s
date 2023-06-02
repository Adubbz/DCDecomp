.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtMiniChrSelect_Init__Fi
/* D3390 001D3290 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D3394 001D3294 1000BF7F */  sq         $31, 0x10($sp)
/* D3398 001D3298 0000B07F */  sq         $16, 0x0($sp)
/* D339C 001D329C 28868070 */  paddub     $16, $4, $0
/* D33A0 001D32A0 28260070 */  paddub     $4, $0, $0
/* D33A4 001D32A4 B004770C */  jal        func_1DC12C0
/* D33A8 001D32A8 00000000 */   nop
/* D33AC 001D32AC EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D33B0 001D32B0 907620AC */  sw         $0, (0x1EA7690 & 0xFFFF)($at)
/* D33B4 001D32B4 4C9480AF */  sw         $0, -0x6BB4($gp)
/* D33B8 001D32B8 509490AF */  sw         $16, -0x6BB0($gp)
/* D33BC 001D32BC 1000BF7B */  lq         $31, 0x10($sp)
/* D33C0 001D32C0 0000B07B */  lq         $16, 0x0($sp)
/* D33C4 001D32C4 2000BD27 */  addiu      $sp, $sp, 0x20
/* D33C8 001D32C8 0800E003 */  jr         $31
/* D33CC 001D32CC 00000000 */   nop
