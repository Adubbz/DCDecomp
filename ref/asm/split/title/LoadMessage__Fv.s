.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadMessage__Fv
/* 0037C0 01DAF4C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0037C4 01DAF4C4 0000BF7F */  sq          $31, 0x0($29)
/* 0037C8 01DAF4C8 E101023C */  lui         $2, %hi(Mes1)
/* 0037CC 01DAF4CC F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 0037D0 01DAF4D0 02000524 */  addiu       $5, $0, 0x2
/* 0037D4 01DAF4D4 9836050C */  jal         Preset__6ClsMesFi
/* 0037D8 01DAF4D8 00000000 */   nop
/* 0037DC 01DAF4DC 5A000324 */  addiu       $3, $0, 0x5A
/* 0037E0 01DAF4E0 E101013C */  lui         $1, %hi(Mes1)
/* 0037E4 01DAF4E4 F0CD23AC */  sw          $3, %lo(Mes1)($1)
/* 0037E8 01DAF4E8 5E010324 */  addiu       $3, $0, 0x15E
/* 0037EC 01DAF4EC E101013C */  lui         $1, %hi(Mes1 + 0x4)
/* 0037F0 01DAF4F0 F4CD23AC */  sw          $3, %lo(Mes1 + 0x4)($1)
/* 0037F4 01DAF4F4 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0037F8 01DAF4F8 E101013C */  lui         $1, %hi(Mes1 + 0xA4)
/* 0037FC 01DAF4FC 94CE23AC */  sw          $3, %lo(Mes1 + 0xA4)($1)
/* 003800 01DAF500 E101013C */  lui         $1, %hi(Mes1 + 0xA8)
/* 003804 01DAF504 98CE23AC */  sw          $3, %lo(Mes1 + 0xA8)($1)
/* 003808 01DAF508 E101013C */  lui         $1, %hi(Mes1 + 0x16C8)
/* 00380C 01DAF50C B8E420AC */  sw          $0, %lo(Mes1 + 0x16C8)($1)
/* 003810 01DAF510 1A000324 */  addiu       $3, $0, 0x1A
/* 003814 01DAF514 E101013C */  lui         $1, %hi(Mes1 + 0x174C)
/* 003818 01DAF518 3CE523AC */  sw          $3, %lo(Mes1 + 0x174C)($1)
/* 00381C 01DAF51C D001033C */  lui         $3, %hi(MesWinTexBuff_01)
/* 003820 01DAF520 408B6324 */  addiu       $3, $3, %lo(MesWinTexBuff_01)
/* 003824 01DAF524 E101013C */  lui         $1, %hi(Mes1 + 0x17B0)
/* 003828 01DAF528 A0E523AC */  sw          $3, %lo(Mes1 + 0x17B0)($1)
/* 00382C 01DAF52C 40010324 */  addiu       $3, $0, 0x140
/* 003830 01DAF530 E101013C */  lui         $1, %hi(Mes1 + 0x5C)
/* 003834 01DAF534 4CCE23AC */  sw          $3, %lo(Mes1 + 0x5C)($1)
/* 003838 01DAF538 EA000324 */  addiu       $3, $0, 0xEA
/* 00383C 01DAF53C E101013C */  lui         $1, %hi(Mes1 + 0x60)
/* 003840 01DAF540 50CE23AC */  sw          $3, %lo(Mes1 + 0x60)($1)
/* 003844 01DAF544 08000324 */  addiu       $3, $0, 0x8
/* 003848 01DAF548 E101013C */  lui         $1, %hi(Mes1 + 0x6C)
/* 00384C 01DAF54C 5CCE23AC */  sw          $3, %lo(Mes1 + 0x6C)($1)
/* 003850 01DAF550 40000324 */  addiu       $3, $0, 0x40
/* 003854 01DAF554 E101013C */  lui         $1, %hi(Mes1 + 0x70)
/* 003858 01DAF558 60CE23AC */  sw          $3, %lo(Mes1 + 0x70)($1)
/* 00385C 01DAF55C 36010324 */  addiu       $3, $0, 0x136
/* 003860 01DAF560 E101013C */  lui         $1, %hi(Mes1 + 0x3C)
/* 003864 01DAF564 2CCE23AC */  sw          $3, %lo(Mes1 + 0x3C)($1)
/* 003868 01DAF568 D2000324 */  addiu       $3, $0, 0xD2
/* 00386C 01DAF56C E101013C */  lui         $1, %hi(Mes1 + 0x40)
/* 003870 01DAF570 30CE23AC */  sw          $3, %lo(Mes1 + 0x40)($1)
/* 003874 01DAF574 9886858F */  lw          $5, -0x7968($28)
/* 003878 01DAF578 0700A12C */  sltiu       $1, $5, 0x7
/* 00387C 01DAF57C 3E002010 */  beqz        $1, .L01DAF678_2B4E78
/* 003880 01DAF580 00000000 */   nop
/* 003884 01DAF584 DE01033C */  lui         $3, %hi(LIT_381__3)
/* 003888 01DAF588 40C06424 */  addiu       $4, $3, %lo(LIT_381__3)
/* 00388C 01DAF58C 80180500 */  sll         $3, $5, 2
/* 003890 01DAF590 21186400 */  addu        $3, $3, $4
/* 003894 01DAF594 0000638C */  lw          $3, 0x0($3)
/* 003898 01DAF598 08006000 */  jr          $3
/* 00389C 01DAF59C 00000000 */   nop
/* 0038A0 01DAF5A0 DE01023C */  lui         $2, %hi(LIT_376__6)
/* 0038A4 01DAF5A4 B0BF4424 */  addiu       $4, $2, %lo(LIT_376__6)
/* 0038A8 01DAF5A8 F897858F */  lw          $5, -0x6808($28)
/* 0038AC 01DAF5AC 28360070 */  paddub      $6, $0, $0
/* 0038B0 01DAF5B0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0038B4 01DAF5B4 00000000 */   nop
/* 0038B8 01DAF5B8 2F000010 */  b           .L01DAF678_2B4E78
/* 0038BC 01DAF5BC 00000000 */   nop
/* 0038C0 01DAF5C0 DE01023C */  lui         $2, %hi(LIT_377__5)
/* 0038C4 01DAF5C4 C0BF4424 */  addiu       $4, $2, %lo(LIT_377__5)
/* 0038C8 01DAF5C8 F897858F */  lw          $5, -0x6808($28)
/* 0038CC 01DAF5CC 28360070 */  paddub      $6, $0, $0
/* 0038D0 01DAF5D0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0038D4 01DAF5D4 00000000 */   nop
/* 0038D8 01DAF5D8 27000010 */  b           .L01DAF678_2B4E78
/* 0038DC 01DAF5DC 00000000 */   nop
/* 0038E0 01DAF5E0 DE01023C */  lui         $2, %hi(LIT_377__5)
/* 0038E4 01DAF5E4 C0BF4424 */  addiu       $4, $2, %lo(LIT_377__5)
/* 0038E8 01DAF5E8 F897858F */  lw          $5, -0x6808($28)
/* 0038EC 01DAF5EC 28360070 */  paddub      $6, $0, $0
/* 0038F0 01DAF5F0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0038F4 01DAF5F4 00000000 */   nop
/* 0038F8 01DAF5F8 1F000010 */  b           .L01DAF678_2B4E78
/* 0038FC 01DAF5FC 00000000 */   nop
/* 003900 01DAF600 DE01023C */  lui         $2, %hi(LIT_378__3)
/* 003904 01DAF604 E0BF4424 */  addiu       $4, $2, %lo(LIT_378__3)
/* 003908 01DAF608 F897858F */  lw          $5, -0x6808($28)
/* 00390C 01DAF60C 28360070 */  paddub      $6, $0, $0
/* 003910 01DAF610 D8FC040C */  jal         LoadFile__FPcPvPi
/* 003914 01DAF614 00000000 */   nop
/* 003918 01DAF618 17000010 */  b           .L01DAF678_2B4E78
/* 00391C 01DAF61C 00000000 */   nop
/* 003920 01DAF620 DE01023C */  lui         $2, %hi(LIT_379__2)
/* 003924 01DAF624 00C04424 */  addiu       $4, $2, %lo(LIT_379__2)
/* 003928 01DAF628 F897858F */  lw          $5, -0x6808($28)
/* 00392C 01DAF62C 28360070 */  paddub      $6, $0, $0
/* 003930 01DAF630 D8FC040C */  jal         LoadFile__FPcPvPi
/* 003934 01DAF634 00000000 */   nop
/* 003938 01DAF638 0F000010 */  b           .L01DAF678_2B4E78
/* 00393C 01DAF63C 00000000 */   nop
/* 003940 01DAF640 DE01023C */  lui         $2, %hi(LIT_380__3)
/* 003944 01DAF644 20C04424 */  addiu       $4, $2, %lo(LIT_380__3)
/* 003948 01DAF648 F897858F */  lw          $5, -0x6808($28)
/* 00394C 01DAF64C 28360070 */  paddub      $6, $0, $0
/* 003950 01DAF650 D8FC040C */  jal         LoadFile__FPcPvPi
/* 003954 01DAF654 00000000 */   nop
/* 003958 01DAF658 07000010 */  b           .L01DAF678_2B4E78
/* 00395C 01DAF65C 00000000 */   nop
/* 003960 01DAF660 DE01023C */  lui         $2, %hi(LIT_377__5)
/* 003964 01DAF664 C0BF4424 */  addiu       $4, $2, %lo(LIT_377__5)
/* 003968 01DAF668 F897858F */  lw          $5, -0x6808($28)
/* 00396C 01DAF66C 28360070 */  paddub      $6, $0, $0
/* 003970 01DAF670 D8FC040C */  jal         LoadFile__FPcPvPi
/* 003974 01DAF674 00000000 */   nop
.L01DAF678_2B4E78:
/* 003978 01DAF678 F897838F */  lw          $3, -0x6808($28)
/* 00397C 01DAF67C E101013C */  lui         $1, %hi(Mes1 + 0x17A0)
/* 003980 01DAF680 90E523AC */  sw          $3, %lo(Mes1 + 0x17A0)($1)
/* 003984 01DAF684 E101013C */  lui         $1, %hi(Mes1 + 0x17A8)
/* 003988 01DAF688 98E523AC */  sw          $3, %lo(Mes1 + 0x17A8)($1)
/* 00398C 01DAF68C 02006484 */  lh          $4, 0x2($3)
/* 003990 01DAF690 E101013C */  lui         $1, %hi(Mes1 + 0x17A8)
/* 003994 01DAF694 98E5238C */  lw          $3, %lo(Mes1 + 0x17A8)($1)
/* 003998 01DAF698 21186400 */  addu        $3, $3, $4
/* 00399C 01DAF69C E101013C */  lui         $1, %hi(Mes1 + 0x17A8)
/* 0039A0 01DAF6A0 98E523AC */  sw          $3, %lo(Mes1 + 0x17A8)($1)
/* 0039A4 01DAF6A4 0000BF7B */  lq          $31, 0x0($29)
/* 0039A8 01DAF6A8 1000BD27 */  addiu       $29, $29, 0x10
/* 0039AC 01DAF6AC 0800E003 */  jr          $31
/* 0039B0 01DAF6B0 00000000 */   nop
/* 0039B4 01DAF6B4 00000000 */  nop
/* 0039B8 01DAF6B8 00000000 */  nop
/* 0039BC 01DAF6BC 00000000 */  nop
