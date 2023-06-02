.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setRoomObject__Fv
/* C6B40 001C6A40 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* C6B44 001C6A44 5000BF7F */  sq         $31, 0x50($sp)
/* C6B48 001C6A48 4000B47F */  sq         $20, 0x40($sp)
/* C6B4C 001C6A4C 3000B37F */  sq         $19, 0x30($sp)
/* C6B50 001C6A50 2000B27F */  sq         $18, 0x20($sp)
/* C6B54 001C6A54 1000B17F */  sq         $17, 0x10($sp)
/* C6B58 001C6A58 0000B07F */  sq         $16, 0x0($sp)
/* C6B5C 001C6A5C 28A60070 */  paddub     $20, $0, $0
/* C6B60 001C6A60 28860070 */  paddub     $16, $0, $0
/* C6B64 001C6A64 B5000010 */  b          .L001C6D3C
/* C6B68 001C6A68 00000000 */   nop
.L001C6A6C:
/* C6B6C 001C6A6C 0200812A */  slti       $at, $20, 0x2
/* C6B70 001C6A70 53002010 */  beqz       $at, .L001C6BC0
/* C6B74 001C6A74 00000000 */   nop
/* C6B78 001C6A78 288E0070 */  paddub     $17, $0, $0
/* C6B7C 001C6A7C 01000224 */  addiu      $2, $0, 0x1
/* C6B80 001C6A80 1F000010 */  b          .L001C6B00
/* C6B84 001C6A84 00000000 */   nop
.L001C6A88:
/* C6B88 001C6A88 D601033C */  lui        $3, %hi(D_1D65B24)
/* C6B8C 001C6A8C 245B6324 */  addiu      $3, $3, %lo(D_1D65B24)
/* C6B90 001C6A90 21186600 */  addu       $3, $3, $6
/* C6B94 001C6A94 0000638C */  lw         $3, 0x0($3)
/* C6B98 001C6A98 80200300 */  sll        $4, $3, 2
/* C6B9C 001C6A9C 21208300 */  addu       $4, $4, $3
/* C6BA0 001C6AA0 80200400 */  sll        $4, $4, 2
/* C6BA4 001C6AA4 21284400 */  addu       $5, $2, $4
/* C6BA8 001C6AA8 D601043C */  lui        $4, %hi(roomStack)
/* C6BAC 001C6AAC 205B8424 */  addiu      $4, $4, %lo(roomStack)
/* C6BB0 001C6AB0 21208600 */  addu       $4, $4, $6
/* C6BB4 001C6AB4 0000868C */  lw         $6, 0x0($4)
/* C6BB8 001C6AB8 2128C500 */  addu       $5, $6, $5
/* C6BBC 001C6ABC C0200500 */  sll        $4, $5, 3
/* C6BC0 001C6AC0 21208500 */  addu       $4, $4, $5
/* C6BC4 001C6AC4 40200400 */  sll        $4, $4, 1
/* C6BC8 001C6AC8 21208500 */  addu       $4, $4, $5
/* C6BCC 001C6ACC 80280400 */  sll        $5, $4, 2
/* C6BD0 001C6AD0 D501043C */  lui        $4, %hi(D_1D56DE8)
/* C6BD4 001C6AD4 E86D8424 */  addiu      $4, $4, %lo(D_1D56DE8)
/* C6BD8 001C6AD8 21208500 */  addu       $4, $4, $5
/* C6BDC 001C6ADC 0000848C */  lw         $4, 0x0($4)
/* C6BE0 001C6AE0 05008530 */  andi       $5, $4, 0x5
/* C6BE4 001C6AE4 01000424 */  addiu      $4, $0, 0x1
/* C6BE8 001C6AE8 0400A414 */  bne        $5, $4, .L001C6AFC
/* C6BEC 001C6AEC 00000000 */   nop
/* C6BF0 001C6AF0 21904600 */  addu       $18, $2, $6
/* C6BF4 001C6AF4 289E6070 */  paddub     $19, $3, $0
/* C6BF8 001C6AF8 288E8070 */  paddub     $17, $4, $0
.L001C6AFC:
/* C6BFC 001C6AFC 01004224 */  addiu      $2, $2, 0x1
.L001C6B00:
/* C6C00 001C6B00 00311000 */  sll        $6, $16, 4
/* C6C04 001C6B04 D601033C */  lui        $3, %hi(D_1D65B28)
/* C6C08 001C6B08 285B6324 */  addiu      $3, $3, %lo(D_1D65B28)
/* C6C0C 001C6B0C 21186600 */  addu       $3, $3, $6
/* C6C10 001C6B10 0000638C */  lw         $3, 0x0($3)
/* C6C14 001C6B14 FFFF6324 */  addiu      $3, $3, -0x1
/* C6C18 001C6B18 2A184300 */  slt        $3, $2, $3
/* C6C1C 001C6B1C DAFF6014 */  bnez       $3, .L001C6A88
/* C6C20 001C6B20 00000000 */   nop
/* C6C24 001C6B24 BE11040C */  jal        rand
/* C6C28 001C6B28 00000000 */   nop
/* C6C2C 001C6B2C 00008244 */  mtc1       $2, $f0
/* C6C30 001C6B30 00000000 */  nop
/* C6C34 001C6B34 60008046 */  cvt.s.w    $f1, $f0
/* C6C38 001C6B38 C842023C */  lui        $2, (0x42C80000 >> 16)
/* C6C3C 001C6B3C 00008244 */  mtc1       $2, $f0
/* C6C40 001C6B40 00000000 */  nop
/* C6C44 001C6B44 42000146 */  mul.s      $f1, $f0, $f1
/* C6C48 001C6B48 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C6C4C 001C6B4C 00008244 */  mtc1       $2, $f0
/* C6C50 001C6B50 00000000 */  nop
/* C6C54 001C6B54 43080046 */  div.s      $f1, $f1, $f0
/* C6C58 001C6B58 F041023C */  lui        $2, (0x41F00000 >> 16)
/* C6C5C 001C6B5C 00008244 */  mtc1       $2, $f0
/* C6C60 001C6B60 00000000 */  nop
/* C6C64 001C6B64 36080046 */  c.le.s     $f1, $f0
/* C6C68 001C6B68 00000000 */  nop
/* C6C6C 001C6B6C 14000045 */  bc1f       .L001C6BC0
/* C6C70 001C6B70 00000000 */   nop
/* C6C74 001C6B74 01000224 */  addiu      $2, $0, 0x1
/* C6C78 001C6B78 11002216 */  bne        $17, $2, .L001C6BC0
/* C6C7C 001C6B7C 00000000 */   nop
/* C6C80 001C6B80 80101300 */  sll        $2, $19, 2
/* C6C84 001C6B84 21105300 */  addu       $2, $2, $19
/* C6C88 001C6B88 80100200 */  sll        $2, $2, 2
/* C6C8C 001C6B8C 21184202 */  addu       $3, $18, $2
/* C6C90 001C6B90 C0100300 */  sll        $2, $3, 3
/* C6C94 001C6B94 21104300 */  addu       $2, $2, $3
/* C6C98 001C6B98 40100200 */  sll        $2, $2, 1
/* C6C9C 001C6B9C 21104300 */  addu       $2, $2, $3
/* C6CA0 001C6BA0 80180200 */  sll        $3, $2, 2
/* C6CA4 001C6BA4 D501023C */  lui        $2, %hi(D_1D56DE8)
/* C6CA8 001C6BA8 E86D4224 */  addiu      $2, $2, %lo(D_1D56DE8)
/* C6CAC 001C6BAC 21184300 */  addu       $3, $2, $3
/* C6CB0 001C6BB0 0000628C */  lw         $2, 0x0($3)
/* C6CB4 001C6BB4 08004234 */  ori        $2, $2, 0x8
/* C6CB8 001C6BB8 000062AC */  sw         $2, 0x0($3)
/* C6CBC 001C6BBC 01009426 */  addiu      $20, $20, 0x1
.L001C6BC0:
/* C6CC0 001C6BC0 288E0070 */  paddub     $17, $0, $0
/* C6CC4 001C6BC4 01000324 */  addiu      $3, $0, 0x1
/* C6CC8 001C6BC8 2C000010 */  b          .L001C6C7C
/* C6CCC 001C6BCC 00000000 */   nop
.L001C6BD0:
/* C6CD0 001C6BD0 01000224 */  addiu      $2, $0, 0x1
/* C6CD4 001C6BD4 20000010 */  b          .L001C6C58
/* C6CD8 001C6BD8 00000000 */   nop
.L001C6BDC:
/* C6CDC 001C6BDC D601043C */  lui        $4, %hi(D_1D65B24)
/* C6CE0 001C6BE0 245B8424 */  addiu      $4, $4, %lo(D_1D65B24)
/* C6CE4 001C6BE4 21208500 */  addu       $4, $4, $5
/* C6CE8 001C6BE8 0000848C */  lw         $4, 0x0($4)
/* C6CEC 001C6BEC 21206400 */  addu       $4, $3, $4
/* C6CF0 001C6BF0 80300400 */  sll        $6, $4, 2
/* C6CF4 001C6BF4 2130C400 */  addu       $6, $6, $4
/* C6CF8 001C6BF8 80300600 */  sll        $6, $6, 2
/* C6CFC 001C6BFC 21384600 */  addu       $7, $2, $6
/* C6D00 001C6C00 D601063C */  lui        $6, %hi(roomStack)
/* C6D04 001C6C04 205BC624 */  addiu      $6, $6, %lo(roomStack)
/* C6D08 001C6C08 2130C500 */  addu       $6, $6, $5
/* C6D0C 001C6C0C 0000C88C */  lw         $8, 0x0($6)
/* C6D10 001C6C10 21380701 */  addu       $7, $8, $7
/* C6D14 001C6C14 C0300700 */  sll        $6, $7, 3
/* C6D18 001C6C18 2130C700 */  addu       $6, $6, $7
/* C6D1C 001C6C1C 40300600 */  sll        $6, $6, 1
/* C6D20 001C6C20 2130C700 */  addu       $6, $6, $7
/* C6D24 001C6C24 80380600 */  sll        $7, $6, 2
/* C6D28 001C6C28 D501063C */  lui        $6, %hi(D_1D56DE8)
/* C6D2C 001C6C2C E86DC624 */  addiu      $6, $6, %lo(D_1D56DE8)
/* C6D30 001C6C30 2130C700 */  addu       $6, $6, $7
/* C6D34 001C6C34 0000C68C */  lw         $6, 0x0($6)
/* C6D38 001C6C38 4D00C730 */  andi       $7, $6, 0x4D
/* C6D3C 001C6C3C 01000624 */  addiu      $6, $0, 0x1
/* C6D40 001C6C40 0400E614 */  bne        $7, $6, .L001C6C54
/* C6D44 001C6C44 00000000 */   nop
/* C6D48 001C6C48 21904800 */  addu       $18, $2, $8
/* C6D4C 001C6C4C 289E8070 */  paddub     $19, $4, $0
/* C6D50 001C6C50 288EC070 */  paddub     $17, $6, $0
.L001C6C54:
/* C6D54 001C6C54 01004224 */  addiu      $2, $2, 0x1
.L001C6C58:
/* C6D58 001C6C58 D601043C */  lui        $4, %hi(D_1D65B28)
/* C6D5C 001C6C5C 285B8424 */  addiu      $4, $4, %lo(D_1D65B28)
/* C6D60 001C6C60 21208500 */  addu       $4, $4, $5
/* C6D64 001C6C64 0000848C */  lw         $4, 0x0($4)
/* C6D68 001C6C68 FFFF8424 */  addiu      $4, $4, -0x1
/* C6D6C 001C6C6C 2A204400 */  slt        $4, $2, $4
/* C6D70 001C6C70 DAFF8014 */  bnez       $4, .L001C6BDC
/* C6D74 001C6C74 00000000 */   nop
/* C6D78 001C6C78 01006324 */  addiu      $3, $3, 0x1
.L001C6C7C:
/* C6D7C 001C6C7C 00291000 */  sll        $5, $16, 4
/* C6D80 001C6C80 D601023C */  lui        $2, %hi(D_1D65B2C)
/* C6D84 001C6C84 2C5B4224 */  addiu      $2, $2, %lo(D_1D65B2C)
/* C6D88 001C6C88 21104500 */  addu       $2, $2, $5
/* C6D8C 001C6C8C 0000428C */  lw         $2, 0x0($2)
/* C6D90 001C6C90 FFFF4224 */  addiu      $2, $2, -0x1
/* C6D94 001C6C94 2A106200 */  slt        $2, $3, $2
/* C6D98 001C6C98 CDFF4014 */  bnez       $2, .L001C6BD0
/* C6D9C 001C6C9C 00000000 */   nop
/* C6DA0 001C6CA0 BE11040C */  jal        rand
/* C6DA4 001C6CA4 00000000 */   nop
/* C6DA8 001C6CA8 00008244 */  mtc1       $2, $f0
/* C6DAC 001C6CAC 00000000 */  nop
/* C6DB0 001C6CB0 60008046 */  cvt.s.w    $f1, $f0
/* C6DB4 001C6CB4 C842033C */  lui        $3, (0x42C80000 >> 16)
/* C6DB8 001C6CB8 00008344 */  mtc1       $3, $f0
/* C6DBC 001C6CBC 00000000 */  nop
/* C6DC0 001C6CC0 42000146 */  mul.s      $f1, $f0, $f1
/* C6DC4 001C6CC4 004F033C */  lui        $3, (0x4F000000 >> 16)
/* C6DC8 001C6CC8 00008344 */  mtc1       $3, $f0
/* C6DCC 001C6CCC 00000000 */  nop
/* C6DD0 001C6CD0 43080046 */  div.s      $f1, $f1, $f0
/* C6DD4 001C6CD4 F041033C */  lui        $3, (0x41F00000 >> 16)
/* C6DD8 001C6CD8 00008344 */  mtc1       $3, $f0
/* C6DDC 001C6CDC 00000000 */  nop
/* C6DE0 001C6CE0 36080046 */  c.le.s     $f1, $f0
/* C6DE4 001C6CE4 00000000 */  nop
/* C6DE8 001C6CE8 13000045 */  bc1f       .L001C6D38
/* C6DEC 001C6CEC 00000000 */   nop
/* C6DF0 001C6CF0 01000324 */  addiu      $3, $0, 0x1
/* C6DF4 001C6CF4 10002316 */  bne        $17, $3, .L001C6D38
/* C6DF8 001C6CF8 00000000 */   nop
/* C6DFC 001C6CFC 80181300 */  sll        $3, $19, 2
/* C6E00 001C6D00 21187300 */  addu       $3, $3, $19
/* C6E04 001C6D04 80180300 */  sll        $3, $3, 2
/* C6E08 001C6D08 21204302 */  addu       $4, $18, $3
/* C6E0C 001C6D0C C0180400 */  sll        $3, $4, 3
/* C6E10 001C6D10 21186400 */  addu       $3, $3, $4
/* C6E14 001C6D14 40180300 */  sll        $3, $3, 1
/* C6E18 001C6D18 21186400 */  addu       $3, $3, $4
/* C6E1C 001C6D1C 80200300 */  sll        $4, $3, 2
/* C6E20 001C6D20 D501033C */  lui        $3, %hi(D_1D56DE8)
/* C6E24 001C6D24 E86D6324 */  addiu      $3, $3, %lo(D_1D56DE8)
/* C6E28 001C6D28 21206400 */  addu       $4, $3, $4
/* C6E2C 001C6D2C 0000838C */  lw         $3, 0x0($4)
/* C6E30 001C6D30 40006334 */  ori        $3, $3, 0x40
/* C6E34 001C6D34 000083AC */  sw         $3, 0x0($4)
.L001C6D38:
/* C6E38 001C6D38 01001026 */  addiu      $16, $16, 0x1
.L001C6D3C:
/* C6E3C 001C6D3C 0494838F */  lw         $3, -0x6BFC($gp)
/* C6E40 001C6D40 2A180302 */  slt        $3, $16, $3
/* C6E44 001C6D44 49FF6014 */  bnez       $3, .L001C6A6C
/* C6E48 001C6D48 00000000 */   nop
/* C6E4C 001C6D4C 5000BF7B */  lq         $31, 0x50($sp)
/* C6E50 001C6D50 4000B47B */  lq         $20, 0x40($sp)
/* C6E54 001C6D54 3000B37B */  lq         $19, 0x30($sp)
/* C6E58 001C6D58 2000B27B */  lq         $18, 0x20($sp)
/* C6E5C 001C6D5C 1000B17B */  lq         $17, 0x10($sp)
/* C6E60 001C6D60 0000B07B */  lq         $16, 0x0($sp)
/* C6E64 001C6D64 6000BD27 */  addiu      $sp, $sp, 0x60
/* C6E68 001C6D68 0800E003 */  jr         $31
/* C6E6C 001C6D6C 00000000 */   nop
