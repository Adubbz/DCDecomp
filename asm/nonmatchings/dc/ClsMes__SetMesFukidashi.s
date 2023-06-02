.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMesFukidashi__6ClsMesFi
/* 4DCB0 0014DBB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4DCB4 0014DBB4 1000BF7F */  sq         $31, 0x10($sp)
/* 4DCB8 0014DBB8 0000B07F */  sq         $16, 0x0($sp)
/* 4DCBC 0014DBBC 28868070 */  paddub     $16, $4, $0
/* 4DCC0 0014DBC0 01000624 */  addiu      $6, $0, 0x1
/* 4DCC4 0014DBC4 5B00A610 */  beq        $5, $6, .L0014DD34
/* 4DCC8 0014DBC8 00000000 */   nop
/* 4DCCC 0014DBCC 02000424 */  addiu      $4, $0, 0x2
/* 4DCD0 0014DBD0 4300A410 */  beq        $5, $4, .L0014DCE0
/* 4DCD4 0014DBD4 00000000 */   nop
/* 4DCD8 0014DBD8 03000324 */  addiu      $3, $0, 0x3
/* 4DCDC 0014DBDC 2C00A310 */  beq        $5, $3, .L0014DC90
/* 4DCE0 0014DBE0 00000000 */   nop
/* 4DCE4 0014DBE4 04000324 */  addiu      $3, $0, 0x4
/* 4DCE8 0014DBE8 1400A310 */  beq        $5, $3, .L0014DC3C
/* 4DCEC 0014DBEC 00000000 */   nop
/* 4DCF0 0014DBF0 05000324 */  addiu      $3, $0, 0x5
/* 4DCF4 0014DBF4 0300A310 */  beq        $5, $3, .L0014DC04
/* 4DCF8 0014DBF8 00000000 */   nop
/* 4DCFC 0014DBFC 51000010 */  b          .L0014DD44
/* 4DD00 0014DC00 00000000 */   nop
.L0014DC04:
/* 4DD04 0014DC04 0D000324 */  addiu      $3, $0, 0xD
/* 4DD08 0014DC08 080003AE */  sw         $3, 0x8($16)
/* 4DD0C 0014DC0C 14000324 */  addiu      $3, $0, 0x14
/* 4DD10 0014DC10 0C0003AE */  sw         $3, 0xC($16)
/* 4DD14 0014DC14 340000AE */  sw         $0, 0x34($16)
/* 4DD18 0014DC18 980000AE */  sw         $0, 0x98($16)
/* 4DD1C 0014DC1C A81606AE */  sw         $6, 0x16A8($16)
/* 4DD20 0014DC20 A816038E */  lw         $3, 0x16A8($16)
/* 4DD24 0014DC24 AC1603AE */  sw         $3, 0x16AC($16)
/* 4DD28 0014DC28 C41606AE */  sw         $6, 0x16C4($16)
/* 4DD2C 0014DC2C C01604AE */  sw         $4, 0x16C0($16)
/* 4DD30 0014DC30 D01606AE */  sw         $6, 0x16D0($16)
/* 4DD34 0014DC34 4F000010 */  b          .L0014DD74
/* 4DD38 0014DC38 00000000 */   nop
.L0014DC3C:
/* 4DD3C 0014DC3C 0D000224 */  addiu      $2, $0, 0xD
/* 4DD40 0014DC40 080002AE */  sw         $2, 0x8($16)
/* 4DD44 0014DC44 14000224 */  addiu      $2, $0, 0x14
/* 4DD48 0014DC48 0C0002AE */  sw         $2, 0xC($16)
/* 4DD4C 0014DC4C 340000AE */  sw         $0, 0x34($16)
/* 4DD50 0014DC50 980000AE */  sw         $0, 0x98($16)
/* 4DD54 0014DC54 BF80023C */  lui        $2, (0x80BFBFBF >> 16)
/* 4DD58 0014DC58 BFBF4434 */  ori        $4, $2, (0x80BFBFBF & 0xFFFF)
/* 4DD5C 0014DC5C 8432050C */  jal        Color2Clut__FUi
/* 4DD60 0014DC60 00000000 */   nop
/* 4DD64 0014DC64 FF004330 */  andi       $3, $2, 0xFF
/* 4DD68 0014DC68 A81603AE */  sw         $3, 0x16A8($16)
/* 4DD6C 0014DC6C A816038E */  lw         $3, 0x16A8($16)
/* 4DD70 0014DC70 AC1603AE */  sw         $3, 0x16AC($16)
/* 4DD74 0014DC74 01000424 */  addiu      $4, $0, 0x1
/* 4DD78 0014DC78 C41604AE */  sw         $4, 0x16C4($16)
/* 4DD7C 0014DC7C 03000324 */  addiu      $3, $0, 0x3
/* 4DD80 0014DC80 C01603AE */  sw         $3, 0x16C0($16)
/* 4DD84 0014DC84 D01604AE */  sw         $4, 0x16D0($16)
/* 4DD88 0014DC88 3A000010 */  b          .L0014DD74
/* 4DD8C 0014DC8C 00000000 */   nop
.L0014DC90:
/* 4DD90 0014DC90 0B000224 */  addiu      $2, $0, 0xB
/* 4DD94 0014DC94 080002AE */  sw         $2, 0x8($16)
/* 4DD98 0014DC98 14000224 */  addiu      $2, $0, 0x14
/* 4DD9C 0014DC9C 0C0002AE */  sw         $2, 0xC($16)
/* 4DDA0 0014DCA0 340000AE */  sw         $0, 0x34($16)
/* 4DDA4 0014DCA4 980006AE */  sw         $6, 0x98($16)
/* 4DDA8 0014DCA8 BF80023C */  lui        $2, (0x80BFBFBF >> 16)
/* 4DDAC 0014DCAC BFBF4434 */  ori        $4, $2, (0x80BFBFBF & 0xFFFF)
/* 4DDB0 0014DCB0 8432050C */  jal        Color2Clut__FUi
/* 4DDB4 0014DCB4 00000000 */   nop
/* 4DDB8 0014DCB8 FF004330 */  andi       $3, $2, 0xFF
/* 4DDBC 0014DCBC A81603AE */  sw         $3, 0x16A8($16)
/* 4DDC0 0014DCC0 A816038E */  lw         $3, 0x16A8($16)
/* 4DDC4 0014DCC4 AC1603AE */  sw         $3, 0x16AC($16)
/* 4DDC8 0014DCC8 C41600AE */  sw         $0, 0x16C4($16)
/* 4DDCC 0014DCCC 02000324 */  addiu      $3, $0, 0x2
/* 4DDD0 0014DCD0 C01603AE */  sw         $3, 0x16C0($16)
/* 4DDD4 0014DCD4 D01600AE */  sw         $0, 0x16D0($16)
/* 4DDD8 0014DCD8 26000010 */  b          .L0014DD74
/* 4DDDC 0014DCDC 00000000 */   nop
.L0014DCE0:
/* 4DDE0 0014DCE0 0B000224 */  addiu      $2, $0, 0xB
/* 4DDE4 0014DCE4 080002AE */  sw         $2, 0x8($16)
/* 4DDE8 0014DCE8 14000224 */  addiu      $2, $0, 0x14
/* 4DDEC 0014DCEC 0C0002AE */  sw         $2, 0xC($16)
/* 4DDF0 0014DCF0 340000AE */  sw         $0, 0x34($16)
/* 4DDF4 0014DCF4 980000AE */  sw         $0, 0x98($16)
/* 4DDF8 0014DCF8 BF80023C */  lui        $2, (0x80BFBFBF >> 16)
/* 4DDFC 0014DCFC BFBF4434 */  ori        $4, $2, (0x80BFBFBF & 0xFFFF)
/* 4DE00 0014DD00 8432050C */  jal        Color2Clut__FUi
/* 4DE04 0014DD04 00000000 */   nop
/* 4DE08 0014DD08 FF004330 */  andi       $3, $2, 0xFF
/* 4DE0C 0014DD0C A81603AE */  sw         $3, 0x16A8($16)
/* 4DE10 0014DD10 A816038E */  lw         $3, 0x16A8($16)
/* 4DE14 0014DD14 AC1603AE */  sw         $3, 0x16AC($16)
/* 4DE18 0014DD18 01000424 */  addiu      $4, $0, 0x1
/* 4DE1C 0014DD1C C41604AE */  sw         $4, 0x16C4($16)
/* 4DE20 0014DD20 04000324 */  addiu      $3, $0, 0x4
/* 4DE24 0014DD24 C01603AE */  sw         $3, 0x16C0($16)
/* 4DE28 0014DD28 D01604AE */  sw         $4, 0x16D0($16)
/* 4DE2C 0014DD2C 11000010 */  b          .L0014DD74
/* 4DE30 0014DD30 00000000 */   nop
.L0014DD34:
/* 4DE34 0014DD34 340000AE */  sw         $0, 0x34($16)
/* 4DE38 0014DD38 C41600AE */  sw         $0, 0x16C4($16)
/* 4DE3C 0014DD3C 0D000010 */  b          .L0014DD74
/* 4DE40 0014DD40 00000000 */   nop
.L0014DD44:
/* 4DE44 0014DD44 0B000324 */  addiu      $3, $0, 0xB
/* 4DE48 0014DD48 080003AE */  sw         $3, 0x8($16)
/* 4DE4C 0014DD4C 14000324 */  addiu      $3, $0, 0x14
/* 4DE50 0014DD50 0C0003AE */  sw         $3, 0xC($16)
/* 4DE54 0014DD54 340006AE */  sw         $6, 0x34($16)
/* 4DE58 0014DD58 980000AE */  sw         $0, 0x98($16)
/* 4DE5C 0014DD5C A81606AE */  sw         $6, 0x16A8($16)
/* 4DE60 0014DD60 A816038E */  lw         $3, 0x16A8($16)
/* 4DE64 0014DD64 AC1603AE */  sw         $3, 0x16AC($16)
/* 4DE68 0014DD68 C41606AE */  sw         $6, 0x16C4($16)
/* 4DE6C 0014DD6C C01600AE */  sw         $0, 0x16C0($16)
/* 4DE70 0014DD70 D01606AE */  sw         $6, 0x16D0($16)
.L0014DD74:
/* 4DE74 0014DD74 1000BF7B */  lq         $31, 0x10($sp)
/* 4DE78 0014DD78 0000B07B */  lq         $16, 0x0($sp)
/* 4DE7C 0014DD7C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 4DE80 0014DD80 0800E003 */  jr         $31
/* 4DE84 0014DD84 00000000 */   nop
/* 4DE88 0014DD88 00000000 */  nop
/* 4DE8C 0014DD8C 00000000 */  nop
