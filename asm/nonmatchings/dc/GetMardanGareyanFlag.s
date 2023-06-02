.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMardanGareyanFlag__Fv
/* F1370 001F1270 1C8D828F */  lw         $2, -0x72E4($gp)
/* F1374 001F1274 0100013C */  lui        $at, (0x12F94 >> 16)
/* F1378 001F1278 21084100 */  addu       $at, $2, $at
/* F137C 001F127C 942F228C */  lw         $2, (0x12F94 & 0xFFFF)($at)
/* F1380 001F1280 0800E003 */  jr         $31
/* F1384 001F1284 00000000 */   nop
/* F1388 001F1288 00000000 */  nop
/* F138C 001F128C 00000000 */  nop
