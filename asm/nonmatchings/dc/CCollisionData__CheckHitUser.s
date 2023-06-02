.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckHitUser__14CCollisionDataFPfif
/* B5A20 001B5920 80FFBD27 */  addiu      $sp, $sp, -0x80
/* B5A24 001B5924 5000BF7F */  sq         $31, 0x50($sp)
/* B5A28 001B5928 4000B37F */  sq         $19, 0x40($sp)
/* B5A2C 001B592C 3000B27F */  sq         $18, 0x30($sp)
/* B5A30 001B5930 2000B17F */  sq         $17, 0x20($sp)
/* B5A34 001B5934 1000B07F */  sq         $16, 0x10($sp)
/* B5A38 001B5938 0400B5E7 */  swc1       $f21, 0x4($sp)
/* B5A3C 001B593C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B5A40 001B5940 289E8070 */  paddub     $19, $4, $0
/* B5A44 001B5944 2886A070 */  paddub     $16, $5, $0
/* B5A48 001B5948 2896C070 */  paddub     $18, $6, $0
/* B5A4C 001B594C 06650046 */  mov.s      $f20, $f12
/* B5A50 001B5950 6000A427 */  addiu      $4, $sp, 0x60
/* B5A54 001B5954 0C86040C */  jal        sceVu0CopyVector
/* B5A58 001B5958 00000000 */   nop
/* B5A5C 001B595C 6400A0AF */  sw         $0, 0x64($sp)
/* B5A60 001B5960 040015C6 */  lwc1       $f21, 0x4($16)
/* B5A64 001B5964 00AD1446 */  add.s      $f20, $f21, $f20
/* B5A68 001B5968 28860070 */  paddub     $16, $0, $0
/* B5A6C 001B596C 4D000010 */  b          .L001B5AA4
/* B5A70 001B5970 00000000 */   nop
.L001B5974:
/* B5A74 001B5974 80181000 */  sll        $3, $16, 2
/* B5A78 001B5978 21107300 */  addu       $2, $3, $19
/* B5A7C 001B597C 003C428C */  lw         $2, 0x3C00($2)
/* B5A80 001B5980 47004010 */  beqz       $2, .L001B5AA0
/* B5A84 001B5984 00000000 */   nop
/* B5A88 001B5988 21107000 */  addu       $2, $3, $16
/* B5A8C 001B598C 40890200 */  sll        $17, $2, 5
/* B5A90 001B5990 21283302 */  addu       $5, $17, $19
/* B5A94 001B5994 4800A28C */  lw         $2, 0x48($5)
/* B5A98 001B5998 24104202 */  and        $2, $18, $2
/* B5A9C 001B599C 40004010 */  beqz       $2, .L001B5AA0
/* B5AA0 001B59A0 00000000 */   nop
/* B5AA4 001B59A4 7000A38C */  lw         $3, 0x70($5)
/* B5AA8 001B59A8 7400A28C */  lw         $2, 0x74($5)
/* B5AAC 001B59AC 3C006214 */  bne        $3, $2, .L001B5AA0
/* B5AB0 001B59B0 00000000 */   nop
/* B5AB4 001B59B4 7000A427 */  addiu      $4, $sp, 0x70
/* B5AB8 001B59B8 0C86040C */  jal        sceVu0CopyVector
/* B5ABC 001B59BC 00000000 */   nop
/* B5AC0 001B59C0 7400A0AF */  sw         $0, 0x74($sp)
/* B5AC4 001B59C4 6000A427 */  addiu      $4, $sp, 0x60
/* B5AC8 001B59C8 7000A527 */  addiu      $5, $sp, 0x70
/* B5ACC 001B59CC 648D040C */  jal        DistVector__FPfPf
/* B5AD0 001B59D0 00000000 */   nop
/* B5AD4 001B59D4 21103302 */  addu       $2, $17, $19
/* B5AD8 001B59D8 3C0041C4 */  lwc1       $f1, 0x3C($2)
/* B5ADC 001B59DC 36000146 */  c.le.s     $f0, $f1
/* B5AE0 001B59E0 00000000 */  nop
/* B5AE4 001B59E4 2E000045 */  bc1f       .L001B5AA0
/* B5AE8 001B59E8 00000000 */   nop
/* B5AEC 001B59EC 01000324 */  addiu      $3, $0, 0x1
/* B5AF0 001B59F0 040042C4 */  lwc1       $f2, 0x4($2)
/* B5AF4 001B59F4 00100146 */  add.s      $f0, $f2, $f1
/* B5AF8 001B59F8 41100146 */  sub.s      $f1, $f2, $f1
/* B5AFC 001B59FC 34001446 */  c.lt.s     $f0, $f20
/* B5B00 001B5A00 00000000 */  nop
/* B5B04 001B5A04 06000145 */  bc1t       .L001B5A20
/* B5B08 001B5A08 00000000 */   nop
/* B5B0C 001B5A0C 34081446 */  c.lt.s     $f1, $f20
/* B5B10 001B5A10 00000000 */  nop
/* B5B14 001B5A14 02000045 */  bc1f       .L001B5A20
/* B5B18 001B5A18 00000000 */   nop
/* B5B1C 001B5A1C 281E0070 */  paddub     $3, $0, $0
.L001B5A20:
/* B5B20 001B5A20 34001546 */  c.lt.s     $f0, $f21
/* B5B24 001B5A24 00000000 */  nop
/* B5B28 001B5A28 06000145 */  bc1t       .L001B5A44
/* B5B2C 001B5A2C 00000000 */   nop
/* B5B30 001B5A30 34081546 */  c.lt.s     $f1, $f21
/* B5B34 001B5A34 00000000 */  nop
/* B5B38 001B5A38 02000045 */  bc1f       .L001B5A44
/* B5B3C 001B5A3C 00000000 */   nop
/* B5B40 001B5A40 281E0070 */  paddub     $3, $0, $0
.L001B5A44:
/* B5B44 001B5A44 36001446 */  c.le.s     $f0, $f20
/* B5B48 001B5A48 00000000 */  nop
/* B5B4C 001B5A4C 06000045 */  bc1f       .L001B5A68
/* B5B50 001B5A50 00000000 */   nop
/* B5B54 001B5A54 36081546 */  c.le.s     $f1, $f21
/* B5B58 001B5A58 00000000 */  nop
/* B5B5C 001B5A5C 02000145 */  bc1t       .L001B5A68
/* B5B60 001B5A60 00000000 */   nop
/* B5B64 001B5A64 281E0070 */  paddub     $3, $0, $0
.L001B5A68:
/* B5B68 001B5A68 34001446 */  c.lt.s     $f0, $f20
/* B5B6C 001B5A6C 00000000 */  nop
/* B5B70 001B5A70 06000145 */  bc1t       .L001B5A8C
/* B5B74 001B5A74 00000000 */   nop
/* B5B78 001B5A78 34081546 */  c.lt.s     $f1, $f21
/* B5B7C 001B5A7C 00000000 */  nop
/* B5B80 001B5A80 02000045 */  bc1f       .L001B5A8C
/* B5B84 001B5A84 00000000 */   nop
/* B5B88 001B5A88 281E0070 */  paddub     $3, $0, $0
.L001B5A8C:
/* B5B8C 001B5A8C 04006014 */  bnez       $3, .L001B5AA0
/* B5B90 001B5A90 00000000 */   nop
/* B5B94 001B5A94 28160072 */  paddub     $2, $16, $0
/* B5B98 001B5A98 06000010 */  b          .L001B5AB4
/* B5B9C 001B5A9C 00000000 */   nop
.L001B5AA0:
/* B5BA0 001B5AA0 01001026 */  addiu      $16, $16, 0x1
.L001B5AA4:
/* B5BA4 001B5AA4 6000022A */  slti       $2, $16, 0x60
/* B5BA8 001B5AA8 B2FF4014 */  bnez       $2, .L001B5974
/* B5BAC 001B5AAC 00000000 */   nop
/* B5BB0 001B5AB0 FFFF0224 */  addiu      $2, $0, -0x1
.L001B5AB4:
/* B5BB4 001B5AB4 5000BF7B */  lq         $31, 0x50($sp)
/* B5BB8 001B5AB8 4000B37B */  lq         $19, 0x40($sp)
/* B5BBC 001B5ABC 3000B27B */  lq         $18, 0x30($sp)
/* B5BC0 001B5AC0 2000B17B */  lq         $17, 0x20($sp)
/* B5BC4 001B5AC4 1000B07B */  lq         $16, 0x10($sp)
/* B5BC8 001B5AC8 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* B5BCC 001B5ACC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B5BD0 001B5AD0 8000BD27 */  addiu      $sp, $sp, 0x80
/* B5BD4 001B5AD4 0800E003 */  jr         $31
/* B5BD8 001B5AD8 00000000 */   nop
/* B5BDC 001B5ADC 00000000 */  nop
