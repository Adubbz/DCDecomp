.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ResetStatusInfo__Fv
/* 015600 01DC1300 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 015604 01DC1304 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 015608 01DC1308 FFFF0324 */  addiu       $3, $0, -0x1
/* 01560C 01DC130C DC01013C */  lui         $1, %hi(BtActStatus + 0x4)
/* 015610 01DC1310 844423AC */  sw          $3, %lo(BtActStatus + 0x4)($1)
/* 015614 01DC1314 DC01013C */  lui         $1, %hi(BtActStatus + 0x8)
/* 015618 01DC1318 884423AC */  sw          $3, %lo(BtActStatus + 0x8)($1)
/* 01561C 01DC131C DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 015620 01DC1320 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 015624 01DC1324 DC01013C */  lui         $1, %hi(BtActStatus + 0x40)
/* 015628 01DC1328 C04420AC */  sw          $0, %lo(BtActStatus + 0x40)($1)
/* 01562C 01DC132C DC01013C */  lui         $1, %hi(BtActStatus + 0x4C)
/* 015630 01DC1330 CC4420AC */  sw          $0, %lo(BtActStatus + 0x4C)($1)
/* 015634 01DC1334 DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 015638 01DC1338 A04420AC */  sw          $0, %lo(BtActStatus + 0x20)($1)
/* 01563C 01DC133C DC01013C */  lui         $1, %hi(BtActStatus + 0x24)
/* 015640 01DC1340 A44420AC */  sw          $0, %lo(BtActStatus + 0x24)($1)
/* 015644 01DC1344 DC01013C */  lui         $1, %hi(BtActStatus + 0x5C)
/* 015648 01DC1348 DC4420AC */  sw          $0, %lo(BtActStatus + 0x5C)($1)
/* 01564C 01DC134C DC01013C */  lui         $1, %hi(BtActStatus + 0x60)
/* 015650 01DC1350 E04420AC */  sw          $0, %lo(BtActStatus + 0x60)($1)
/* 015654 01DC1354 01000324 */  addiu       $3, $0, 0x1
/* 015658 01DC1358 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 01565C 01DC135C E44423A4 */  sh          $3, %lo(BtActStatus + 0x64)($1)
/* 015660 01DC1360 DC01013C */  lui         $1, %hi(BtActStatus + 0x66)
/* 015664 01DC1364 E64423A4 */  sh          $3, %lo(BtActStatus + 0x66)($1)
/* 015668 01DC1368 DC01013C */  lui         $1, %hi(BtActStatus + 0x68)
/* 01566C 01DC136C E84420AC */  sw          $0, %lo(BtActStatus + 0x68)($1)
/* 015670 01DC1370 DC01013C */  lui         $1, %hi(BtActStatus + 0x6C)
/* 015674 01DC1374 EC4420AC */  sw          $0, %lo(BtActStatus + 0x6C)($1)
/* 015678 01DC1378 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 01567C 01DC137C F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 015680 01DC1380 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 015684 01DC1384 184520AC */  sw          $0, %lo(BtActStatus + 0x98)($1)
/* 015688 01DC1388 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 01568C 01DC138C 944420AC */  sw          $0, %lo(BtActStatus + 0x14)($1)
/* 015690 01DC1390 100E0324 */  addiu       $3, $0, 0xE10
/* 015694 01DC1394 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 015698 01DC1398 604523AC */  sw          $3, %lo(BtActStatus + 0xE0)($1)
/* 01569C 01DC139C DC01013C */  lui         $1, %hi(BtActStatus + 0xE8)
/* 0156A0 01DC13A0 684520AC */  sw          $0, %lo(BtActStatus + 0xE8)($1)
/* 0156A4 01DC13A4 DC01013C */  lui         $1, %hi(BtActStatus + 0xF0)
/* 0156A8 01DC13A8 704520AC */  sw          $0, %lo(BtActStatus + 0xF0)($1)
/* 0156AC 01DC13AC DC01013C */  lui         $1, %hi(BtActStatus + 0x110)
/* 0156B0 01DC13B0 904520AC */  sw          $0, %lo(BtActStatus + 0x110)($1)
/* 0156B4 01DC13B4 DC01013C */  lui         $1, %hi(BtActStatus + 0x114)
/* 0156B8 01DC13B8 944520AC */  sw          $0, %lo(BtActStatus + 0x114)($1)
/* 0156BC 01DC13BC DC01013C */  lui         $1, %hi(BtActStatus + 0x124)
/* 0156C0 01DC13C0 A44520AC */  sw          $0, %lo(BtActStatus + 0x124)($1)
/* 0156C4 01DC13C4 0A000324 */  addiu       $3, $0, 0xA
/* 0156C8 01DC13C8 DC01013C */  lui         $1, %hi(BtActStatus + 0xF8)
/* 0156CC 01DC13CC 784523AC */  sw          $3, %lo(BtActStatus + 0xF8)($1)
/* 0156D0 01DC13D0 EC9C80AF */  sw          $0, -0x6314($28)
/* 0156D4 01DC13D4 E49C80AF */  sw          $0, -0x631C($28)
/* 0156D8 01DC13D8 DC01013C */  lui         $1, %hi(BtActStatus + 0x144)
/* 0156DC 01DC13DC C44520A4 */  sh          $0, %lo(BtActStatus + 0x144)($1)
/* 0156E0 01DC13E0 DC01013C */  lui         $1, %hi(BtActStatus + 0x146)
/* 0156E4 01DC13E4 C64520A4 */  sh          $0, %lo(BtActStatus + 0x146)($1)
/* 0156E8 01DC13E8 DC01013C */  lui         $1, %hi(BtActStatus + 0x148)
/* 0156EC 01DC13EC C84520A4 */  sh          $0, %lo(BtActStatus + 0x148)($1)
/* 0156F0 01DC13F0 0800E003 */  jr          $31
/* 0156F4 01DC13F4 00000000 */   nop
/* 0156F8 01DC13F8 00000000 */  nop
/* 0156FC 01DC13FC 00000000 */  nop
