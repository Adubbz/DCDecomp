.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdInitOpenItemBox__FP9CFrameVu1P9CFrameVu1
/* 73BA0 00173AA0 AC8F80AF */  sw         $0, -0x7054($gp)
/* 73BA4 00173AA4 A88F80AF */  sw         $0, -0x7058($gp)
/* 73BA8 00173AA8 B08F80AF */  sw         $0, -0x7050($gp)
/* 73BAC 00173AAC B48F84AF */  sw         $4, -0x704C($gp)
/* 73BB0 00173AB0 B88F85AF */  sw         $5, -0x7048($gp)
/* 73BB4 00173AB4 0800E003 */  jr         $31
/* 73BB8 00173AB8 00000000 */   nop
/* 73BBC 00173ABC 00000000 */  nop
