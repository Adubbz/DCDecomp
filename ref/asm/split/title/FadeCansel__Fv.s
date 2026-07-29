.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FadeCansel__Fv
/* 005660 01DB1360 F0FFBD27 */  addiu       $29, $29, -0x10
/* 005664 01DB1364 0000BF7F */  sq          $31, 0x0($29)
/* 005668 01DB1368 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00566C 01DB136C D40E050C */  jal         GetMidiState__6CSoundFv
/* 005670 01DB1370 00000000 */   nop
/* 005674 01DB1374 5C0040AC */  sw          $0, 0x5C($2)
/* 005678 01DB1378 5C0140AC */  sw          $0, 0x15C($2)
/* 00567C 01DB137C EC0040AC */  sw          $0, 0xEC($2)
/* 005680 01DB1380 6C0240AC */  sw          $0, 0x26C($2)
/* 005684 01DB1384 EC0240AC */  sw          $0, 0x2EC($2)
/* 005688 01DB1388 6C0340AC */  sw          $0, 0x36C($2)
/* 00568C 01DB138C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 005690 01DB1390 0F000524 */  addiu       $5, $0, 0xF
/* 005694 01DB1394 00010624 */  addiu       $6, $0, 0x100
/* 005698 01DB1398 581A050C */  jal         SetVol__6CSoundFii
/* 00569C 01DB139C 00000000 */   nop
/* 0056A0 01DB13A0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0056A4 01DB13A4 0E000524 */  addiu       $5, $0, 0xE
/* 0056A8 01DB13A8 00010624 */  addiu       $6, $0, 0x100
/* 0056AC 01DB13AC 581A050C */  jal         SetVol__6CSoundFii
/* 0056B0 01DB13B0 00000000 */   nop
/* 0056B4 01DB13B4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0056B8 01DB13B8 0D000524 */  addiu       $5, $0, 0xD
/* 0056BC 01DB13BC 00010624 */  addiu       $6, $0, 0x100
/* 0056C0 01DB13C0 581A050C */  jal         SetVol__6CSoundFii
/* 0056C4 01DB13C4 00000000 */   nop
/* 0056C8 01DB13C8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0056CC 01DB13CC 0C000524 */  addiu       $5, $0, 0xC
/* 0056D0 01DB13D0 00010624 */  addiu       $6, $0, 0x100
/* 0056D4 01DB13D4 581A050C */  jal         SetVol__6CSoundFii
/* 0056D8 01DB13D8 00000000 */   nop
/* 0056DC 01DB13DC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0056E0 01DB13E0 C817050C */  jal         Step__6CSoundFv
/* 0056E4 01DB13E4 00000000 */   nop
/* 0056E8 01DB13E8 0000BF7B */  lq          $31, 0x0($29)
/* 0056EC 01DB13EC 1000BD27 */  addiu       $29, $29, 0x10
/* 0056F0 01DB13F0 0800E003 */  jr          $31
/* 0056F4 01DB13F4 00000000 */   nop
/* 0056F8 01DB13F8 00000000 */  nop
/* 0056FC 01DB13FC 00000000 */  nop
