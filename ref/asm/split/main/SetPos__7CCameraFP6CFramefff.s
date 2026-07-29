.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPos__7CCameraFP6CFramefff
/* 024360 00124260 80028CE4 */  swc1        $f12, 0x280($4)
/* 024364 00124264 60028CE4 */  swc1        $f12, 0x260($4)
/* 024368 00124268 84028DE4 */  swc1        $f13, 0x284($4)
/* 02436C 0012426C 64028DE4 */  swc1        $f13, 0x264($4)
/* 024370 00124270 88028EE4 */  swc1        $f14, 0x288($4)
/* 024374 00124274 68028EE4 */  swc1        $f14, 0x268($4)
/* 024378 00124278 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 02437C 0012427C 8C0283AC */  sw          $3, 0x28C($4)
/* 024380 00124280 6C0283AC */  sw          $3, 0x26C($4)
/* 024384 00124284 0800E003 */  jr          $31
/* 024388 00124288 00000000 */   nop
/* 02438C 0012428C 00000000 */  nop
