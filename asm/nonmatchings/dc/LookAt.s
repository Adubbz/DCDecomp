.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LookAt__FP9CFrameVu1Pf16_FRAMECONSTRAINT
/* 49A10 00149910 70FEBD27 */  addiu      $sp, $sp, -0x190
/* 49A14 00149914 4000BF7F */  sq         $31, 0x40($sp)
/* 49A18 00149918 3000B27F */  sq         $18, 0x30($sp)
/* 49A1C 0014991C 2000B17F */  sq         $17, 0x20($sp)
/* 49A20 00149920 1000B07F */  sq         $16, 0x10($sp)
/* 49A24 00149924 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 49A28 00149928 28868070 */  paddub     $16, $4, $0
/* 49A2C 0014992C 2896A070 */  paddub     $18, $5, $0
/* 49A30 00149930 288EC070 */  paddub     $17, $6, $0
/* 49A34 00149934 D000A427 */  addiu      $4, $sp, 0xD0
/* 49A38 00149938 2A86040C */  jal        sceVu0UnitMatrix
/* 49A3C 0014993C 00000000 */   nop
/* 49A40 00149940 1001048E */  lw         $4, 0x110($16)
/* 49A44 00149944 D000A527 */  addiu      $5, $sp, 0xD0
/* 49A48 00149948 6CA0040C */  jal        GetLWMatrix__6CFrameFPA4_f
/* 49A4C 0014994C 00000000 */   nop
/* 49A50 00149950 1001A427 */  addiu      $4, $sp, 0x110
/* 49A54 00149954 2A86040C */  jal        sceVu0UnitMatrix
/* 49A58 00149958 00000000 */   nop
/* 49A5C 0014995C 1001A427 */  addiu      $4, $sp, 0x110
/* 49A60 00149960 D0010526 */  addiu      $5, $16, 0x1D0
/* 49A64 00149964 1086040C */  jal        sceVu0CopyMatrix
/* 49A68 00149968 00000000 */   nop
/* 49A6C 0014996C 02000224 */  addiu      $2, $0, 0x2
/* 49A70 00149970 05002216 */  bne        $17, $2, .L00149988
/* 49A74 00149974 00000000 */   nop
/* 49A78 00149978 5000A427 */  addiu      $4, $sp, 0x50
/* 49A7C 0014997C 1001A527 */  addiu      $5, $sp, 0x110
/* 49A80 00149980 9285040C */  jal        sceVu0Normalize
/* 49A84 00149984 00000000 */   nop
.L00149988:
/* 49A88 00149988 01000224 */  addiu      $2, $0, 0x1
/* 49A8C 0014998C 05002216 */  bne        $17, $2, .L001499A4
/* 49A90 00149990 00000000 */   nop
/* 49A94 00149994 5000A427 */  addiu      $4, $sp, 0x50
/* 49A98 00149998 2001A527 */  addiu      $5, $sp, 0x120
/* 49A9C 0014999C 9285040C */  jal        sceVu0Normalize
/* 49AA0 001499A0 00000000 */   nop
.L001499A4:
/* 49AA4 001499A4 05002016 */  bnez       $17, .L001499BC
/* 49AA8 001499A8 00000000 */   nop
/* 49AAC 001499AC 5000A427 */  addiu      $4, $sp, 0x50
/* 49AB0 001499B0 3001A527 */  addiu      $5, $sp, 0x130
/* 49AB4 001499B4 9285040C */  jal        sceVu0Normalize
/* 49AB8 001499B8 00000000 */   nop
.L001499BC:
/* 49ABC 001499BC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 49AC0 001499C0 5C00A2AF */  sw         $2, 0x5C($sp)
/* 49AC4 001499C4 CC00A2AF */  sw         $2, 0xCC($sp)
/* 49AC8 001499C8 C000A427 */  addiu      $4, $sp, 0xC0
/* 49ACC 001499CC 282E4072 */  paddub     $5, $18, $0
/* 49AD0 001499D0 0001A627 */  addiu      $6, $sp, 0x100
/* 49AD4 001499D4 EE85040C */  jal        sceVu0SubVector
/* 49AD8 001499D8 00000000 */   nop
/* 49ADC 001499DC C000A427 */  addiu      $4, $sp, 0xC0
/* 49AE0 001499E0 D000A527 */  addiu      $5, $sp, 0xD0
/* 49AE4 001499E4 8885040C */  jal        sceVu0InnerProduct
/* 49AE8 001499E8 00000000 */   nop
/* 49AEC 001499EC 6000A0E7 */  swc1       $f0, 0x60($sp)
/* 49AF0 001499F0 C000A427 */  addiu      $4, $sp, 0xC0
/* 49AF4 001499F4 E000A527 */  addiu      $5, $sp, 0xE0
/* 49AF8 001499F8 8885040C */  jal        sceVu0InnerProduct
/* 49AFC 001499FC 00000000 */   nop
/* 49B00 00149A00 6400A0E7 */  swc1       $f0, 0x64($sp)
/* 49B04 00149A04 C000A427 */  addiu      $4, $sp, 0xC0
/* 49B08 00149A08 F000A527 */  addiu      $5, $sp, 0xF0
/* 49B0C 00149A0C 8885040C */  jal        sceVu0InnerProduct
/* 49B10 00149A10 00000000 */   nop
/* 49B14 00149A14 6800A0E7 */  swc1       $f0, 0x68($sp)
/* 49B18 00149A18 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 49B1C 00149A1C 6C00A2AF */  sw         $2, 0x6C($sp)
/* 49B20 00149A20 6000A427 */  addiu      $4, $sp, 0x60
/* 49B24 00149A24 588D040C */  jal        DistVector__FPf
/* 49B28 00149A28 00000000 */   nop
/* 49B2C 00149A2C BC8081C7 */  lwc1       $f1, -0x7F44($gp)
/* 49B30 00149A30 36000146 */  c.le.s     $f0, $f1
/* 49B34 00149A34 00000000 */  nop
/* 49B38 00149A38 5B000145 */  bc1t       .L00149BA8
/* 49B3C 00149A3C 00000000 */   nop
/* 49B40 00149A40 8000A427 */  addiu      $4, $sp, 0x80
/* 49B44 00149A44 6000A527 */  addiu      $5, $sp, 0x60
/* 49B48 00149A48 9285040C */  jal        sceVu0Normalize
/* 49B4C 00149A4C 00000000 */   nop
/* 49B50 00149A50 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 49B54 00149A54 8C00A2AF */  sw         $2, 0x8C($sp)
/* 49B58 00149A58 7000A427 */  addiu      $4, $sp, 0x70
/* 49B5C 00149A5C 5000A527 */  addiu      $5, $sp, 0x50
/* 49B60 00149A60 9285040C */  jal        sceVu0Normalize
/* 49B64 00149A64 00000000 */   nop
/* 49B68 00149A68 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 49B6C 00149A6C 7C00A2AF */  sw         $2, 0x7C($sp)
/* 49B70 00149A70 9000A427 */  addiu      $4, $sp, 0x90
/* 49B74 00149A74 7000A527 */  addiu      $5, $sp, 0x70
/* 49B78 00149A78 8000A627 */  addiu      $6, $sp, 0x80
/* 49B7C 00149A7C 8085040C */  jal        sceVu0OuterProduct
/* 49B80 00149A80 00000000 */   nop
/* 49B84 00149A84 A000A427 */  addiu      $4, $sp, 0xA0
/* 49B88 00149A88 9000A527 */  addiu      $5, $sp, 0x90
/* 49B8C 00149A8C 9285040C */  jal        sceVu0Normalize
/* 49B90 00149A90 00000000 */   nop
/* 49B94 00149A94 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 49B98 00149A98 AC00A2AF */  sw         $2, 0xAC($sp)
/* 49B9C 00149A9C 9000A427 */  addiu      $4, $sp, 0x90
/* 49BA0 00149AA0 A000A527 */  addiu      $5, $sp, 0xA0
/* 49BA4 00149AA4 7000A627 */  addiu      $6, $sp, 0x70
/* 49BA8 00149AA8 8085040C */  jal        sceVu0OuterProduct
/* 49BAC 00149AAC 00000000 */   nop
/* 49BB0 00149AB0 B000A427 */  addiu      $4, $sp, 0xB0
/* 49BB4 00149AB4 9000A527 */  addiu      $5, $sp, 0x90
/* 49BB8 00149AB8 9285040C */  jal        sceVu0Normalize
/* 49BBC 00149ABC 00000000 */   nop
/* 49BC0 00149AC0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 49BC4 00149AC4 BC00A2AF */  sw         $2, 0xBC($sp)
/* 49BC8 00149AC8 8000A427 */  addiu      $4, $sp, 0x80
/* 49BCC 00149ACC B000A527 */  addiu      $5, $sp, 0xB0
/* 49BD0 00149AD0 8885040C */  jal        sceVu0InnerProduct
/* 49BD4 00149AD4 00000000 */   nop
/* 49BD8 00149AD8 06050046 */  mov.s      $f20, $f0
/* 49BDC 00149ADC C08080C7 */  lwc1       $f0, -0x7F40($gp)
/* 49BE0 00149AE0 34A00046 */  c.lt.s     $f20, $f0
/* 49BE4 00149AE4 00000000 */  nop
/* 49BE8 00149AE8 2F000045 */  bc1f       .L00149BA8
/* 49BEC 00149AEC 00000000 */   nop
/* 49BF0 00149AF0 5001A427 */  addiu      $4, $sp, 0x150
/* 49BF4 00149AF4 2A86040C */  jal        sceVu0UnitMatrix
/* 49BF8 00149AF8 00000000 */   nop
/* 49BFC 00149AFC 06A30046 */  mov.s      $f12, $f20
/* 49C00 00149B00 1077040C */  jal        acosf
/* 49C04 00149B04 00000000 */   nop
/* 49C08 00149B08 06050046 */  mov.s      $f20, $f0
/* 49C0C 00149B0C C48080C7 */  lwc1       $f0, -0x7F3C($gp)
/* 49C10 00149B10 36A00046 */  c.le.s     $f20, $f0
/* 49C14 00149B14 00000000 */  nop
/* 49C18 00149B18 02000145 */  bc1t       .L00149B24
/* 49C1C 00149B1C 00000000 */   nop
/* 49C20 00149B20 06050046 */  mov.s      $f20, $f0
.L00149B24:
/* 49C24 00149B24 7000A427 */  addiu      $4, $sp, 0x70
/* 49C28 00149B28 8000A527 */  addiu      $5, $sp, 0x80
/* 49C2C 00149B2C 8885040C */  jal        sceVu0InnerProduct
/* 49C30 00149B30 00000000 */   nop
/* 49C34 00149B34 06030046 */  mov.s      $f12, $f0
/* 49C38 00149B38 1077040C */  jal        acosf
/* 49C3C 00149B3C 00000000 */   nop
/* 49C40 00149B40 C88081C7 */  lwc1       $f1, -0x7F38($gp)
/* 49C44 00149B44 36000146 */  c.le.s     $f0, $f1
/* 49C48 00149B48 00000000 */  nop
/* 49C4C 00149B4C 08000145 */  bc1t       .L00149B70
/* 49C50 00149B50 00000000 */   nop
/* 49C54 00149B54 07A30046 */  neg.s      $f12, $f20
/* 49C58 00149B58 5001A427 */  addiu      $4, $sp, 0x150
/* 49C5C 00149B5C A000A527 */  addiu      $5, $sp, 0xA0
/* 49C60 00149B60 E425050C */  jal        SetRotationMatrixFromDir__FPA4_fPff
/* 49C64 00149B64 00000000 */   nop
/* 49C68 00149B68 06000010 */  b          .L00149B84
/* 49C6C 00149B6C 00000000 */   nop
.L00149B70:
/* 49C70 00149B70 5001A427 */  addiu      $4, $sp, 0x150
/* 49C74 00149B74 A000A527 */  addiu      $5, $sp, 0xA0
/* 49C78 00149B78 06A30046 */  mov.s      $f12, $f20
/* 49C7C 00149B7C E425050C */  jal        SetRotationMatrixFromDir__FPA4_fPff
/* 49C80 00149B80 00000000 */   nop
.L00149B84:
/* 49C84 00149B84 1001A427 */  addiu      $4, $sp, 0x110
/* 49C88 00149B88 5001A527 */  addiu      $5, $sp, 0x150
/* 49C8C 00149B8C 28368070 */  paddub     $6, $4, $0
/* 49C90 00149B90 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 49C94 00149B94 00000000 */   nop
/* 49C98 00149B98 28260072 */  paddub     $4, $16, $0
/* 49C9C 00149B9C 1001A527 */  addiu      $5, $sp, 0x110
/* 49CA0 00149BA0 58A1040C */  jal        SetTransMatrix__6CFrameFPA4_f
/* 49CA4 00149BA4 00000000 */   nop
.L00149BA8:
/* 49CA8 00149BA8 28160070 */  paddub     $2, $0, $0
/* 49CAC 00149BAC 4000BF7B */  lq         $31, 0x40($sp)
/* 49CB0 00149BB0 3000B27B */  lq         $18, 0x30($sp)
/* 49CB4 00149BB4 2000B17B */  lq         $17, 0x20($sp)
/* 49CB8 00149BB8 1000B07B */  lq         $16, 0x10($sp)
/* 49CBC 00149BBC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 49CC0 00149BC0 9001BD27 */  addiu      $sp, $sp, 0x190
/* 49CC4 00149BC4 0800E003 */  jr         $31
/* 49CC8 00149BC8 00000000 */   nop
/* 49CCC 00149BCC 00000000 */  nop
