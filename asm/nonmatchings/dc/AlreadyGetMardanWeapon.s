.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AlreadyGetMardanWeapon__Fv
/* F14A0 001F13A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* F14A4 001F13A4 0000BF7F */  sq         $31, 0x0($sp)
/* F14A8 001F13A8 1C8D848F */  lw         $4, -0x72E4($gp)
/* F14AC 001F13AC CA000524 */  addiu      $5, $0, 0xCA
/* F14B0 001F13B0 8060050C */  jal        GetGameFlag__9CSaveDataFi
/* F14B4 001F13B4 00000000 */   nop
/* F14B8 001F13B8 0B004014 */  bnez       $2, .L001F13E8
/* F14BC 001F13BC 00000000 */   nop
/* F14C0 001F13C0 9CC4070C */  jal        GetMardanGareyanFlag__Fv
/* F14C4 001F13C4 00000000 */   nop
/* F14C8 001F13C8 04004018 */  blez       $2, .L001F13DC
/* F14CC 001F13CC 00000000 */   nop
/* F14D0 001F13D0 01000224 */  addiu      $2, $0, 0x1
/* F14D4 001F13D4 02000010 */  b          .L001F13E0
/* F14D8 001F13D8 00000000 */   nop
.L001F13DC:
/* F14DC 001F13DC 02000224 */  addiu      $2, $0, 0x2
.L001F13E0:
/* F14E0 001F13E0 07000010 */  b          .L001F1400
/* F14E4 001F13E4 00000000 */   nop
.L001F13E8:
/* F14E8 001F13E8 01000324 */  addiu      $3, $0, 0x1
/* F14EC 001F13EC 04004314 */  bne        $2, $3, .L001F1400
/* F14F0 001F13F0 00000000 */   nop
/* F14F4 001F13F4 28160070 */  paddub     $2, $0, $0
/* F14F8 001F13F8 01000010 */  b          .L001F1400
/* F14FC 001F13FC 00000000 */   nop
.L001F1400:
/* F1500 001F1400 0000BF7B */  lq         $31, 0x0($sp)
/* F1504 001F1404 1000BD27 */  addiu      $sp, $sp, 0x10
/* F1508 001F1408 0800E003 */  jr         $31
/* F150C 001F140C 00000000 */   nop
