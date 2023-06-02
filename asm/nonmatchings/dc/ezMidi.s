.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ezMidi__Fii
/* 47B00 00147A00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 47B04 00147A04 1000BF7F */  sq         $31, 0x10($sp)
/* 47B08 00147A08 28368070 */  paddub     $6, $4, $0
/* 47B0C 00147A0C 283EA070 */  paddub     $7, $5, $0
/* 47B10 00147A10 28560070 */  paddub     $10, $0, $0
/* 47B14 00147A14 281E0070 */  paddub     $3, $0, $0
/* 47B18 00147A18 02000010 */  b          .L00147A24
/* 47B1C 00147A1C 00000000 */   nop
.L00147A20:
/* 47B20 00147A20 01006324 */  addiu      $3, $3, 0x1
.L00147A24:
/* 47B24 00147A24 D0076228 */  slti       $2, $3, 0x7D0
/* 47B28 00147A28 FDFF4014 */  bnez       $2, .L00147A20
/* 47B2C 00147A2C 00000000 */   nop
/* 47B30 00147A30 0080C230 */  andi       $2, $6, 0x8000
/* 47B34 00147A34 02004010 */  beqz       $2, .L00147A40
/* 47B38 00147A38 00000000 */   nop
/* 47B3C 00147A3C 40000A24 */  addiu      $10, $0, 0x40
.L00147A40:
/* 47B40 00147A40 0010C230 */  andi       $2, $6, 0x1000
/* 47B44 00147A44 0E004010 */  beqz       $2, .L00147A80
/* 47B48 00147A48 00000000 */   nop
/* 47B4C 00147A4C 0000A0FF */  sd         $0, 0x0($sp)
/* 47B50 00147A50 CF01023C */  lui        $2, %hi(sbuff)
/* 47B54 00147A54 80CE4924 */  addiu      $9, $2, %lo(sbuff)
/* 47B58 00147A58 CF01023C */  lui        $2, %hi(gCd)
/* 47B5C 00147A5C C0CE4424 */  addiu      $4, $2, %lo(gCd)
/* 47B60 00147A60 282EC070 */  paddub     $5, $6, $0
/* 47B64 00147A64 28360070 */  paddub     $6, $0, $0
/* 47B68 00147A68 40000824 */  addiu      $8, $0, 0x40
/* 47B6C 00147A6C 285E0070 */  paddub     $11, $0, $0
/* 47B70 00147A70 2A5D040C */  jal        sceSifCallRpc
/* 47B74 00147A74 00000000 */   nop
/* 47B78 00147A78 10000010 */  b          .L00147ABC
/* 47B7C 00147A7C 00000000 */   nop
.L00147A80:
/* 47B80 00147A80 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 47B84 00147A84 80CE27AC */  sw         $7, -0x3180($at)
/* 47B88 00147A88 0000A0FF */  sd         $0, 0x0($sp)
/* 47B8C 00147A8C CF01023C */  lui        $2, %hi(sbuff)
/* 47B90 00147A90 80CE4724 */  addiu      $7, $2, %lo(sbuff)
/* 47B94 00147A94 CF01023C */  lui        $2, %hi(sbuff)
/* 47B98 00147A98 80CE4924 */  addiu      $9, $2, %lo(sbuff)
/* 47B9C 00147A9C CF01023C */  lui        $2, %hi(gCd)
/* 47BA0 00147AA0 C0CE4424 */  addiu      $4, $2, %lo(gCd)
/* 47BA4 00147AA4 282EC070 */  paddub     $5, $6, $0
/* 47BA8 00147AA8 28360070 */  paddub     $6, $0, $0
/* 47BAC 00147AAC 10000824 */  addiu      $8, $0, 0x10
/* 47BB0 00147AB0 285E0070 */  paddub     $11, $0, $0
/* 47BB4 00147AB4 2A5D040C */  jal        sceSifCallRpc
/* 47BB8 00147AB8 00000000 */   nop
.L00147ABC:
/* 47BBC 00147ABC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 47BC0 00147AC0 80CE228C */  lw         $2, -0x3180($at)
/* 47BC4 00147AC4 1000BF7B */  lq         $31, 0x10($sp)
/* 47BC8 00147AC8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 47BCC 00147ACC 0800E003 */  jr         $31
/* 47BD0 00147AD0 00000000 */   nop
/* 47BD4 00147AD4 00000000 */  nop
/* 47BD8 00147AD8 00000000 */  nop
/* 47BDC 00147ADC 00000000 */  nop
