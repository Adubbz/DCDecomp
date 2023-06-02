.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel checkMask__11CDungeonMapFff
/* C3AC0 001C39C0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* C3AC4 001C39C4 4000BF7F */  sq         $31, 0x40($sp)
/* C3AC8 001C39C8 3000B27F */  sq         $18, 0x30($sp)
/* C3ACC 001C39CC 2000B17F */  sq         $17, 0x20($sp)
/* C3AD0 001C39D0 1000B07F */  sq         $16, 0x10($sp)
/* C3AD4 001C39D4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C3AD8 001C39D8 28968070 */  paddub     $18, $4, $0
/* C3ADC 001C39DC 066D0046 */  mov.s      $f20, $f13
/* C3AE0 001C39E0 FFFF1124 */  addiu      $17, $0, -0x1
/* C3AE4 001C39E4 A042023C */  lui        $2, (0x42A00000 >> 16)
/* C3AE8 001C39E8 00008244 */  mtc1       $2, $f0
/* C3AEC 001C39EC 00000000 */  nop
/* C3AF0 001C39F0 40000C46 */  add.s      $f1, $f0, $f12
/* C3AF4 001C39F4 2043023C */  lui        $2, (0x43200000 >> 16)
/* C3AF8 001C39F8 00008244 */  mtc1       $2, $f0
/* C3AFC 001C39FC 00000000 */  nop
/* C3B00 001C3A00 030B0046 */  div.s      $f12, $f1, $f0
/* C3B04 001C3A04 2C44040C */  jal        fptosi
/* C3B08 001C3A08 00000000 */   nop
/* C3B0C 001C3A0C 28864070 */  paddub     $16, $2, $0
/* C3B10 001C3A10 A042023C */  lui        $2, (0x42A00000 >> 16)
/* C3B14 001C3A14 00008244 */  mtc1       $2, $f0
/* C3B18 001C3A18 00000000 */  nop
/* C3B1C 001C3A1C 40001446 */  add.s      $f1, $f0, $f20
/* C3B20 001C3A20 2043023C */  lui        $2, (0x43200000 >> 16)
/* C3B24 001C3A24 00008244 */  mtc1       $2, $f0
/* C3B28 001C3A28 00000000 */  nop
/* C3B2C 001C3A2C 030B0046 */  div.s      $f12, $f1, $f0
/* C3B30 001C3A30 2C44040C */  jal        fptosi
/* C3B34 001C3A34 00000000 */   nop
/* C3B38 001C3A38 282E0070 */  paddub     $5, $0, $0
/* C3B3C 001C3A3C 1F000010 */  b          .L001C3ABC
/* C3B40 001C3A40 00000000 */   nop
.L001C3A44:
/* C3B44 001C3A44 00190500 */  sll        $3, $5, 4
/* C3B48 001C3A48 21207200 */  addu       $4, $3, $18
/* C3B4C 001C3A4C 0100013C */  lui        $at, (0x10000 >> 16)
/* C3B50 001C3A50 21088100 */  addu       $at, $4, $at
/* C3B54 001C3A54 50B5268C */  lw         $6, -0x4AB0($at)
/* C3B58 001C3A58 2A180602 */  slt        $3, $16, $6
/* C3B5C 001C3A5C 16006014 */  bnez       $3, .L001C3AB8
/* C3B60 001C3A60 00000000 */   nop
/* C3B64 001C3A64 0100013C */  lui        $at, (0x10000 >> 16)
/* C3B68 001C3A68 21088100 */  addu       $at, $4, $at
/* C3B6C 001C3A6C 58B5238C */  lw         $3, -0x4AA8($at)
/* C3B70 001C3A70 2118C300 */  addu       $3, $6, $3
/* C3B74 001C3A74 2A080302 */  slt        $at, $16, $3
/* C3B78 001C3A78 0F002010 */  beqz       $at, .L001C3AB8
/* C3B7C 001C3A7C 00000000 */   nop
/* C3B80 001C3A80 0100013C */  lui        $at, (0x10000 >> 16)
/* C3B84 001C3A84 21088100 */  addu       $at, $4, $at
/* C3B88 001C3A88 54B5268C */  lw         $6, -0x4AAC($at)
/* C3B8C 001C3A8C 2A184600 */  slt        $3, $2, $6
/* C3B90 001C3A90 09006014 */  bnez       $3, .L001C3AB8
/* C3B94 001C3A94 00000000 */   nop
/* C3B98 001C3A98 0100013C */  lui        $at, (0x10000 >> 16)
/* C3B9C 001C3A9C 21088100 */  addu       $at, $4, $at
/* C3BA0 001C3AA0 5CB5238C */  lw         $3, -0x4AA4($at)
/* C3BA4 001C3AA4 2118C300 */  addu       $3, $6, $3
/* C3BA8 001C3AA8 2A084300 */  slt        $at, $2, $3
/* C3BAC 001C3AAC 02002010 */  beqz       $at, .L001C3AB8
/* C3BB0 001C3AB0 00000000 */   nop
/* C3BB4 001C3AB4 288EA070 */  paddub     $17, $5, $0
.L001C3AB8:
/* C3BB8 001C3AB8 0100A524 */  addiu      $5, $5, 0x1
.L001C3ABC:
/* C3BBC 001C3ABC 0100013C */  lui        $at, (0x10000 >> 16)
/* C3BC0 001C3AC0 21084102 */  addu       $at, $18, $at
/* C3BC4 001C3AC4 50B6238C */  lw         $3, -0x49B0($at)
/* C3BC8 001C3AC8 2A18A300 */  slt        $3, $5, $3
/* C3BCC 001C3ACC DDFF6014 */  bnez       $3, .L001C3A44
/* C3BD0 001C3AD0 00000000 */   nop
/* C3BD4 001C3AD4 FFFF0324 */  addiu      $3, $0, -0x1
/* C3BD8 001C3AD8 36002312 */  beq        $17, $3, .L001C3BB4
/* C3BDC 001C3ADC 00000000 */   nop
/* C3BE0 001C3AE0 80181100 */  sll        $3, $17, 2
/* C3BE4 001C3AE4 21187200 */  addu       $3, $3, $18
/* C3BE8 001C3AE8 08006724 */  addiu      $7, $3, 0x8
/* C3BEC 001C3AEC 0800638C */  lw         $3, 0x8($3)
/* C3BF0 001C3AF0 30006014 */  bnez       $3, .L001C3BB4
/* C3BF4 001C3AF4 00000000 */   nop
/* C3BF8 001C3AF8 00191100 */  sll        $3, $17, 4
/* C3BFC 001C3AFC 21307200 */  addu       $6, $3, $18
/* C3C00 001C3B00 6035C424 */  addiu      $4, $6, 0x3560
/* C3C04 001C3B04 F87F8424 */  addiu      $4, $4, 0x7FF8
/* C3C08 001C3B08 0000858C */  lw         $5, 0x0($4)
/* C3C0C 001C3B0C 2900A010 */  beqz       $5, .L001C3BB4
/* C3C10 001C3B10 00000000 */   nop
/* C3C14 001C3B14 01000524 */  addiu      $5, $0, 0x1
/* C3C18 001C3B18 0000E5AC */  sw         $5, 0x0($7)
/* C3C1C 001C3B1C 5C35C524 */  addiu      $5, $6, 0x355C
/* C3C20 001C3B20 F87FA524 */  addiu      $5, $5, 0x7FF8
/* C3C24 001C3B24 0000A98C */  lw         $9, 0x0($5)
/* C3C28 001C3B28 19000010 */  b          .L001C3B90
/* C3C2C 001C3B2C 00000000 */   nop
.L001C3B30:
/* C3C30 001C3B30 21307200 */  addu       $6, $3, $18
/* C3C34 001C3B34 5835CA24 */  addiu      $10, $6, 0x3558
/* C3C38 001C3B38 F87F4A25 */  addiu      $10, $10, 0x7FF8
/* C3C3C 001C3B3C 0000488D */  lw         $8, 0x0($10)
/* C3C40 001C3B40 0C000010 */  b          .L001C3B74
/* C3C44 001C3B44 00000000 */   nop
.L001C3B48:
/* C3C48 001C3B48 01000724 */  addiu      $7, $0, 0x1
/* C3C4C 001C3B4C 80300900 */  sll        $6, $9, 2
/* C3C50 001C3B50 2130C900 */  addu       $6, $6, $9
/* C3C54 001C3B54 80300600 */  sll        $6, $6, 2
/* C3C58 001C3B58 21300601 */  addu       $6, $8, $6
/* C3C5C 001C3B5C 80300600 */  sll        $6, $6, 2
/* C3C60 001C3B60 2130D200 */  addu       $6, $6, $18
/* C3C64 001C3B64 0100013C */  lui        $at, (0x10000 >> 16)
/* C3C68 001C3B68 2108C100 */  addu       $at, $6, $at
/* C3C6C 001C3B6C 108727AC */  sw         $7, -0x78F0($at)
/* C3C70 001C3B70 01000825 */  addiu      $8, $8, 0x1
.L001C3B74:
/* C3C74 001C3B74 0000478D */  lw         $7, 0x0($10)
/* C3C78 001C3B78 0000868C */  lw         $6, 0x0($4)
/* C3C7C 001C3B7C 2130E600 */  addu       $6, $7, $6
/* C3C80 001C3B80 2A300601 */  slt        $6, $8, $6
/* C3C84 001C3B84 F0FFC014 */  bnez       $6, .L001C3B48
/* C3C88 001C3B88 00000000 */   nop
/* C3C8C 001C3B8C 01002925 */  addiu      $9, $9, 0x1
.L001C3B90:
/* C3C90 001C3B90 21307200 */  addu       $6, $3, $18
/* C3C94 001C3B94 0000A78C */  lw         $7, 0x0($5)
/* C3C98 001C3B98 0100013C */  lui        $at, (0x10000 >> 16)
/* C3C9C 001C3B9C 2108C100 */  addu       $at, $6, $at
/* C3CA0 001C3BA0 5CB5268C */  lw         $6, -0x4AA4($at)
/* C3CA4 001C3BA4 2130E600 */  addu       $6, $7, $6
/* C3CA8 001C3BA8 2A302601 */  slt        $6, $9, $6
/* C3CAC 001C3BAC E0FFC014 */  bnez       $6, .L001C3B30
/* C3CB0 001C3BB0 00000000 */   nop
.L001C3BB4:
/* C3CB4 001C3BB4 01000424 */  addiu      $4, $0, 0x1
/* C3CB8 001C3BB8 80180200 */  sll        $3, $2, 2
/* C3CBC 001C3BBC 21186200 */  addu       $3, $3, $2
/* C3CC0 001C3BC0 80180300 */  sll        $3, $3, 2
/* C3CC4 001C3BC4 21180302 */  addu       $3, $16, $3
/* C3CC8 001C3BC8 80180300 */  sll        $3, $3, 2
/* C3CCC 001C3BCC 21187200 */  addu       $3, $3, $18
/* C3CD0 001C3BD0 0100013C */  lui        $at, (0x10000 >> 16)
/* C3CD4 001C3BD4 21086100 */  addu       $at, $3, $at
/* C3CD8 001C3BD8 108724AC */  sw         $4, -0x78F0($at)
/* C3CDC 001C3BDC 4000BF7B */  lq         $31, 0x40($sp)
/* C3CE0 001C3BE0 3000B27B */  lq         $18, 0x30($sp)
/* C3CE4 001C3BE4 2000B17B */  lq         $17, 0x20($sp)
/* C3CE8 001C3BE8 1000B07B */  lq         $16, 0x10($sp)
/* C3CEC 001C3BEC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C3CF0 001C3BF0 5000BD27 */  addiu      $sp, $sp, 0x50
/* C3CF4 001C3BF4 0800E003 */  jr         $31
/* C3CF8 001C3BF8 00000000 */   nop
/* C3CFC 001C3BFC 00000000 */  nop
