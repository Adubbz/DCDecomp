.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetNextRef__7CCameraFP6CFramefff
/* 024480 00124380 90028CE4 */  swc1        $f12, 0x290($4)
/* 024484 00124384 94028DE4 */  swc1        $f13, 0x294($4)
/* 024488 00124388 98028EE4 */  swc1        $f14, 0x298($4)
/* 02448C 0012438C 0800E003 */  jr          $31
/* 024490 00124390 00000000 */   nop
/* 024494 00124394 00000000 */  nop
/* 024498 00124398 00000000 */  nop
/* 02449C 0012439C 00000000 */  nop
