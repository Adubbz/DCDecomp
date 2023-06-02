.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sqrt
/* 1DC30 0011DB30 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 1DC34 0011DB34 3000B0FF */  sd         $16, 0x30($sp)
/* 1DC38 0011DB38 2D808000 */  daddu      $16, $4, $0
/* 1DC3C 0011DB3C 7000B4FF */  sd         $20, 0x70($sp)
/* 1DC40 0011DB40 5000B2FF */  sd         $18, 0x50($sp)
/* 1DC44 0011DB44 4000B1FF */  sd         $17, 0x40($sp)
/* 1DC48 0011DB48 2A00143C */  lui        $20, (0x2A0000 >> 16)
/* 1DC4C 0011DB4C 8000BFFF */  sd         $31, 0x80($sp)
/* 1DC50 0011DB50 AC67040C */  jal        __ieee754_sqrt
/* 1DC54 0011DB54 6000B3FF */   sd        $19, 0x60($sp)
/* 1DC58 0011DB58 2D884000 */  daddu      $17, $2, $0
/* 1DC5C 0011DB5C 308A928E */  lw         $18, -0x75D0($20)
/* 1DC60 0011DB60 FFFF0224 */  addiu      $2, $0, -0x1
/* 1DC64 0011DB64 2D004212 */  beq        $18, $2, .L0011DC1C
/* 1DC68 0011DB68 2D102002 */   daddu     $2, $17, $0
/* 1DC6C 0011DB6C 0612040C */  jal        isnan
/* 1DC70 0011DB70 2D200002 */   daddu     $4, $16, $0
/* 1DC74 0011DB74 29004014 */  bnez       $2, .L0011DC1C
/* 1DC78 0011DB78 2D102002 */   daddu     $2, $17, $0
/* 1DC7C 0011DB7C 2D980000 */  daddu      $19, $0, $0
/* 1DC80 0011DB80 2D200002 */  daddu      $4, $16, $0
/* 1DC84 0011DB84 E840040C */  jal        dpcmp
/* 1DC88 0011DB88 2D286002 */   daddu     $5, $19, $0
/* 1DC8C 0011DB8C 23004104 */  bgez       $2, .L0011DC1C
/* 1DC90 0011DB90 2D102002 */   daddu     $2, $17, $0
/* 1DC94 0011DB94 2A00023C */  lui        $2, %hi(D_00298A98)
/* 1DC98 0011DB98 01000324 */  addiu      $3, $0, 0x1
/* 1DC9C 0011DB9C 988A4224 */  addiu      $2, $2, %lo(D_00298A98)
/* 1DCA0 0011DBA0 0000A3AF */  sw         $3, 0x0($sp)
/* 1DCA4 0011DBA4 0400A2AF */  sw         $2, 0x4($sp)
/* 1DCA8 0011DBA8 0800B0FF */  sd         $16, 0x8($sp)
/* 1DCAC 0011DBAC 2000A0AF */  sw         $0, 0x20($sp)
/* 1DCB0 0011DBB0 03004016 */  bnez       $18, .L0011DBC0
/* 1DCB4 0011DBB4 1000B0FF */   sd        $16, 0x10($sp)
/* 1DCB8 0011DBB8 04000010 */  b          .L0011DBCC
/* 1DCBC 0011DBBC 1800B3FF */   sd        $19, 0x18($sp)
.L0011DBC0:
/* 1DCC0 0011DBC0 2A00023C */  lui        $2, (0x2A0000 >> 16)
/* 1DCC4 0011DBC4 A08A43DC */  ld         $3, -0x7560($2)
/* 1DCC8 0011DBC8 1800A3FF */  sd         $3, 0x18($sp)
.L0011DBCC:
/* 1DCCC 0011DBCC 308A838E */  lw         $3, -0x75D0($20)
/* 1DCD0 0011DBD0 02000224 */  addiu      $2, $0, 0x2
/* 1DCD4 0011DBD4 05006210 */  beq        $3, $2, .L0011DBEC
/* 1DCD8 0011DBD8 00000000 */   nop
/* 1DCDC 0011DBDC BA74040C */  jal        matherr
/* 1DCE0 0011DBE0 2D20A003 */   daddu     $4, $sp, $0
/* 1DCE4 0011DBE4 06004014 */  bnez       $2, .L0011DC00
/* 1DCE8 0011DBE8 2000A28F */   lw        $2, 0x20($sp)
.L0011DBEC:
/* 1DCEC 0011DBEC D805040C */  jal        __errno
/* 1DCF0 0011DBF0 00000000 */   nop
/* 1DCF4 0011DBF4 21000324 */  addiu      $3, $0, 0x21
/* 1DCF8 0011DBF8 000043AC */  sw         $3, 0x0($2)
/* 1DCFC 0011DBFC 2000A28F */  lw         $2, 0x20($sp)
.L0011DC00:
/* 1DD00 0011DC00 06004050 */  beql       $2, $0, .L0011DC1C
/* 1DD04 0011DC04 1800A2DF */   ld        $2, 0x18($sp)
/* 1DD08 0011DC08 D805040C */  jal        __errno
/* 1DD0C 0011DC0C 00000000 */   nop
/* 1DD10 0011DC10 2000A38F */  lw         $3, 0x20($sp)
/* 1DD14 0011DC14 000043AC */  sw         $3, 0x0($2)
/* 1DD18 0011DC18 1800A2DF */  ld         $2, 0x18($sp)
.L0011DC1C:
/* 1DD1C 0011DC1C 8000BFDF */  ld         $31, 0x80($sp)
/* 1DD20 0011DC20 7000B4DF */  ld         $20, 0x70($sp)
/* 1DD24 0011DC24 6000B3DF */  ld         $19, 0x60($sp)
/* 1DD28 0011DC28 5000B2DF */  ld         $18, 0x50($sp)
/* 1DD2C 0011DC2C 4000B1DF */  ld         $17, 0x40($sp)
/* 1DD30 0011DC30 3000B0DF */  ld         $16, 0x30($sp)
/* 1DD34 0011DC34 0800E003 */  jr         $31
/* 1DD38 0011DC38 9000BD27 */   addiu     $sp, $sp, 0x90
/* 1DD3C 0011DC3C 00000000 */  nop
