.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadSqInf__6CSoundFPcPUi
/* 44B90 00144A90 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 44B94 00144A94 1000BF7F */  sq         $31, 0x10($sp)
/* 44B98 00144A98 0000B07F */  sq         $16, 0x0($sp)
/* 44B9C 00144A9C 2886C070 */  paddub     $16, $6, $0
/* 44BA0 00144AA0 2826A070 */  paddub     $4, $5, $0
/* 44BA4 00144AA4 282E0072 */  paddub     $5, $16, $0
/* 44BA8 00144AA8 2800A627 */  addiu      $6, $sp, 0x28
/* 44BAC 00144AAC D8FC040C */  jal        LoadFile__FPcPvPi
/* 44BB0 00144AB0 00000000 */   nop
/* 44BB4 00144AB4 2800A28F */  lw         $2, 0x28($sp)
/* 44BB8 00144AB8 21100202 */  addu       $2, $16, $2
/* 44BBC 00144ABC 000040A0 */  sb         $0, 0x0($2)
/* 44BC0 00144AC0 2000A427 */  addiu      $4, $sp, 0x20
/* 44BC4 00144AC4 B88680C7 */  lwc1       $f0, -0x7948($gp)
/* 44BC8 00144AC8 BC868387 */  lh         $3, -0x7944($gp)
/* 44BCC 00144ACC BE868293 */  lbu        $2, -0x7942($gp)
/* 44BD0 00144AD0 000080E4 */  swc1       $f0, 0x0($4)
/* 44BD4 00144AD4 040083A4 */  sh         $3, 0x4($4)
/* 44BD8 00144AD8 060082A0 */  sb         $2, 0x6($4)
/* 44BDC 00144ADC 28260072 */  paddub     $4, $16, $0
/* 44BE0 00144AE0 2A00023C */  lui        $2, %hi(_546)
/* 44BE4 00144AE4 88984524 */  addiu      $5, $2, %lo(_546)
/* 44BE8 00144AE8 A21A040C */  jal        strtok
/* 44BEC 00144AEC 00000000 */   nop
/* 44BF0 00144AF0 28260070 */  paddub     $4, $0, $0
/* 44BF4 00144AF4 2000A527 */  addiu      $5, $sp, 0x20
/* 44BF8 00144AF8 A21A040C */  jal        strtok
/* 44BFC 00144AFC 00000000 */   nop
/* 44C00 00144B00 26000010 */  b          .L00144B9C
/* 44C04 00144B04 00000000 */   nop
.L00144B08:
/* 44C08 00144B08 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 44C0C 00144B0C 409F238C */  lw         $3, -0x60C0($at)
/* 44C10 00144B10 00210300 */  sll        $4, $3, 4
/* 44C14 00144B14 CF01033C */  lui        $3, %hi(sq_inf_tbl)
/* 44C18 00144B18 40866324 */  addiu      $3, $3, %lo(sq_inf_tbl)
/* 44C1C 00144B1C 21206400 */  addu       $4, $3, $4
/* 44C20 00144B20 282E4070 */  paddub     $5, $2, $0
/* 44C24 00144B24 09000624 */  addiu      $6, $0, 0x9
/* 44C28 00144B28 5C16040C */  jal        strncpy
/* 44C2C 00144B2C 00000000 */   nop
/* 44C30 00144B30 28260070 */  paddub     $4, $0, $0
/* 44C34 00144B34 2000A527 */  addiu      $5, $sp, 0x20
/* 44C38 00144B38 A21A040C */  jal        strtok
/* 44C3C 00144B3C 00000000 */   nop
/* 44C40 00144B40 2C00A427 */  addiu      $4, $sp, 0x2C
/* 44C44 00144B44 282E4070 */  paddub     $5, $2, $0
/* 44C48 00144B48 5A15040C */  jal        strcpy
/* 44C4C 00144B4C 00000000 */   nop
/* 44C50 00144B50 2C00A427 */  addiu      $4, $sp, 0x2C
/* 44C54 00144B54 8E00040C */  jal        atoi
/* 44C58 00144B58 00000000 */   nop
/* 44C5C 00144B5C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 44C60 00144B60 409F238C */  lw         $3, -0x60C0($at)
/* 44C64 00144B64 00210300 */  sll        $4, $3, 4
/* 44C68 00144B68 CF01033C */  lui        $3, %hi(D_1CE864C)
/* 44C6C 00144B6C 4C866324 */  addiu      $3, $3, %lo(D_1CE864C)
/* 44C70 00144B70 21186400 */  addu       $3, $3, $4
/* 44C74 00144B74 000062AC */  sw         $2, 0x0($3)
/* 44C78 00144B78 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 44C7C 00144B7C 409F228C */  lw         $2, -0x60C0($at)
/* 44C80 00144B80 01004224 */  addiu      $2, $2, 0x1
/* 44C84 00144B84 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 44C88 00144B88 409F22AC */  sw         $2, -0x60C0($at)
/* 44C8C 00144B8C 28260070 */  paddub     $4, $0, $0
/* 44C90 00144B90 2000A527 */  addiu      $5, $sp, 0x20
/* 44C94 00144B94 A21A040C */  jal        strtok
/* 44C98 00144B98 00000000 */   nop
.L00144B9C:
/* 44C9C 00144B9C DAFF4014 */  bnez       $2, .L00144B08
/* 44CA0 00144BA0 00000000 */   nop
/* 44CA4 00144BA4 2800A28F */  lw         $2, 0x28($sp)
/* 44CA8 00144BA8 1000BF7B */  lq         $31, 0x10($sp)
/* 44CAC 00144BAC 0000B07B */  lq         $16, 0x0($sp)
/* 44CB0 00144BB0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 44CB4 00144BB4 0800E003 */  jr         $31
/* 44CB8 00144BB8 00000000 */   nop
/* 44CBC 00144BBC 00000000 */  nop
