.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMimicEvent__11CDungeonMapFfffii
/* C8CC0 001C8BC0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* C8CC4 001C8BC4 6000BF7F */  sq         $31, 0x60($sp)
/* C8CC8 001C8BC8 5000B47F */  sq         $20, 0x50($sp)
/* C8CCC 001C8BCC 4000B37F */  sq         $19, 0x40($sp)
/* C8CD0 001C8BD0 3000B27F */  sq         $18, 0x30($sp)
/* C8CD4 001C8BD4 2000B17F */  sq         $17, 0x20($sp)
/* C8CD8 001C8BD8 1000B07F */  sq         $16, 0x10($sp)
/* C8CDC 001C8BDC 0800B6E7 */  swc1       $f22, 0x8($sp)
/* C8CE0 001C8BE0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* C8CE4 001C8BE4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C8CE8 001C8BE8 28A68070 */  paddub     $20, $4, $0
/* C8CEC 001C8BEC 86650046 */  mov.s      $f22, $f12
/* C8CF0 001C8BF0 466D0046 */  mov.s      $f21, $f13
/* C8CF4 001C8BF4 06750046 */  mov.s      $f20, $f14
/* C8CF8 001C8BF8 289EA070 */  paddub     $19, $5, $0
/* C8CFC 001C8BFC 2896C070 */  paddub     $18, $6, $0
/* C8D00 001C8C00 7000ACE7 */  swc1       $f12, 0x70($sp)
/* C8D04 001C8C04 7400ADE7 */  swc1       $f13, 0x74($sp)
/* C8D08 001C8C08 7800AEE7 */  swc1       $f14, 0x78($sp)
/* C8D0C 001C8C0C FFFF1024 */  addiu      $16, $0, -0x1
/* C8D10 001C8C10 28260070 */  paddub     $4, $0, $0
/* C8D14 001C8C14 0C000010 */  b          .L001C8C48
/* C8D18 001C8C18 00000000 */   nop
.L001C8C1C:
/* C8D1C 001C8C1C 80190400 */  sll        $3, $4, 6
/* C8D20 001C8C20 21187400 */  addu       $3, $3, $20
/* C8D24 001C8C24 0100013C */  lui        $at, (0x10000 >> 16)
/* C8D28 001C8C28 21086100 */  addu       $at, $3, $at
/* C8D2C 001C8C2C 60B6238C */  lw         $3, -0x49A0($at)
/* C8D30 001C8C30 04006014 */  bnez       $3, .L001C8C44
/* C8D34 001C8C34 00000000 */   nop
/* C8D38 001C8C38 28868070 */  paddub     $16, $4, $0
/* C8D3C 001C8C3C 05000010 */  b          .L001C8C54
/* C8D40 001C8C40 00000000 */   nop
.L001C8C44:
/* C8D44 001C8C44 01008424 */  addiu      $4, $4, 0x1
.L001C8C48:
/* C8D48 001C8C48 18008328 */  slti       $3, $4, 0x18
/* C8D4C 001C8C4C F3FF6014 */  bnez       $3, .L001C8C1C
/* C8D50 001C8C50 00000000 */   nop
.L001C8C54:
/* C8D54 001C8C54 FFFF0324 */  addiu      $3, $0, -0x1
/* C8D58 001C8C58 70000312 */  beq        $16, $3, .L001C8E1C
/* C8D5C 001C8C5C 00000000 */   nop
/* C8D60 001C8C60 282E0070 */  paddub     $5, $0, $0
/* C8D64 001C8C64 0F000010 */  b          .L001C8CA4
/* C8D68 001C8C68 00000000 */   nop
.L001C8C6C:
/* C8D6C 001C8C6C 80180500 */  sll        $3, $5, 2
/* C8D70 001C8C70 21186500 */  addu       $3, $3, $5
/* C8D74 001C8C74 00190300 */  sll        $3, $3, 4
/* C8D78 001C8C78 21187400 */  addu       $3, $3, $20
/* C8D7C 001C8C7C 0100013C */  lui        $at, (0x10000 >> 16)
/* C8D80 001C8C80 21086100 */  addu       $at, $3, $at
/* C8D84 001C8C84 588D248C */  lw         $4, -0x72A8($at)
/* C8D88 001C8C88 FFFF0324 */  addiu      $3, $0, -0x1
/* C8D8C 001C8C8C 04008314 */  bne        $4, $3, .L001C8CA0
/* C8D90 001C8C90 00000000 */   nop
/* C8D94 001C8C94 288EA070 */  paddub     $17, $5, $0
/* C8D98 001C8C98 0C000010 */  b          .L001C8CCC
/* C8D9C 001C8C9C 00000000 */   nop
.L001C8CA0:
/* C8DA0 001C8CA0 0100A524 */  addiu      $5, $5, 0x1
.L001C8CA4:
/* C8DA4 001C8CA4 3000A328 */  slti       $3, $5, 0x30
/* C8DA8 001C8CA8 F0FF6014 */  bnez       $3, .L001C8C6C
/* C8DAC 001C8CAC 00000000 */   nop
/* C8DB0 001C8CB0 2A00023C */  lui        $2, %hi(_2448)
/* C8DB4 001C8CB4 C0BE4424 */  addiu      $4, $2, %lo(_2448)
/* C8DB8 001C8CB8 A611040C */  jal        printf
/* C8DBC 001C8CBC 00000000 */   nop
/* C8DC0 001C8CC0 FFFF0424 */  addiu      $4, $0, -0x1
/* C8DC4 001C8CC4 DC05040C */  jal        exit_2
/* C8DC8 001C8CC8 00000000 */   nop
.L001C8CCC:
/* C8DCC 001C8CCC FFFF0324 */  addiu      $3, $0, -0x1
/* C8DD0 001C8CD0 52002312 */  beq        $17, $3, .L001C8E1C
/* C8DD4 001C8CD4 00000000 */   nop
/* C8DD8 001C8CD8 08000324 */  addiu      $3, $0, 0x8
/* C8DDC 001C8CDC 80101100 */  sll        $2, $17, 2
/* C8DE0 001C8CE0 21105100 */  addu       $2, $2, $17
/* C8DE4 001C8CE4 00890200 */  sll        $17, $2, 4
/* C8DE8 001C8CE8 21103402 */  addu       $2, $17, $20
/* C8DEC 001C8CEC 0100013C */  lui        $at, (0x10000 >> 16)
/* C8DF0 001C8CF0 21084100 */  addu       $at, $2, $at
/* C8DF4 001C8CF4 588D23AC */  sw         $3, -0x72A8($at)
/* C8DF8 001C8CF8 0100013C */  lui        $at, (0x10000 >> 16)
/* C8DFC 001C8CFC 21084100 */  addu       $at, $2, $at
/* C8E00 001C8D00 5C8D20AC */  sw         $0, -0x72A4($at)
/* C8E04 001C8D04 0100013C */  lui        $at, (0x10000 >> 16)
/* C8E08 001C8D08 21084100 */  addu       $at, $2, $at
/* C8E0C 001C8D0C 788D30AC */  sw         $16, -0x7288($at)
/* C8E10 001C8D10 80811000 */  sll        $16, $16, 6
/* C8E14 001C8D14 21109002 */  addu       $2, $20, $16
/* C8E18 001C8D18 78364424 */  addiu      $4, $2, 0x3678
/* C8E1C 001C8D1C F87F8424 */  addiu      $4, $4, 0x7FF8
/* C8E20 001C8D20 7000A527 */  addiu      $5, $sp, 0x70
/* C8E24 001C8D24 0C86040C */  jal        sceVu0CopyVector
/* C8E28 001C8D28 00000000 */   nop
/* C8E2C 001C8D2C 01000424 */  addiu      $4, $0, 0x1
/* C8E30 001C8D30 21181402 */  addu       $3, $16, $20
/* C8E34 001C8D34 0100013C */  lui        $at, (0x10000 >> 16)
/* C8E38 001C8D38 21086100 */  addu       $at, $3, $at
/* C8E3C 001C8D3C 60B624AC */  sw         $4, -0x49A0($at)
/* C8E40 001C8D40 0100013C */  lui        $at, (0x10000 >> 16)
/* C8E44 001C8D44 21086100 */  addu       $at, $3, $at
/* C8E48 001C8D48 8CB620AC */  sw         $0, -0x4974($at)
/* C8E4C 001C8D4C 0100013C */  lui        $at, (0x10000 >> 16)
/* C8E50 001C8D50 21086100 */  addu       $at, $3, $at
/* C8E54 001C8D54 88B632AC */  sw         $18, -0x4978($at)
/* C8E58 001C8D58 0100013C */  lui        $at, (0x10000 >> 16)
/* C8E5C 001C8D5C 21086100 */  addu       $at, $3, $at
/* C8E60 001C8D60 80B633AC */  sw         $19, -0x4980($at)
/* C8E64 001C8D64 0100013C */  lui        $at, (0x10000 >> 16)
/* C8E68 001C8D68 21086100 */  addu       $at, $3, $at
/* C8E6C 001C8D6C 84B624AC */  sw         $4, -0x497C($at)
/* C8E70 001C8D70 19004412 */  beq        $18, $4, .L001C8DD8
/* C8E74 001C8D74 00000000 */   nop
/* C8E78 001C8D78 03004012 */  beqz       $18, .L001C8D88
/* C8E7C 001C8D7C 00000000 */   nop
/* C8E80 001C8D80 26000010 */  b          .L001C8E1C
/* C8E84 001C8D84 00000000 */   nop
.L001C8D88:
/* C8E88 001C8D88 21203402 */  addu       $4, $17, $20
/* C8E8C 001C8D8C 0100013C */  lui        $at, (0x10000 >> 16)
/* C8E90 001C8D90 21088100 */  addu       $at, $4, $at
/* C8E94 001C8D94 608D36E4 */  swc1       $f22, -0x72A0($at)
/* C8E98 001C8D98 0100013C */  lui        $at, (0x10000 >> 16)
/* C8E9C 001C8D9C 21088100 */  addu       $at, $4, $at
/* C8EA0 001C8DA0 648D35E4 */  swc1       $f21, -0x729C($at)
/* C8EA4 001C8DA4 2041033C */  lui        $3, (0x41200000 >> 16)
/* C8EA8 001C8DA8 00008344 */  mtc1       $3, $f0
/* C8EAC 001C8DAC 00000000 */  nop
/* C8EB0 001C8DB0 00001446 */  add.s      $f0, $f0, $f20
/* C8EB4 001C8DB4 0100013C */  lui        $at, (0x10000 >> 16)
/* C8EB8 001C8DB8 21088100 */  addu       $at, $4, $at
/* C8EBC 001C8DBC 688D20E4 */  swc1       $f0, -0x7298($at)
/* C8EC0 001C8DC0 0041033C */  lui        $3, (0x41000000 >> 16)
/* C8EC4 001C8DC4 0100013C */  lui        $at, (0x10000 >> 16)
/* C8EC8 001C8DC8 21088100 */  addu       $at, $4, $at
/* C8ECC 001C8DCC 748D23AC */  sw         $3, -0x728C($at)
/* C8ED0 001C8DD0 12000010 */  b          .L001C8E1C
/* C8ED4 001C8DD4 00000000 */   nop
.L001C8DD8:
/* C8ED8 001C8DD8 21203402 */  addu       $4, $17, $20
/* C8EDC 001C8DDC 0100013C */  lui        $at, (0x10000 >> 16)
/* C8EE0 001C8DE0 21088100 */  addu       $at, $4, $at
/* C8EE4 001C8DE4 608D36E4 */  swc1       $f22, -0x72A0($at)
/* C8EE8 001C8DE8 0100013C */  lui        $at, (0x10000 >> 16)
/* C8EEC 001C8DEC 21088100 */  addu       $at, $4, $at
/* C8EF0 001C8DF0 648D35E4 */  swc1       $f21, -0x729C($at)
/* C8EF4 001C8DF4 0041033C */  lui        $3, (0x41000000 >> 16)
/* C8EF8 001C8DF8 00008344 */  mtc1       $3, $f0
/* C8EFC 001C8DFC 00000000 */  nop
/* C8F00 001C8E00 00001446 */  add.s      $f0, $f0, $f20
/* C8F04 001C8E04 0100013C */  lui        $at, (0x10000 >> 16)
/* C8F08 001C8E08 21088100 */  addu       $at, $4, $at
/* C8F0C 001C8E0C 688D20E4 */  swc1       $f0, -0x7298($at)
/* C8F10 001C8E10 0100013C */  lui        $at, (0x10000 >> 16)
/* C8F14 001C8E14 21088100 */  addu       $at, $4, $at
/* C8F18 001C8E18 748D23AC */  sw         $3, -0x728C($at)
.L001C8E1C:
/* C8F1C 001C8E1C 6000BF7B */  lq         $31, 0x60($sp)
/* C8F20 001C8E20 5000B47B */  lq         $20, 0x50($sp)
/* C8F24 001C8E24 4000B37B */  lq         $19, 0x40($sp)
/* C8F28 001C8E28 3000B27B */  lq         $18, 0x30($sp)
/* C8F2C 001C8E2C 2000B17B */  lq         $17, 0x20($sp)
/* C8F30 001C8E30 1000B07B */  lq         $16, 0x10($sp)
/* C8F34 001C8E34 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* C8F38 001C8E38 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* C8F3C 001C8E3C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C8F40 001C8E40 8000BD27 */  addiu      $sp, $sp, 0x80
/* C8F44 001C8E44 0800E003 */  jr         $31
/* C8F48 001C8E48 00000000 */   nop
/* C8F4C 001C8E4C 00000000 */  nop
