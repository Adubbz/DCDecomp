.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckViewLevel__12CMonstorUnitFv
/* D9AA0 001D99A0 00FFBD27 */  addiu      $sp, $sp, -0x100
/* D9AA4 001D99A4 5000BF7F */  sq         $31, 0x50($sp)
/* D9AA8 001D99A8 4000B47F */  sq         $20, 0x40($sp)
/* D9AAC 001D99AC 3000B37F */  sq         $19, 0x30($sp)
/* D9AB0 001D99B0 2000B27F */  sq         $18, 0x20($sp)
/* D9AB4 001D99B4 1000B17F */  sq         $17, 0x10($sp)
/* D9AB8 001D99B8 0000B07F */  sq         $16, 0x0($sp)
/* D9ABC 001D99BC 28A68070 */  paddub     $20, $4, $0
/* D9AC0 001D99C0 6000A427 */  addiu      $4, $sp, 0x60
/* D9AC4 001D99C4 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* D9AC8 001D99C8 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* D9ACC 001D99CC 0C86040C */  jal        sceVu0CopyVector
/* D9AD0 001D99D0 00000000 */   nop
/* D9AD4 001D99D4 28860070 */  paddub     $16, $0, $0
/* D9AD8 001D99D8 282E0070 */  paddub     $5, $0, $0
/* D9ADC 001D99DC 06000010 */  b          .L001D99F8
/* D9AE0 001D99E0 00000000 */   nop
.L001D99E4:
/* D9AE4 001D99E4 FFFF0424 */  addiu      $4, $0, -0x1
/* D9AE8 001D99E8 80180500 */  sll        $3, $5, 2
/* D9AEC 001D99EC 21187D00 */  addu       $3, $3, $sp
/* D9AF0 001D99F0 C00064AC */  sw         $4, 0xC0($3)
/* D9AF4 001D99F4 0100A524 */  addiu      $5, $5, 0x1
.L001D99F8:
/* D9AF8 001D99F8 1000A328 */  slti       $3, $5, 0x10
/* D9AFC 001D99FC F9FF6014 */  bnez       $3, .L001D99E4
/* D9B00 001D9A00 00000000 */   nop
/* D9B04 001D9A04 288E0070 */  paddub     $17, $0, $0
/* D9B08 001D9A08 5E000010 */  b          .L001D9B84
/* D9B0C 001D9A0C 00000000 */   nop
.L001D9A10:
/* D9B10 001D9A10 FFFF0524 */  addiu      $5, $0, -0x1
/* D9B14 001D9A14 80201100 */  sll        $4, $17, 2
/* D9B18 001D9A18 21189D00 */  addu       $3, $4, $sp
/* D9B1C 001D9A1C 800065AC */  sw         $5, 0x80($3)
/* D9B20 001D9A20 21209100 */  addu       $4, $4, $17
/* D9B24 001D9A24 80180400 */  sll        $3, $4, 2
/* D9B28 001D9A28 21188300 */  addu       $3, $4, $3
/* D9B2C 001D9A2C 00910300 */  sll        $18, $3, 4
/* D9B30 001D9A30 21205402 */  addu       $4, $18, $20
/* D9B34 001D9A34 0200013C */  lui        $at, (0x20000 >> 16)
/* D9B38 001D9A38 21088100 */  addu       $at, $4, $at
/* D9B3C 001D9A3C B8E420AC */  sw         $0, -0x1B48($at)
/* D9B40 001D9A40 0100013C */  lui        $at, (0x1E3D0 >> 16)
/* D9B44 001D9A44 D0E32134 */  ori        $at, $at, (0x1E3D0 & 0xFFFF)
/* D9B48 001D9A48 21988100 */  addu       $19, $4, $at
/* D9B4C 001D9A4C 0000638E */  lw         $3, 0x0($19)
/* D9B50 001D9A50 4B006510 */  beq        $3, $5, .L001D9B80
/* D9B54 001D9A54 00000000 */   nop
/* D9B58 001D9A58 0200013C */  lui        $at, (0x20000 >> 16)
/* D9B5C 001D9A5C 21088100 */  addu       $at, $4, $at
/* D9B60 001D9A60 A4E42384 */  lh         $3, -0x1B5C($at)
/* D9B64 001D9A64 46006010 */  beqz       $3, .L001D9B80
/* D9B68 001D9A68 00000000 */   nop
/* D9B6C 001D9A6C 10350224 */  addiu      $2, $0, 0x3510
/* D9B70 001D9A70 18102202 */  mult       $2, $17, $2
/* D9B74 001D9A74 21108202 */  addu       $2, $20, $2
/* D9B78 001D9A78 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* D9B7C 001D9A7C D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* D9B80 001D9A80 21204100 */  addu       $4, $2, $at
/* D9B84 001D9A84 7000A527 */  addiu      $5, $sp, 0x70
/* D9B88 001D9A88 A000998C */  lw         $25, 0xA0($4)
/* D9B8C 001D9A8C A000398F */  lw         $25, 0xA0($25)
/* D9B90 001D9A90 09F82003 */  jalr       $25
/* D9B94 001D9A94 00000000 */   nop
/* D9B98 001D9A98 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D9B9C 001D9A9C 7C00A2AF */  sw         $2, 0x7C($sp)
/* D9BA0 001D9AA0 6C00A2AF */  sw         $2, 0x6C($sp)
/* D9BA4 001D9AA4 6000A427 */  addiu      $4, $sp, 0x60
/* D9BA8 001D9AA8 7000A527 */  addiu      $5, $sp, 0x70
/* D9BAC 001D9AAC 648D040C */  jal        DistVector__FPfPf
/* D9BB0 001D9AB0 00000000 */   nop
/* D9BB4 001D9AB4 21285402 */  addu       $5, $18, $20
/* D9BB8 001D9AB8 0200013C */  lui        $at, (0x20000 >> 16)
/* D9BBC 001D9ABC 2108A100 */  addu       $at, $5, $at
/* D9BC0 001D9AC0 E8E320E4 */  swc1       $f0, -0x1C18($at)
/* D9BC4 001D9AC4 0000648E */  lw         $4, 0x0($19)
/* D9BC8 001D9AC8 01000324 */  addiu      $3, $0, 0x1
/* D9BCC 001D9ACC 0A008314 */  bne        $4, $3, .L001D9AF8
/* D9BD0 001D9AD0 00000000 */   nop
/* D9BD4 001D9AD4 0200013C */  lui        $at, (0x20000 >> 16)
/* D9BD8 001D9AD8 2108A100 */  addu       $at, $5, $at
/* D9BDC 001D9ADC 74E421C4 */  lwc1       $f1, -0x1B8C($at)
/* D9BE0 001D9AE0 34000146 */  c.lt.s     $f0, $f1
/* D9BE4 001D9AE4 00000000 */  nop
/* D9BE8 001D9AE8 03000045 */  bc1f       .L001D9AF8
/* D9BEC 001D9AEC 00000000 */   nop
/* D9BF0 001D9AF0 02000324 */  addiu      $3, $0, 0x2
/* D9BF4 001D9AF4 000063AE */  sw         $3, 0x0($19)
.L001D9AF8:
/* D9BF8 001D9AF8 0000648E */  lw         $4, 0x0($19)
/* D9BFC 001D9AFC 02000324 */  addiu      $3, $0, 0x2
/* D9C00 001D9B00 0F008314 */  bne        $4, $3, .L001D9B40
/* D9C04 001D9B04 00000000 */   nop
/* D9C08 001D9B08 21185402 */  addu       $3, $18, $20
/* D9C0C 001D9B0C 0200013C */  lui        $at, (0x20000 >> 16)
/* D9C10 001D9B10 21086100 */  addu       $at, $3, $at
/* D9C14 001D9B14 74E422C4 */  lwc1       $f2, -0x1B8C($at)
/* D9C18 001D9B18 2041033C */  lui        $3, (0x41200000 >> 16)
/* D9C1C 001D9B1C 00088344 */  mtc1       $3, $f1
/* D9C20 001D9B20 00000000 */  nop
/* D9C24 001D9B24 40080246 */  add.s      $f1, $f1, $f2
/* D9C28 001D9B28 36000146 */  c.le.s     $f0, $f1
/* D9C2C 001D9B2C 00000000 */  nop
/* D9C30 001D9B30 03000145 */  bc1t       .L001D9B40
/* D9C34 001D9B34 00000000 */   nop
/* D9C38 001D9B38 01000324 */  addiu      $3, $0, 0x1
/* D9C3C 001D9B3C 000063AE */  sw         $3, 0x0($19)
.L001D9B40:
/* D9C40 001D9B40 21185402 */  addu       $3, $18, $20
/* D9C44 001D9B44 0200013C */  lui        $at, (0x20000 >> 16)
/* D9C48 001D9B48 21086100 */  addu       $at, $3, $at
/* D9C4C 001D9B4C F4E3238C */  lw         $3, -0x1C0C($at)
/* D9C50 001D9B50 0300601C */  bgtz       $3, .L001D9B60
/* D9C54 001D9B54 00000000 */   nop
/* D9C58 001D9B58 02000324 */  addiu      $3, $0, 0x2
/* D9C5C 001D9B5C 000063AE */  sw         $3, 0x0($19)
.L001D9B60:
/* D9C60 001D9B60 0000648E */  lw         $4, 0x0($19)
/* D9C64 001D9B64 02000324 */  addiu      $3, $0, 0x2
/* D9C68 001D9B68 05008314 */  bne        $4, $3, .L001D9B80
/* D9C6C 001D9B6C 00000000 */   nop
/* D9C70 001D9B70 80181000 */  sll        $3, $16, 2
/* D9C74 001D9B74 21187D00 */  addu       $3, $3, $sp
/* D9C78 001D9B78 C00071AC */  sw         $17, 0xC0($3)
/* D9C7C 001D9B7C 01001026 */  addiu      $16, $16, 0x1
.L001D9B80:
/* D9C80 001D9B80 01003126 */  addiu      $17, $17, 0x1
.L001D9B84:
/* D9C84 001D9B84 1000232A */  slti       $3, $17, 0x10
/* D9C88 001D9B88 A1FF6014 */  bnez       $3, .L001D9A10
/* D9C8C 001D9B8C 00000000 */   nop
/* D9C90 001D9B90 281E0070 */  paddub     $3, $0, $0
/* D9C94 001D9B94 0500012A */  slti       $at, $16, 0x5
/* D9C98 001D9B98 67002014 */  bnez       $at, .L001D9D38
/* D9C9C 001D9B9C 00000000 */   nop
/* D9CA0 001D9BA0 789C848F */  lw         $4, -0x6388($gp)
/* D9CA4 001D9BA4 02008680 */  lb         $6, 0x2($4)
/* D9CA8 001D9BA8 A49D848F */  lw         $4, -0x625C($gp)
/* D9CAC 001D9BAC 80280400 */  sll        $5, $4, 2
/* D9CB0 001D9BB0 2800043C */  lui        $4, %hi(maxFloorTbl_3)
/* D9CB4 001D9BB4 50EB8424 */  addiu      $4, $4, %lo(maxFloorTbl_3)
/* D9CB8 001D9BB8 21208500 */  addu       $4, $4, $5
/* D9CBC 001D9BBC 0000858C */  lw         $5, 0x0($4)
/* D9CC0 001D9BC0 0100C424 */  addiu      $4, $6, 0x1
/* D9CC4 001D9BC4 5C008510 */  beq        $4, $5, .L001D9D38
/* D9CC8 001D9BC8 00000000 */   nop
/* D9CCC 001D9BCC 283E0070 */  paddub     $7, $0, $0
/* D9CD0 001D9BD0 2D000010 */  b          .L001D9C88
/* D9CD4 001D9BD4 00000000 */   nop
.L001D9BD8:
/* D9CD8 001D9BD8 FFFF0824 */  addiu      $8, $0, -0x1
/* D9CDC 001D9BDC 4845043C */  lui        $4, (0x45480000 >> 16)
/* D9CE0 001D9BE0 00008444 */  mtc1       $4, $f0
/* D9CE4 001D9BE4 28360070 */  paddub     $6, $0, $0
/* D9CE8 001D9BE8 17000010 */  b          .L001D9C48
/* D9CEC 001D9BEC 00000000 */   nop
.L001D9BF0:
/* D9CF0 001D9BF0 80200600 */  sll        $4, $6, 2
/* D9CF4 001D9BF4 21209D00 */  addu       $4, $4, $sp
/* D9CF8 001D9BF8 C000858C */  lw         $5, 0xC0($4)
/* D9CFC 001D9BFC FFFF0424 */  addiu      $4, $0, -0x1
/* D9D00 001D9C00 1000A410 */  beq        $5, $4, .L001D9C44
/* D9D04 001D9C04 00000000 */   nop
/* D9D08 001D9C08 80200500 */  sll        $4, $5, 2
/* D9D0C 001D9C0C 21288500 */  addu       $5, $4, $5
/* D9D10 001D9C10 80200500 */  sll        $4, $5, 2
/* D9D14 001D9C14 2120A400 */  addu       $4, $5, $4
/* D9D18 001D9C18 00210400 */  sll        $4, $4, 4
/* D9D1C 001D9C1C 21209400 */  addu       $4, $4, $20
/* D9D20 001D9C20 0200013C */  lui        $at, (0x20000 >> 16)
/* D9D24 001D9C24 21088100 */  addu       $at, $4, $at
/* D9D28 001D9C28 E8E321C4 */  lwc1       $f1, -0x1C18($at)
/* D9D2C 001D9C2C 36000146 */  c.le.s     $f0, $f1
/* D9D30 001D9C30 00000000 */  nop
/* D9D34 001D9C34 03000145 */  bc1t       .L001D9C44
/* D9D38 001D9C38 00000000 */   nop
/* D9D3C 001D9C3C 06080046 */  mov.s      $f0, $f1
/* D9D40 001D9C40 2846C070 */  paddub     $8, $6, $0
.L001D9C44:
/* D9D44 001D9C44 0100C624 */  addiu      $6, $6, 0x1
.L001D9C48:
/* D9D48 001D9C48 2A20D000 */  slt        $4, $6, $16
/* D9D4C 001D9C4C E8FF8014 */  bnez       $4, .L001D9BF0
/* D9D50 001D9C50 00000000 */   nop
/* D9D54 001D9C54 FFFF0624 */  addiu      $6, $0, -0x1
/* D9D58 001D9C58 0A000611 */  beq        $8, $6, .L001D9C84
/* D9D5C 001D9C5C 00000000 */   nop
/* D9D60 001D9C60 80200800 */  sll        $4, $8, 2
/* D9D64 001D9C64 21209D00 */  addu       $4, $4, $sp
/* D9D68 001D9C68 C0008824 */  addiu      $8, $4, 0xC0
/* D9D6C 001D9C6C 0000058D */  lw         $5, 0x0($8)
/* D9D70 001D9C70 80200300 */  sll        $4, $3, 2
/* D9D74 001D9C74 21209D00 */  addu       $4, $4, $sp
/* D9D78 001D9C78 800085AC */  sw         $5, 0x80($4)
/* D9D7C 001D9C7C 000006AD */  sw         $6, 0x0($8)
/* D9D80 001D9C80 01006324 */  addiu      $3, $3, 0x1
.L001D9C84:
/* D9D84 001D9C84 0100E724 */  addiu      $7, $7, 0x1
.L001D9C88:
/* D9D88 001D9C88 2A20F000 */  slt        $4, $7, $16
/* D9D8C 001D9C8C D2FF8014 */  bnez       $4, .L001D9BD8
/* D9D90 001D9C90 00000000 */   nop
/* D9D94 001D9C94 04000624 */  addiu      $6, $0, 0x4
/* D9D98 001D9C98 24000010 */  b          .L001D9D2C
/* D9D9C 001D9C9C 00000000 */   nop
.L001D9CA0:
/* D9DA0 001D9CA0 80180600 */  sll        $3, $6, 2
/* D9DA4 001D9CA4 21187D00 */  addu       $3, $3, $sp
/* D9DA8 001D9CA8 8000648C */  lw         $4, 0x80($3)
/* D9DAC 001D9CAC FFFF0324 */  addiu      $3, $0, -0x1
/* D9DB0 001D9CB0 1D008310 */  beq        $4, $3, .L001D9D28
/* D9DB4 001D9CB4 00000000 */   nop
/* D9DB8 001D9CB8 80180400 */  sll        $3, $4, 2
/* D9DBC 001D9CBC 21206400 */  addu       $4, $3, $4
/* D9DC0 001D9CC0 80180400 */  sll        $3, $4, 2
/* D9DC4 001D9CC4 21188300 */  addu       $3, $4, $3
/* D9DC8 001D9CC8 00190300 */  sll        $3, $3, 4
/* D9DCC 001D9CCC 21287400 */  addu       $5, $3, $20
/* D9DD0 001D9CD0 0100013C */  lui        $at, (0x1E3D0 >> 16)
/* D9DD4 001D9CD4 D0E32134 */  ori        $at, $at, (0x1E3D0 & 0xFFFF)
/* D9DD8 001D9CD8 2138A100 */  addu       $7, $5, $at
/* D9DDC 001D9CDC 0000E38C */  lw         $3, 0x0($7)
/* D9DE0 001D9CE0 02000424 */  addiu      $4, $0, 0x2
/* D9DE4 001D9CE4 10006414 */  bne        $3, $4, .L001D9D28
/* D9DE8 001D9CE8 00000000 */   nop
/* D9DEC 001D9CEC 0200013C */  lui        $at, (0x20000 >> 16)
/* D9DF0 001D9CF0 2108A100 */  addu       $at, $5, $at
/* D9DF4 001D9CF4 F4E3238C */  lw         $3, -0x1C0C($at)
/* D9DF8 001D9CF8 0B006018 */  blez       $3, .L001D9D28
/* D9DFC 001D9CFC 00000000 */   nop
/* D9E00 001D9D00 0200013C */  lui        $at, (0x20000 >> 16)
/* D9E04 001D9D04 2108A100 */  addu       $at, $5, $at
/* D9E08 001D9D08 10E42384 */  lh         $3, -0x1BF0($at)
/* D9E0C 001D9D0C 06006410 */  beq        $3, $4, .L001D9D28
/* D9E10 001D9D10 00000000 */   nop
/* D9E14 001D9D14 01000324 */  addiu      $3, $0, 0x1
/* D9E18 001D9D18 0000E3AC */  sw         $3, 0x0($7)
/* D9E1C 001D9D1C 0200013C */  lui        $at, (0x20000 >> 16)
/* D9E20 001D9D20 2108A100 */  addu       $at, $5, $at
/* D9E24 001D9D24 B8E423AC */  sw         $3, -0x1B48($at)
.L001D9D28:
/* D9E28 001D9D28 0100C624 */  addiu      $6, $6, 0x1
.L001D9D2C:
/* D9E2C 001D9D2C 2A18D000 */  slt        $3, $6, $16
/* D9E30 001D9D30 DBFF6014 */  bnez       $3, .L001D9CA0
/* D9E34 001D9D34 00000000 */   nop
.L001D9D38:
/* D9E38 001D9D38 5000BF7B */  lq         $31, 0x50($sp)
/* D9E3C 001D9D3C 4000B47B */  lq         $20, 0x40($sp)
/* D9E40 001D9D40 3000B37B */  lq         $19, 0x30($sp)
/* D9E44 001D9D44 2000B27B */  lq         $18, 0x20($sp)
/* D9E48 001D9D48 1000B17B */  lq         $17, 0x10($sp)
/* D9E4C 001D9D4C 0000B07B */  lq         $16, 0x0($sp)
/* D9E50 001D9D50 0001BD27 */  addiu      $sp, $sp, 0x100
/* D9E54 001D9D54 0800E003 */  jr         $31
/* D9E58 001D9D58 00000000 */   nop
/* D9E5C 001D9D5C 00000000 */  nop
