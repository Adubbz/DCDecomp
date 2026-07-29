.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetFollow__13CCameraFollowFfff
/* 024BE0 00124AE0 C0028CE4 */  swc1        $f12, 0x2C0($4)
/* 024BE4 00124AE4 C4028DE4 */  swc1        $f13, 0x2C4($4)
/* 024BE8 00124AE8 C8028EE4 */  swc1        $f14, 0x2C8($4)
/* 024BEC 00124AEC 0800E003 */  jr          $31
/* 024BF0 00124AF0 00000000 */   nop
/* 024BF4 00124AF4 00000000 */  nop
/* 024BF8 00124AF8 00000000 */  nop
/* 024BFC 00124AFC 00000000 */  nop
