.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BuildMenuCompVolume__Fss
/* 135150 00235050 3C1C0400 */  dsll32     $3, $4, 16
/* 135154 00235054 3F1C0300 */  dsra32     $3, $3, 16
/* 135158 00235058 2A086000 */  slt        $at, $3, $0
/* 13515C 0023505C 0C002014 */  bnez       $at, .L00235090
/* 135160 00235060 00000000 */   nop
/* 135164 00235064 3C140500 */  dsll32     $2, $5, 16
/* 135168 00235068 3F140200 */  dsra32     $2, $2, 16
/* 13516C 0023506C 2A104300 */  slt        $2, $2, $3
/* 135170 00235070 04004014 */  bnez       $2, .L00235084
/* 135174 00235074 00000000 */   nop
/* 135178 00235078 01000224 */  addiu      $2, $0, 0x1
/* 13517C 0023507C 02000010 */  b          .L00235088
/* 135180 00235080 00000000 */   nop
.L00235084:
/* 135184 00235084 28160070 */  paddub     $2, $0, $0
.L00235088:
/* 135188 00235088 0B000010 */  b          .L002350B8
/* 13518C 0023508C 00000000 */   nop
.L00235090:
/* 135190 00235090 23100400 */  negu       $2, $4
/* 135194 00235094 3C240200 */  dsll32     $4, $2, 16
/* 135198 00235098 3F240400 */  dsra32     $4, $4, 16
/* 13519C 0023509C 3C140500 */  dsll32     $2, $5, 16
/* 1351A0 002350A0 3F140200 */  dsra32     $2, $2, 16
/* 1351A4 002350A4 2A088200 */  slt        $at, $4, $2
/* 1351A8 002350A8 01000224 */  addiu      $2, $0, 0x1
/* 1351AC 002350AC 0B100100 */  movn       $2, $0, $at
/* 1351B0 002350B0 01000010 */  b          .L002350B8
/* 1351B4 002350B4 00000000 */   nop
.L002350B8:
/* 1351B8 002350B8 0800E003 */  jr         $31
/* 1351BC 002350BC 00000000 */   nop
