.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ezMidiInit__Fv
/* 47A70 00147970 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 47A74 00147974 0000BF7F */  sq         $31, 0x0($sp)
/* 47A78 00147978 28260070 */  paddub     $4, $0, $0
/* 47A7C 0014797C 125B040C */  jal        sceSifInitRpc
/* 47A80 00147980 00000000 */   nop
.L00147984:
/* 47A84 00147984 CF01023C */  lui        $2, %hi(gCd)
/* 47A88 00147988 C0CE4424 */  addiu      $4, $2, %lo(gCd)
/* 47A8C 0014798C 0100023C */  lui        $2, (0x12346 >> 16)
/* 47A90 00147990 46234534 */  ori        $5, $2, (0x12346 & 0xFFFF)
/* 47A94 00147994 28360070 */  paddub     $6, $0, $0
/* 47A98 00147998 B65C040C */  jal        sceSifBindRpc
/* 47A9C 0014799C 00000000 */   nop
/* 47AA0 001479A0 07004104 */  bgez       $2, .L001479C0
/* 47AA4 001479A4 00000000 */   nop
/* 47AA8 001479A8 2A00023C */  lui        $2, %hi(_25)
/* 47AAC 001479AC 209A4424 */  addiu      $4, $2, %lo(_25)
/* 47AB0 001479B0 A611040C */  jal        printf
/* 47AB4 001479B4 00000000 */   nop
.L001479B8:
/* 47AB8 001479B8 FFFF0010 */  b          .L001479B8
/* 47ABC 001479BC 00000000 */   nop
.L001479C0:
/* 47AC0 001479C0 10270324 */  addiu      $3, $0, 0x2710
.L001479C4:
/* 47AC4 001479C4 28166070 */  paddub     $2, $3, $0
/* 47AC8 001479C8 FFFF6324 */  addiu      $3, $3, -0x1
/* 47ACC 001479CC FDFF4014 */  bnez       $2, .L001479C4
/* 47AD0 001479D0 00000000 */   nop
/* 47AD4 001479D4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 47AD8 001479D8 E4CE228C */  lw         $2, -0x311C($at)
/* 47ADC 001479DC E9FF4010 */  beqz       $2, .L00147984
/* 47AE0 001479E0 00000000 */   nop
/* 47AE4 001479E4 01000224 */  addiu      $2, $0, 0x1
/* 47AE8 001479E8 0000BF7B */  lq         $31, 0x0($sp)
/* 47AEC 001479EC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 47AF0 001479F0 0800E003 */  jr         $31
/* 47AF4 001479F4 00000000 */   nop
/* 47AF8 001479F8 00000000 */  nop
/* 47AFC 001479FC 00000000 */  nop
