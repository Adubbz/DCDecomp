.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitOpenItemBox__FP9CFrameVu1P9CFrameVu1
/* 073BA0 00173AA0 AC8F80AF */  sw          $0, -0x7054($28)
/* 073BA4 00173AA4 A88F80AF */  sw          $0, -0x7058($28)
/* 073BA8 00173AA8 B08F80AF */  sw          $0, -0x7050($28)
/* 073BAC 00173AAC B48F84AF */  sw          $4, -0x704C($28)
/* 073BB0 00173AB0 B88F85AF */  sw          $5, -0x7048($28)
/* 073BB4 00173AB4 0800E003 */  jr          $31
/* 073BB8 00173AB8 00000000 */   nop
/* 073BBC 00173ABC 00000000 */  nop
