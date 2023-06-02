.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_BODY_COL__FP12RS_STACKDATAi
/* E3AF0 001E39F0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* E3AF4 001E39F4 6000BF7F */  sq         $31, 0x60($sp)
/* E3AF8 001E39F8 5000B47F */  sq         $20, 0x50($sp)
/* E3AFC 001E39FC 4000B37F */  sq         $19, 0x40($sp)
/* E3B00 001E3A00 3000B27F */  sq         $18, 0x30($sp)
/* E3B04 001E3A04 2000B17F */  sq         $17, 0x20($sp)
/* E3B08 001E3A08 1000B07F */  sq         $16, 0x10($sp)
/* E3B0C 001E3A0C 0800B6E7 */  swc1       $f22, 0x8($sp)
/* E3B10 001E3A10 0400B5E7 */  swc1       $f21, 0x4($sp)
/* E3B14 001E3A14 0000B4E7 */  swc1       $f20, 0x0($sp)
/* E3B18 001E3A18 08008324 */  addiu      $3, $4, 0x8
/* E3B1C 001E3A1C B085070C */  jal        GetStackString__FP12RS_STACKDATA_3
/* E3B20 001E3A20 00000000 */   nop
/* E3B24 001E3A24 28864070 */  paddub     $16, $2, $0
/* E3B28 001E3A28 28266070 */  paddub     $4, $3, $0
/* E3B2C 001E3A2C 08008324 */  addiu      $3, $4, 0x8
/* E3B30 001E3A30 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E3B34 001E3A34 00000000 */   nop
/* E3B38 001E3A38 06050046 */  mov.s      $f20, $f0
/* E3B3C 001E3A3C 00A88044 */  mtc1       $0, $f21
/* E3B40 001E3A40 00000000 */  nop
/* E3B44 001E3A44 86AD0046 */  mov.s      $f22, $f21
/* E3B48 001E3A48 04000224 */  addiu      $2, $0, 0x4
/* E3B4C 001E3A4C 0A00A214 */  bne        $5, $2, .L001E3A78
/* E3B50 001E3A50 00000000 */   nop
/* E3B54 001E3A54 28266070 */  paddub     $4, $3, $0
/* E3B58 001E3A58 08008324 */  addiu      $3, $4, 0x8
/* E3B5C 001E3A5C A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E3B60 001E3A60 00000000 */   nop
/* E3B64 001E3A64 46050046 */  mov.s      $f21, $f0
/* E3B68 001E3A68 28266070 */  paddub     $4, $3, $0
/* E3B6C 001E3A6C A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E3B70 001E3A70 00000000 */   nop
/* E3B74 001E3A74 86050046 */  mov.s      $f22, $f0
.L001E3A78:
/* E3B78 001E3A78 E09C828F */  lw         $2, -0x6320($gp)
/* E3B7C 001E3A7C 9000528C */  lw         $18, 0x90($2)
/* E3B80 001E3A80 288E0070 */  paddub     $17, $0, $0
/* E3B84 001E3A84 74000010 */  b          .L001E3C58
/* E3B88 001E3A88 00000000 */   nop
.L001E3A8C:
/* E3B8C 001E3A8C E09C848F */  lw         $4, -0x6320($gp)
/* E3B90 001E3A90 C0101200 */  sll        $2, $18, 3
/* E3B94 001E3A94 21185200 */  addu       $3, $2, $18
/* E3B98 001E3A98 C0100300 */  sll        $2, $3, 3
/* E3B9C 001E3A9C 21106200 */  addu       $2, $3, $2
/* E3BA0 001E3AA0 00A10200 */  sll        $20, $2, 4
/* E3BA4 001E3AA4 21108402 */  addu       $2, $20, $4
/* E3BA8 001E3AA8 80981100 */  sll        $19, $17, 2
/* E3BAC 001E3AAC 21106202 */  addu       $2, $19, $2
/* E3BB0 001E3AB0 0500013C */  lui        $at, (0x55450 >> 16)
/* E3BB4 001E3AB4 21084100 */  addu       $at, $2, $at
/* E3BB8 001E3AB8 5054228C */  lw         $2, (0x55450 & 0xFFFF)($at)
/* E3BBC 001E3ABC 65004014 */  bnez       $2, .L001E3C54
/* E3BC0 001E3AC0 00000000 */   nop
/* E3BC4 001E3AC4 10350224 */  addiu      $2, $0, 0x3510
/* E3BC8 001E3AC8 18104202 */  mult       $2, $18, $2
/* E3BCC 001E3ACC 21104400 */  addu       $2, $2, $4
/* E3BD0 001E3AD0 0200013C */  lui        $at, (0x20000 >> 16)
/* E3BD4 001E3AD4 21084100 */  addu       $at, $2, $at
/* E3BD8 001E3AD8 8CFD248C */  lw         $4, -0x274($at)
/* E3BDC 001E3ADC 282E0072 */  paddub     $5, $16, $0
/* E3BE0 001E3AE0 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* E3BE4 001E3AE4 00000000 */   nop
/* E3BE8 001E3AE8 49004010 */  beqz       $2, .L001E3C10
/* E3BEC 001E3AEC 00000000 */   nop
/* E3BF0 001E3AF0 01000424 */  addiu      $4, $0, 0x1
/* E3BF4 001E3AF4 E09C838F */  lw         $3, -0x6320($gp)
/* E3BF8 001E3AF8 21188302 */  addu       $3, $20, $3
/* E3BFC 001E3AFC 21186302 */  addu       $3, $19, $3
/* E3C00 001E3B00 0500013C */  lui        $at, (0x55450 >> 16)
/* E3C04 001E3B04 21086100 */  addu       $at, $3, $at
/* E3C08 001E3B08 505424AC */  sw         $4, (0x55450 & 0xFFFF)($at)
/* E3C0C 001E3B0C E09C838F */  lw         $3, -0x6320($gp)
/* E3C10 001E3B10 21188302 */  addu       $3, $20, $3
/* E3C14 001E3B14 21186302 */  addu       $3, $19, $3
/* E3C18 001E3B18 0500013C */  lui        $at, (0x55350 >> 16)
/* E3C1C 001E3B1C 21086100 */  addu       $at, $3, $at
/* E3C20 001E3B20 505322AC */  sw         $2, (0x55350 & 0xFFFF)($at)
/* E3C24 001E3B24 E09C828F */  lw         $2, -0x6320($gp)
/* E3C28 001E3B28 21108202 */  addu       $2, $20, $2
/* E3C2C 001E3B2C 21106202 */  addu       $2, $19, $2
/* E3C30 001E3B30 0500013C */  lui        $at, (0x55390 >> 16)
/* E3C34 001E3B34 21084100 */  addu       $at, $2, $at
/* E3C38 001E3B38 905334E4 */  swc1       $f20, (0x55390 & 0xFFFF)($at)
/* E3C3C 001E3B3C E09C828F */  lw         $2, -0x6320($gp)
/* E3C40 001E3B40 21108202 */  addu       $2, $20, $2
/* E3C44 001E3B44 21106202 */  addu       $2, $19, $2
/* E3C48 001E3B48 0500013C */  lui        $at, (0x553D0 >> 16)
/* E3C4C 001E3B4C 21084100 */  addu       $at, $2, $at
/* E3C50 001E3B50 D05335E4 */  swc1       $f21, (0x553D0 & 0xFFFF)($at)
/* E3C54 001E3B54 E09C828F */  lw         $2, -0x6320($gp)
/* E3C58 001E3B58 21108202 */  addu       $2, $20, $2
/* E3C5C 001E3B5C 21106202 */  addu       $2, $19, $2
/* E3C60 001E3B60 0500013C */  lui        $at, (0x55410 >> 16)
/* E3C64 001E3B64 21084100 */  addu       $at, $2, $at
/* E3C68 001E3B68 105436E4 */  swc1       $f22, (0x55410 & 0xFFFF)($at)
/* E3C6C 001E3B6C 282E0070 */  paddub     $5, $0, $0
/* E3C70 001E3B70 0E000010 */  b          .L001E3BAC
/* E3C74 001E3B74 00000000 */   nop
.L001E3B78:
/* E3C78 001E3B78 64000424 */  addiu      $4, $0, 0x64
/* E3C7C 001E3B7C E09C828F */  lw         $2, -0x6320($gp)
/* E3C80 001E3B80 21188202 */  addu       $3, $20, $2
/* E3C84 001E3B84 80101100 */  sll        $2, $17, 2
/* E3C88 001E3B88 21105100 */  addu       $2, $2, $17
/* E3C8C 001E3B8C 80100200 */  sll        $2, $2, 2
/* E3C90 001E3B90 21184300 */  addu       $3, $2, $3
/* E3C94 001E3B94 80100500 */  sll        $2, $5, 2
/* E3C98 001E3B98 21104300 */  addu       $2, $2, $3
/* E3C9C 001E3B9C 0500013C */  lui        $at, (0x55490 >> 16)
/* E3CA0 001E3BA0 21084100 */  addu       $at, $2, $at
/* E3CA4 001E3BA4 905424AC */  sw         $4, (0x55490 & 0xFFFF)($at)
/* E3CA8 001E3BA8 0100A524 */  addiu      $5, $5, 0x1
.L001E3BAC:
/* E3CAC 001E3BAC 0500A228 */  slti       $2, $5, 0x5
/* E3CB0 001E3BB0 F1FF4014 */  bnez       $2, .L001E3B78
/* E3CB4 001E3BB4 00000000 */   nop
/* E3CB8 001E3BB8 282E0070 */  paddub     $5, $0, $0
/* E3CBC 001E3BBC 0E000010 */  b          .L001E3BF8
/* E3CC0 001E3BC0 00000000 */   nop
.L001E3BC4:
/* E3CC4 001E3BC4 64000424 */  addiu      $4, $0, 0x64
/* E3CC8 001E3BC8 E09C828F */  lw         $2, -0x6320($gp)
/* E3CCC 001E3BCC 21188202 */  addu       $3, $20, $2
/* E3CD0 001E3BD0 40101100 */  sll        $2, $17, 1
/* E3CD4 001E3BD4 21105100 */  addu       $2, $2, $17
/* E3CD8 001E3BD8 C0100200 */  sll        $2, $2, 3
/* E3CDC 001E3BDC 21184300 */  addu       $3, $2, $3
/* E3CE0 001E3BE0 80100500 */  sll        $2, $5, 2
/* E3CE4 001E3BE4 21104300 */  addu       $2, $2, $3
/* E3CE8 001E3BE8 0500013C */  lui        $at, (0x555D0 >> 16)
/* E3CEC 001E3BEC 21084100 */  addu       $at, $2, $at
/* E3CF0 001E3BF0 D05524AC */  sw         $4, (0x555D0 & 0xFFFF)($at)
/* E3CF4 001E3BF4 0100A524 */  addiu      $5, $5, 0x1
.L001E3BF8:
/* E3CF8 001E3BF8 0600A228 */  slti       $2, $5, 0x6
/* E3CFC 001E3BFC F1FF4014 */  bnez       $2, .L001E3BC4
/* E3D00 001E3C00 00000000 */   nop
/* E3D04 001E3C04 809491AF */  sw         $17, -0x6B80($gp)
/* E3D08 001E3C08 16000010 */  b          .L001E3C64
/* E3D0C 001E3C0C 00000000 */   nop
.L001E3C10:
/* E3D10 001E3C10 E09C848F */  lw         $4, -0x6320($gp)
/* E3D14 001E3C14 80101200 */  sll        $2, $18, 2
/* E3D18 001E3C18 21185200 */  addu       $3, $2, $18
/* E3D1C 001E3C1C 80100300 */  sll        $2, $3, 2
/* E3D20 001E3C20 21106200 */  addu       $2, $3, $2
/* E3D24 001E3C24 00110200 */  sll        $2, $2, 4
/* E3D28 001E3C28 21184400 */  addu       $3, $2, $4
/* E3D2C 001E3C2C 2A00023C */  lui        $2, %hi(_1010)
/* E3D30 001E3C30 90D04424 */  addiu      $4, $2, %lo(_1010)
/* E3D34 001E3C34 0200013C */  lui        $at, (0x20000 >> 16)
/* E3D38 001E3C38 21086100 */  addu       $at, $3, $at
/* E3D3C 001E3C3C ECE3258C */  lw         $5, -0x1C14($at)
/* E3D40 001E3C40 28360072 */  paddub     $6, $16, $0
/* E3D44 001E3C44 A611040C */  jal        printf
/* E3D48 001E3C48 00000000 */   nop
/* E3D4C 001E3C4C FFFF0224 */  addiu      $2, $0, -0x1
/* E3D50 001E3C50 809482AF */  sw         $2, -0x6B80($gp)
.L001E3C54:
/* E3D54 001E3C54 01003126 */  addiu      $17, $17, 0x1
.L001E3C58:
/* E3D58 001E3C58 1000222A */  slti       $2, $17, 0x10
/* E3D5C 001E3C5C 8BFF4014 */  bnez       $2, .L001E3A8C
/* E3D60 001E3C60 00000000 */   nop
.L001E3C64:
/* E3D64 001E3C64 01000224 */  addiu      $2, $0, 0x1
/* E3D68 001E3C68 6000BF7B */  lq         $31, 0x60($sp)
/* E3D6C 001E3C6C 5000B47B */  lq         $20, 0x50($sp)
/* E3D70 001E3C70 4000B37B */  lq         $19, 0x40($sp)
/* E3D74 001E3C74 3000B27B */  lq         $18, 0x30($sp)
/* E3D78 001E3C78 2000B17B */  lq         $17, 0x20($sp)
/* E3D7C 001E3C7C 1000B07B */  lq         $16, 0x10($sp)
/* E3D80 001E3C80 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* E3D84 001E3C84 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* E3D88 001E3C88 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* E3D8C 001E3C8C 7000BD27 */  addiu      $sp, $sp, 0x70
/* E3D90 001E3C90 0800E003 */  jr         $31
/* E3D94 001E3C94 00000000 */   nop
/* E3D98 001E3C98 00000000 */  nop
/* E3D9C 001E3C9C 00000000 */  nop
