.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BuildMenuCompVolume__Fcc
/* 1350E0 00234FE0 3C1E0400 */  dsll32     $3, $4, 24
/* 1350E4 00234FE4 3F1E0300 */  dsra32     $3, $3, 24
/* 1350E8 00234FE8 2A086000 */  slt        $at, $3, $0
/* 1350EC 00234FEC 0C002014 */  bnez       $at, .L00235020
/* 1350F0 00234FF0 00000000 */   nop
/* 1350F4 00234FF4 3C160500 */  dsll32     $2, $5, 24
/* 1350F8 00234FF8 3F160200 */  dsra32     $2, $2, 24
/* 1350FC 00234FFC 2A104300 */  slt        $2, $2, $3
/* 135100 00235000 04004014 */  bnez       $2, .L00235014
/* 135104 00235004 00000000 */   nop
/* 135108 00235008 01000224 */  addiu      $2, $0, 0x1
/* 13510C 0023500C 02000010 */  b          .L00235018
/* 135110 00235010 00000000 */   nop
.L00235014:
/* 135114 00235014 28160070 */  paddub     $2, $0, $0
.L00235018:
/* 135118 00235018 0B000010 */  b          .L00235048
/* 13511C 0023501C 00000000 */   nop
.L00235020:
/* 135120 00235020 23100400 */  negu       $2, $4
/* 135124 00235024 3C260200 */  dsll32     $4, $2, 24
/* 135128 00235028 3F260400 */  dsra32     $4, $4, 24
/* 13512C 0023502C 3C160500 */  dsll32     $2, $5, 24
/* 135130 00235030 3F160200 */  dsra32     $2, $2, 24
/* 135134 00235034 2A088200 */  slt        $at, $4, $2
/* 135138 00235038 01000224 */  addiu      $2, $0, 0x1
/* 13513C 0023503C 0B100100 */  movn       $2, $0, $at
/* 135140 00235040 01000010 */  b          .L00235048
/* 135144 00235044 00000000 */   nop
.L00235048:
/* 135148 00235048 0800E003 */  jr         $31
/* 13514C 0023504C 00000000 */   nop
