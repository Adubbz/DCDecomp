.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__4CMapFv
/* 43BA0 00143AA0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 43BA4 00143AA4 2000BF7F */  sq         $31, 0x20($sp)
/* 43BA8 00143AA8 1000B17F */  sq         $17, 0x10($sp)
/* 43BAC 00143AAC 0000B07F */  sq         $16, 0x0($sp)
/* 43BB0 00143AB0 288E8070 */  paddub     $17, $4, $0
/* 43BB4 00143AB4 28860070 */  paddub     $16, $0, $0
/* 43BB8 00143AB8 0B000010 */  b          .L00143AE8
/* 43BBC 00143ABC 00000000 */   nop
.L00143AC0:
/* 43BC0 00143AC0 80BF053C */  lui        $5, (0xBF800000 >> 16)
/* 43BC4 00143AC4 40181000 */  sll        $3, $16, 1
/* 43BC8 00143AC8 21187000 */  addu       $3, $3, $16
/* 43BCC 00143ACC C0180300 */  sll        $3, $3, 3
/* 43BD0 00143AD0 21202302 */  addu       $4, $17, $3
/* 43BD4 00143AD4 000085AC */  sw         $5, 0x0($4)
/* 43BD8 00143AD8 100080AC */  sw         $0, 0x10($4)
/* 43BDC 00143ADC 03000324 */  addiu      $3, $0, 0x3
/* 43BE0 00143AE0 140083AC */  sw         $3, 0x14($4)
/* 43BE4 00143AE4 01001026 */  addiu      $16, $16, 0x1
.L00143AE8:
/* 43BE8 00143AE8 1000032A */  slti       $3, $16, 0x10
/* 43BEC 00143AEC F4FF6014 */  bnez       $3, .L00143AC0
/* 43BF0 00143AF0 00000000 */   nop
/* 43BF4 00143AF4 28860070 */  paddub     $16, $0, $0
/* 43BF8 00143AF8 09000010 */  b          .L00143B20
/* 43BFC 00143AFC 00000000 */   nop
.L00143B00:
/* 43C00 00143B00 00111000 */  sll        $2, $16, 4
/* 43C04 00143B04 23105000 */  subu       $2, $2, $16
/* 43C08 00143B08 00110200 */  sll        $2, $2, 4
/* 43C0C 00143B0C 21102202 */  addu       $2, $17, $2
/* 43C10 00143B10 80014424 */  addiu      $4, $2, 0x180
/* 43C14 00143B14 445E050C */  jal        Initialize__10CMapObjectFv
/* 43C18 00143B18 00000000 */   nop
/* 43C1C 00143B1C 01001026 */  addiu      $16, $16, 0x1
.L00143B20:
/* 43C20 00143B20 0A00032A */  slti       $3, $16, 0xA
/* 43C24 00143B24 F6FF6014 */  bnez       $3, .L00143B00
/* 43C28 00143B28 00000000 */   nop
/* 43C2C 00143B2C 01000324 */  addiu      $3, $0, 0x1
/* 43C30 00143B30 E00A23AE */  sw         $3, 0xAE0($17)
/* 43C34 00143B34 2000BF7B */  lq         $31, 0x20($sp)
/* 43C38 00143B38 1000B17B */  lq         $17, 0x10($sp)
/* 43C3C 00143B3C 0000B07B */  lq         $16, 0x0($sp)
/* 43C40 00143B40 3000BD27 */  addiu      $sp, $sp, 0x30
/* 43C44 00143B44 0800E003 */  jr         $31
/* 43C48 00143B48 00000000 */   nop
/* 43C4C 00143B4C 00000000 */  nop
