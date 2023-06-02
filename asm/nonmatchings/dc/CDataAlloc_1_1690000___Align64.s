.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Align64__21CDataAlloc_1_1690000_Fv
/* 27BA0 00127AA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 27BA4 00127AA4 0000BF7F */  sq         $31, 0x0($sp)
/* 27BA8 00127AA8 1E000014 */  bnez       $0, .L00127B24
/* 27BAC 00127AAC 00000000 */   nop
/* 27BB0 00127AB0 9D01013C */  lui        $at, (0x19D0000 >> 16)
/* 27BB4 00127AB4 21088100 */  addu       $at, $4, $at
/* 27BB8 00127AB8 0099258C */  lw         $5, -0x6700($at)
/* 27BBC 00127ABC 00190500 */  sll        $3, $5, 4
/* 27BC0 00127AC0 21188300 */  addu       $3, $4, $3
/* 27BC4 00127AC4 3F006630 */  andi       $6, $3, 0x3F
/* 27BC8 00127AC8 0800C010 */  beqz       $6, .L00127AEC
/* 27BCC 00127ACC 00000000 */   nop
/* 27BD0 00127AD0 40000324 */  addiu      $3, $0, 0x40
/* 27BD4 00127AD4 23186600 */  subu       $3, $3, $6
/* 27BD8 00127AD8 02190300 */  srl        $3, $3, 4
/* 27BDC 00127ADC 2118A300 */  addu       $3, $5, $3
/* 27BE0 00127AE0 9D01013C */  lui        $at, (0x19D0000 >> 16)
/* 27BE4 00127AE4 21088100 */  addu       $at, $4, $at
/* 27BE8 00127AE8 009923AC */  sw         $3, -0x6700($at)
.L00127AEC:
/* 27BEC 00127AEC 9D01013C */  lui        $at, (0x19D0000 >> 16)
/* 27BF0 00127AF0 21088100 */  addu       $at, $4, $at
/* 27BF4 00127AF4 0099258C */  lw         $5, -0x6700($at)
/* 27BF8 00127AF8 1900033C */  lui        $3, (0x19C990 >> 16)
/* 27BFC 00127AFC 90C96634 */  ori        $6, $3, (0x19C990 & 0xFFFF)
/* 27C00 00127B00 2A18A600 */  slt        $3, $5, $6
/* 27C04 00127B04 07006014 */  bnez       $3, .L00127B24
/* 27C08 00127B08 00000000 */   nop
/* 27C0C 00127B0C 2A00023C */  lui        $2, %hi(_744)
/* 27C10 00127B10 D08D4424 */  addiu      $4, $2, %lo(_744)
/* 27C14 00127B14 A611040C */  jal        printf
/* 27C18 00127B18 00000000 */   nop
.L00127B1C:
/* 27C1C 00127B1C FFFF0010 */  b          .L00127B1C
/* 27C20 00127B20 00000000 */   nop
.L00127B24:
/* 27C24 00127B24 0000BF7B */  lq         $31, 0x0($sp)
/* 27C28 00127B28 1000BD27 */  addiu      $sp, $sp, 0x10
/* 27C2C 00127B2C 0800E003 */  jr         $31
/* 27C30 00127B30 00000000 */   nop
/* 27C34 00127B34 00000000 */  nop
/* 27C38 00127B38 00000000 */  nop
/* 27C3C 00127B3C 00000000 */  nop
