.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpGetVolSQ__Fi
/* 0055F0 01DB12F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0055F4 01DB12F4 0000BF7F */  sq          $31, 0x0($29)
/* 0055F8 01DB12F8 01000324 */  addiu       $3, $0, 0x1
/* 0055FC 01DB12FC 0C008310 */  beq         $4, $3, .L01DB1330_2B6B30
/* 005600 01DB1300 00000000 */   nop
/* 005604 01DB1304 03008010 */  beqz        $4, .L01DB1314_2B6B14
/* 005608 01DB1308 00000000 */   nop
/* 00560C 01DB130C 0F000010 */  b           .L01DB134C_2B6B4C
/* 005610 01DB1310 00000000 */   nop
.L01DB1314_2B6B14:
/* 005614 01DB1314 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 005618 01DB1318 D40E050C */  jal         GetMidiState__6CSoundFv
/* 00561C 01DB131C 00000000 */   nop
/* 005620 01DB1320 3000428C */  lw          $2, 0x30($2)
/* 005624 01DB1324 0C00428C */  lw          $2, 0xC($2)
/* 005628 01DB1328 08000010 */  b           .L01DB134C_2B6B4C
/* 00562C 01DB132C 00000000 */   nop
.L01DB1330_2B6B30:
/* 005630 01DB1330 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 005634 01DB1334 D40E050C */  jal         GetMidiState__6CSoundFv
/* 005638 01DB1338 00000000 */   nop
/* 00563C 01DB133C 3000428C */  lw          $2, 0x30($2)
/* 005640 01DB1340 0C00428C */  lw          $2, 0xC($2)
/* 005644 01DB1344 01000010 */  b           .L01DB134C_2B6B4C
/* 005648 01DB1348 00000000 */   nop
.L01DB134C_2B6B4C:
/* 00564C 01DB134C 0000BF7B */  lq          $31, 0x0($29)
/* 005650 01DB1350 1000BD27 */  addiu       $29, $29, 0x10
/* 005654 01DB1354 0800E003 */  jr          $31
/* 005658 01DB1358 00000000 */   nop
/* 00565C 01DB135C 00000000 */  nop
