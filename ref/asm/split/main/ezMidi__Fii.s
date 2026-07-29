.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ezMidi__Fii
/* 047B00 00147A00 E0FFBD27 */  addiu       $29, $29, -0x20
/* 047B04 00147A04 1000BF7F */  sq          $31, 0x10($29)
/* 047B08 00147A08 28368070 */  paddub      $6, $4, $0
/* 047B0C 00147A0C 283EA070 */  paddub      $7, $5, $0
/* 047B10 00147A10 28560070 */  paddub      $10, $0, $0
/* 047B14 00147A14 281E0070 */  paddub      $3, $0, $0
/* 047B18 00147A18 02000010 */  b           .L00147A24
/* 047B1C 00147A1C 00000000 */   nop
.L00147A20:
/* 047B20 00147A20 01006324 */  addiu       $3, $3, 0x1
.L00147A24:
/* 047B24 00147A24 D0076228 */  slti        $2, $3, 0x7D0
/* 047B28 00147A28 FDFF4014 */  bnez        $2, .L00147A20
/* 047B2C 00147A2C 00000000 */   nop
/* 047B30 00147A30 0080C230 */  andi        $2, $6, 0x8000
/* 047B34 00147A34 02004010 */  beqz        $2, .L00147A40
/* 047B38 00147A38 00000000 */   nop
/* 047B3C 00147A3C 40000A24 */  addiu       $10, $0, 0x40
.L00147A40:
/* 047B40 00147A40 0010C230 */  andi        $2, $6, 0x1000
/* 047B44 00147A44 0E004010 */  beqz        $2, .L00147A80
/* 047B48 00147A48 00000000 */   nop
/* 047B4C 00147A4C 0000A0FF */  sd          $0, 0x0($29)
/* 047B50 00147A50 CF01023C */  lui         $2, %hi(sbuff__2)
/* 047B54 00147A54 80CE4924 */  addiu       $9, $2, %lo(sbuff__2)
/* 047B58 00147A58 CF01023C */  lui         $2, %hi(gCd)
/* 047B5C 00147A5C C0CE4424 */  addiu       $4, $2, %lo(gCd)
/* 047B60 00147A60 282EC070 */  paddub      $5, $6, $0
/* 047B64 00147A64 28360070 */  paddub      $6, $0, $0
/* 047B68 00147A68 40000824 */  addiu       $8, $0, 0x40
/* 047B6C 00147A6C 285E0070 */  paddub      $11, $0, $0
/* 047B70 00147A70 2A5D040C */  jal         sceSifCallRpc
/* 047B74 00147A74 00000000 */   nop
/* 047B78 00147A78 10000010 */  b           .L00147ABC
/* 047B7C 00147A7C 00000000 */   nop
.L00147A80:
/* 047B80 00147A80 CF01013C */  lui         $1, %hi(sbuff__2)
/* 047B84 00147A84 80CE27AC */  sw          $7, %lo(sbuff__2)($1)
/* 047B88 00147A88 0000A0FF */  sd          $0, 0x0($29)
/* 047B8C 00147A8C CF01023C */  lui         $2, %hi(sbuff__2)
/* 047B90 00147A90 80CE4724 */  addiu       $7, $2, %lo(sbuff__2)
/* 047B94 00147A94 CF01023C */  lui         $2, %hi(sbuff__2)
/* 047B98 00147A98 80CE4924 */  addiu       $9, $2, %lo(sbuff__2)
/* 047B9C 00147A9C CF01023C */  lui         $2, %hi(gCd)
/* 047BA0 00147AA0 C0CE4424 */  addiu       $4, $2, %lo(gCd)
/* 047BA4 00147AA4 282EC070 */  paddub      $5, $6, $0
/* 047BA8 00147AA8 28360070 */  paddub      $6, $0, $0
/* 047BAC 00147AAC 10000824 */  addiu       $8, $0, 0x10
/* 047BB0 00147AB0 285E0070 */  paddub      $11, $0, $0
/* 047BB4 00147AB4 2A5D040C */  jal         sceSifCallRpc
/* 047BB8 00147AB8 00000000 */   nop
.L00147ABC:
/* 047BBC 00147ABC CF01013C */  lui         $1, %hi(sbuff__2)
/* 047BC0 00147AC0 80CE228C */  lw          $2, %lo(sbuff__2)($1)
/* 047BC4 00147AC4 1000BF7B */  lq          $31, 0x10($29)
/* 047BC8 00147AC8 2000BD27 */  addiu       $29, $29, 0x20
/* 047BCC 00147ACC 0800E003 */  jr          $31
/* 047BD0 00147AD0 00000000 */   nop
/* 047BD4 00147AD4 00000000 */  nop
/* 047BD8 00147AD8 00000000 */  nop
/* 047BDC 00147ADC 00000000 */  nop
