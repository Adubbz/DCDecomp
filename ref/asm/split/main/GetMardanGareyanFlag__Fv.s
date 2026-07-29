.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMardanGareyanFlag__Fv
/* 0F1370 001F1270 1C8D828F */  lw          $2, -0x72E4($28)
/* 0F1374 001F1274 0100013C */  lui         $1, (0x12F94 >> 16)
/* 0F1378 001F1278 21084100 */  addu        $1, $2, $1
/* 0F137C 001F127C 942F228C */  lw          $2, (0x12F94 & 0xFFFF)($1)
/* 0F1380 001F1280 0800E003 */  jr          $31
/* 0F1384 001F1284 00000000 */   nop
/* 0F1388 001F1288 00000000 */  nop
/* 0F138C 001F128C 00000000 */  nop
