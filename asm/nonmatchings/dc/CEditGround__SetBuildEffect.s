.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetBuildEffect__11CEditGroundFi
/* A1AE0 001A19E0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* A1AE4 001A19E4 3000BF7F */  sq         $31, 0x30($sp)
/* A1AE8 001A19E8 2000B27F */  sq         $18, 0x20($sp)
/* A1AEC 001A19EC 1000B17F */  sq         $17, 0x10($sp)
/* A1AF0 001A19F0 0000B07F */  sq         $16, 0x0($sp)
/* A1AF4 001A19F4 28868070 */  paddub     $16, $4, $0
/* A1AF8 001A19F8 0400A004 */  bltz       $5, .L001A1A0C
/* A1AFC 001A19FC 00000000 */   nop
/* A1B00 001A1A00 8000A328 */  slti       $3, $5, 0x80
/* A1B04 001A1A04 03006014 */  bnez       $3, .L001A1A14
/* A1B08 001A1A08 00000000 */   nop
.L001A1A0C:
/* A1B0C 001A1A0C 3A000010 */  b          .L001A1AF8
/* A1B10 001A1A10 00000000 */   nop
.L001A1A14:
/* A1B14 001A1A14 C0180500 */  sll        $3, $5, 3
/* A1B18 001A1A18 23206500 */  subu       $4, $3, $5
/* A1B1C 001A1A1C 80180400 */  sll        $3, $4, 2
/* A1B20 001A1A20 23186400 */  subu       $3, $3, $4
/* A1B24 001A1A24 40190300 */  sll        $3, $3, 5
/* A1B28 001A1A28 21207000 */  addu       $4, $3, $16
/* A1B2C 001A1A2C 4801838C */  lw         $3, 0x148($4)
/* A1B30 001A1A30 31006014 */  bnez       $3, .L001A1AF8
/* A1B34 001A1A34 00000000 */   nop
/* A1B38 001A1A38 0100013C */  lui        $at, (0x15F04 >> 16)
/* A1B3C 001A1A3C 21080102 */  addu       $at, $16, $at
/* A1B40 001A1A40 045F25AC */  sw         $5, (0x15F04 & 0xFFFF)($at)
/* A1B44 001A1A44 0F000224 */  addiu      $2, $0, 0xF
/* A1B48 001A1A48 0100013C */  lui        $at, (0x15F00 >> 16)
/* A1B4C 001A1A4C 21080102 */  addu       $at, $16, $at
/* A1B50 001A1A50 005F22AC */  sw         $2, (0x15F00 & 0xFFFF)($at)
/* A1B54 001A1A54 30009224 */  addiu      $18, $4, 0x30
/* A1B58 001A1A58 28264072 */  paddub     $4, $18, $0
/* A1B5C 001A1A5C 4000A527 */  addiu      $5, $sp, 0x40
/* A1B60 001A1A60 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A1B64 001A1A64 00000000 */   nop
/* A1B68 001A1A68 4400B127 */  addiu      $17, $sp, 0x44
/* A1B6C 001A1A6C 000020C6 */  lwc1       $f0, 0x0($17)
/* A1B70 001A1A70 0100013C */  lui        $at, (0x15F0C >> 16)
/* A1B74 001A1A74 21080102 */  addu       $at, $16, $at
/* A1B78 001A1A78 0C5F20E4 */  swc1       $f0, (0x15F0C & 0xFFFF)($at)
/* A1B7C 001A1A7C 000021C6 */  lwc1       $f1, 0x0($17)
/* A1B80 001A1A80 4842023C */  lui        $2, (0x42480000 >> 16)
/* A1B84 001A1A84 00008244 */  mtc1       $2, $f0
/* A1B88 001A1A88 00000000 */  nop
/* A1B8C 001A1A8C 00080046 */  add.s      $f0, $f1, $f0
/* A1B90 001A1A90 000020E6 */  swc1       $f0, 0x0($17)
/* A1B94 001A1A94 28264072 */  paddub     $4, $18, $0
/* A1B98 001A1A98 4000A527 */  addiu      $5, $sp, 0x40
/* A1B9C 001A1A9C A000598E */  lw         $25, 0xA0($18)
/* A1BA0 001A1AA0 1400398F */  lw         $25, 0x14($25)
/* A1BA4 001A1AA4 09F82003 */  jalr       $25
/* A1BA8 001A1AA8 00000000 */   nop
/* A1BAC 001A1AAC 000020C6 */  lwc1       $f0, 0x0($17)
/* A1BB0 001A1AB0 0100013C */  lui        $at, (0x15F08 >> 16)
/* A1BB4 001A1AB4 21080102 */  addu       $at, $16, $at
/* A1BB8 001A1AB8 085F20E4 */  swc1       $f0, (0x15F08 & 0xFFFF)($at)
/* A1BBC 001A1ABC 0100013C */  lui        $at, (0x15F0C >> 16)
/* A1BC0 001A1AC0 21080102 */  addu       $at, $16, $at
/* A1BC4 001A1AC4 0C5F21C4 */  lwc1       $f1, (0x15F0C & 0xFFFF)($at)
/* A1BC8 001A1AC8 0100013C */  lui        $at, (0x15F08 >> 16)
/* A1BCC 001A1ACC 21080102 */  addu       $at, $16, $at
/* A1BD0 001A1AD0 085F20C4 */  lwc1       $f0, (0x15F08 & 0xFFFF)($at)
/* A1BD4 001A1AD4 41080046 */  sub.s      $f1, $f1, $f0
/* A1BD8 001A1AD8 0100013C */  lui        $at, (0x15F00 >> 16)
/* A1BDC 001A1ADC 21080102 */  addu       $at, $16, $at
/* A1BE0 001A1AE0 005F20C4 */  lwc1       $f0, (0x15F00 & 0xFFFF)($at)
/* A1BE4 001A1AE4 20008046 */  cvt.s.w    $f0, $f0
/* A1BE8 001A1AE8 03080046 */  div.s      $f0, $f1, $f0
/* A1BEC 001A1AEC 0100013C */  lui        $at, (0x15F10 >> 16)
/* A1BF0 001A1AF0 21080102 */  addu       $at, $16, $at
/* A1BF4 001A1AF4 105F20E4 */  swc1       $f0, (0x15F10 & 0xFFFF)($at)
.L001A1AF8:
/* A1BF8 001A1AF8 3000BF7B */  lq         $31, 0x30($sp)
/* A1BFC 001A1AFC 2000B27B */  lq         $18, 0x20($sp)
/* A1C00 001A1B00 1000B17B */  lq         $17, 0x10($sp)
/* A1C04 001A1B04 0000B07B */  lq         $16, 0x0($sp)
/* A1C08 001A1B08 5000BD27 */  addiu      $sp, $sp, 0x50
/* A1C0C 001A1B0C 0800E003 */  jr         $31
/* A1C10 001A1B10 00000000 */   nop
/* A1C14 001A1B14 00000000 */  nop
/* A1C18 001A1B18 00000000 */  nop
/* A1C1C 001A1B1C 00000000 */  nop
