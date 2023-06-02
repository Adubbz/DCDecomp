.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel chkAtraFloor__Fii
/* C0A40 001C0940 06008228 */  slti       $2, $4, 0x6
/* C0A44 001C0944 04004014 */  bnez       $2, .L001C0958
/* C0A48 001C0948 00000000 */   nop
/* C0A4C 001C094C 28160070 */  paddub     $2, $0, $0
/* C0A50 001C0950 16000010 */  b          .L001C09AC
/* C0A54 001C0954 00000000 */   nop
.L001C0958:
/* C0A58 001C0958 80180400 */  sll        $3, $4, 2
/* C0A5C 001C095C 2800023C */  lui        $2, %hi(noEntryTbl)
/* C0A60 001C0960 009E4224 */  addiu      $2, $2, %lo(noEntryTbl)
/* C0A64 001C0964 21104300 */  addu       $2, $2, $3
/* C0A68 001C0968 0000438C */  lw         $3, 0x0($2)
/* C0A6C 001C096C 28260070 */  paddub     $4, $0, $0
/* C0A70 001C0970 07000010 */  b          .L001C0990
/* C0A74 001C0974 00000000 */   nop
.L001C0978:
/* C0A78 001C0978 0400A614 */  bne        $5, $6, .L001C098C
/* C0A7C 001C097C 00000000 */   nop
/* C0A80 001C0980 28160070 */  paddub     $2, $0, $0
/* C0A84 001C0984 09000010 */  b          .L001C09AC
/* C0A88 001C0988 00000000 */   nop
.L001C098C:
/* C0A8C 001C098C 01008424 */  addiu      $4, $4, 0x1
.L001C0990:
/* C0A90 001C0990 80100400 */  sll        $2, $4, 2
/* C0A94 001C0994 21106200 */  addu       $2, $3, $2
/* C0A98 001C0998 0000468C */  lw         $6, 0x0($2)
/* C0A9C 001C099C FFFF0224 */  addiu      $2, $0, -0x1
/* C0AA0 001C09A0 F5FFC214 */  bne        $6, $2, .L001C0978
/* C0AA4 001C09A4 00000000 */   nop
/* C0AA8 001C09A8 01000224 */  addiu      $2, $0, 0x1
.L001C09AC:
/* C0AAC 001C09AC 0800E003 */  jr         $31
/* C0AB0 001C09B0 00000000 */   nop
/* C0AB4 001C09B4 00000000 */  nop
/* C0AB8 001C09B8 00000000 */  nop
/* C0ABC 001C09BC 00000000 */  nop
