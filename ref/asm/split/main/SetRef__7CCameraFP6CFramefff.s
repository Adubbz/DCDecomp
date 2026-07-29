.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRef__7CCameraFP6CFramefff
/* 0243F0 001242F0 70028CE4 */  swc1        $f12, 0x270($4)
/* 0243F4 001242F4 90028CE4 */  swc1        $f12, 0x290($4)
/* 0243F8 001242F8 74028DE4 */  swc1        $f13, 0x274($4)
/* 0243FC 001242FC 94028DE4 */  swc1        $f13, 0x294($4)
/* 024400 00124300 78028EE4 */  swc1        $f14, 0x278($4)
/* 024404 00124304 98028EE4 */  swc1        $f14, 0x298($4)
/* 024408 00124308 0800E003 */  jr          $31
/* 02440C 0012430C 00000000 */   nop
