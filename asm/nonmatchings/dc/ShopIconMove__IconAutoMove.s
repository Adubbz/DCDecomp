.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel IconAutoMove__12ShopIconMoveFii
/* E6AA0 001E69A0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* E6AA4 001E69A4 6000BF7F */  sq         $31, 0x60($sp)
/* E6AA8 001E69A8 5000B57F */  sq         $21, 0x50($sp)
/* E6AAC 001E69AC 4000B47F */  sq         $20, 0x40($sp)
/* E6AB0 001E69B0 3000B37F */  sq         $19, 0x30($sp)
/* E6AB4 001E69B4 2000B27F */  sq         $18, 0x20($sp)
/* E6AB8 001E69B8 1000B17F */  sq         $17, 0x10($sp)
/* E6ABC 001E69BC 0000B07F */  sq         $16, 0x0($sp)
/* E6AC0 001E69C0 28AE8070 */  paddub     $21, $4, $0
/* E6AC4 001E69C4 28A6C070 */  paddub     $20, $6, $0
/* E6AC8 001E69C8 10008284 */  lh         $2, 0x10($4)
/* E6ACC 001E69CC 51004128 */  slti       $at, $2, 0x51
/* E6AD0 001E69D0 04002010 */  beqz       $at, .L001E69E4
/* E6AD4 001E69D4 00000000 */   nop
/* E6AD8 001E69D8 FFFF0224 */  addiu      $2, $0, -0x1
/* E6ADC 001E69DC FE000010 */  b          .L001E6DD8
/* E6AE0 001E69E0 00000000 */   nop
.L001E69E4:
/* E6AE4 001E69E4 0600A786 */  lh         $7, 0x6($21)
/* E6AE8 001E69E8 05000624 */  addiu      $6, $0, 0x5
/* E6AEC 001E69EC 1A00E600 */  div        $0, $7, $6
/* E6AF0 001E69F0 00000000 */  nop
/* E6AF4 001E69F4 00000000 */  nop
/* E6AF8 001E69F8 10180000 */  mfhi       $3
/* E6AFC 001E69FC 80100300 */  sll        $2, $3, 2
/* E6B00 001E6A00 21104300 */  addu       $2, $2, $3
/* E6B04 001E6A04 C0400200 */  sll        $8, $2, 3
/* E6B08 001E6A08 1A00E600 */  div        $0, $7, $6
/* E6B0C 001E6A0C 0200C014 */  bnez       $6, .L001E6A18
/* E6B10 001E6A10 00000000 */   nop
/* E6B14 001E6A14 CD010000 */  break      0, 7
.L001E6A18:
/* E6B18 001E6A18 12180000 */  mflo       $3
/* E6B1C 001E6A1C 80100300 */  sll        $2, $3, 2
/* E6B20 001E6A20 21104300 */  addu       $2, $2, $3
/* E6B24 001E6A24 C0180200 */  sll        $3, $2, 3
/* E6B28 001E6A28 0500A010 */  beqz       $5, .L001E6A40
/* E6B2C 001E6A2C 00000000 */   nop
/* E6B30 001E6A30 6A011025 */  addiu      $16, $8, 0x16A
/* E6B34 001E6A34 86007124 */  addiu      $17, $3, 0x86
/* E6B38 001E6A38 03000010 */  b          .L001E6A48
/* E6B3C 001E6A3C 00000000 */   nop
.L001E6A40:
/* E6B40 001E6A40 6A011025 */  addiu      $16, $8, 0x16A
/* E6B44 001E6A44 90007124 */  addiu      $17, $3, 0x90
.L001E6A48:
/* E6B48 001E6A48 0000A286 */  lh         $2, 0x0($21)
/* E6B4C 001E6A4C 03004010 */  beqz       $2, .L001E6A5C
/* E6B50 001E6A50 00000000 */   nop
/* E6B54 001E6A54 3E001025 */  addiu      $16, $8, 0x3E
/* E6B58 001E6A58 90007124 */  addiu      $17, $3, 0x90
.L001E6A5C:
/* E6B5C 001E6A5C 0800ACC6 */  lwc1       $f12, 0x8($21)
/* E6B60 001E6A60 2C44040C */  jal        fptosi
/* E6B64 001E6A64 00000000 */   nop
/* E6B68 001E6A68 23100202 */  subu       $2, $16, $2
/* E6B6C 001E6A6C 00008244 */  mtc1       $2, $f0
/* E6B70 001E6A70 00000000 */  nop
/* E6B74 001E6A74 60008046 */  cvt.s.w    $f1, $f0
/* E6B78 001E6A78 8040023C */  lui        $2, (0x40800000 >> 16)
/* E6B7C 001E6A7C 00008244 */  mtc1       $2, $f0
/* E6B80 001E6A80 00000000 */  nop
/* E6B84 001E6A84 43080046 */  div.s      $f1, $f1, $f0
/* E6B88 001E6A88 0800A0C6 */  lwc1       $f0, 0x8($21)
/* E6B8C 001E6A8C 00000146 */  add.s      $f0, $f0, $f1
/* E6B90 001E6A90 0800A0E6 */  swc1       $f0, 0x8($21)
/* E6B94 001E6A94 0C00ACC6 */  lwc1       $f12, 0xC($21)
/* E6B98 001E6A98 2C44040C */  jal        fptosi
/* E6B9C 001E6A9C 00000000 */   nop
/* E6BA0 001E6AA0 23102202 */  subu       $2, $17, $2
/* E6BA4 001E6AA4 00008244 */  mtc1       $2, $f0
/* E6BA8 001E6AA8 00000000 */  nop
/* E6BAC 001E6AAC 60008046 */  cvt.s.w    $f1, $f0
/* E6BB0 001E6AB0 8040023C */  lui        $2, (0x40800000 >> 16)
/* E6BB4 001E6AB4 00008244 */  mtc1       $2, $f0
/* E6BB8 001E6AB8 00000000 */  nop
/* E6BBC 001E6ABC 43080046 */  div.s      $f1, $f1, $f0
/* E6BC0 001E6AC0 0C00A0C6 */  lwc1       $f0, 0xC($21)
/* E6BC4 001E6AC4 00000146 */  add.s      $f0, $f0, $f1
/* E6BC8 001E6AC8 0C00A0E6 */  swc1       $f0, 0xC($21)
/* E6BCC 001E6ACC 28960070 */  paddub     $18, $0, $0
/* E6BD0 001E6AD0 15008016 */  bnez       $20, .L001E6B28
/* E6BD4 001E6AD4 00000000 */   nop
/* E6BD8 001E6AD8 0800A1C6 */  lwc1       $f1, 0x8($21)
/* E6BDC 001E6ADC 00009044 */  mtc1       $16, $f0
/* E6BE0 001E6AE0 00000000 */  nop
/* E6BE4 001E6AE4 20008046 */  cvt.s.w    $f0, $f0
/* E6BE8 001E6AE8 010B0046 */  sub.s      $f12, $f1, $f0
/* E6BEC 001E6AEC 2C44040C */  jal        fptosi
/* E6BF0 001E6AF0 00000000 */   nop
/* E6BF4 001E6AF4 28264070 */  paddub     $4, $2, $0
/* E6BF8 001E6AF8 7200040C */  jal        abs
/* E6BFC 001E6AFC 00000000 */   nop
/* E6C00 001E6B00 00008244 */  mtc1       $2, $f0
/* E6C04 001E6B04 00000000 */  nop
/* E6C08 001E6B08 60008046 */  cvt.s.w    $f1, $f0
/* E6C0C 001E6B0C 8040023C */  lui        $2, (0x40800000 >> 16)
/* E6C10 001E6B10 00008244 */  mtc1       $2, $f0
/* E6C14 001E6B14 00000000 */  nop
/* E6C18 001E6B18 34080046 */  c.lt.s     $f1, $f0
/* E6C1C 001E6B1C 00000000 */  nop
/* E6C20 001E6B20 06000045 */  bc1f       .L001E6B3C
/* E6C24 001E6B24 00000000 */   nop
.L001E6B28:
/* E6C28 001E6B28 00009044 */  mtc1       $16, $f0
/* E6C2C 001E6B2C 00000000 */  nop
/* E6C30 001E6B30 20008046 */  cvt.s.w    $f0, $f0
/* E6C34 001E6B34 0800A0E6 */  swc1       $f0, 0x8($21)
/* E6C38 001E6B38 01005226 */  addiu      $18, $18, 0x1
.L001E6B3C:
/* E6C3C 001E6B3C 15008016 */  bnez       $20, .L001E6B94
/* E6C40 001E6B40 00000000 */   nop
/* E6C44 001E6B44 0C00A1C6 */  lwc1       $f1, 0xC($21)
/* E6C48 001E6B48 00009144 */  mtc1       $17, $f0
/* E6C4C 001E6B4C 00000000 */  nop
/* E6C50 001E6B50 20008046 */  cvt.s.w    $f0, $f0
/* E6C54 001E6B54 010B0046 */  sub.s      $f12, $f1, $f0
/* E6C58 001E6B58 2C44040C */  jal        fptosi
/* E6C5C 001E6B5C 00000000 */   nop
/* E6C60 001E6B60 28264070 */  paddub     $4, $2, $0
/* E6C64 001E6B64 7200040C */  jal        abs
/* E6C68 001E6B68 00000000 */   nop
/* E6C6C 001E6B6C 00008244 */  mtc1       $2, $f0
/* E6C70 001E6B70 00000000 */  nop
/* E6C74 001E6B74 60008046 */  cvt.s.w    $f1, $f0
/* E6C78 001E6B78 8040023C */  lui        $2, (0x40800000 >> 16)
/* E6C7C 001E6B7C 00008244 */  mtc1       $2, $f0
/* E6C80 001E6B80 00000000 */  nop
/* E6C84 001E6B84 34080046 */  c.lt.s     $f1, $f0
/* E6C88 001E6B88 00000000 */  nop
/* E6C8C 001E6B8C 06000045 */  bc1f       .L001E6BA8
/* E6C90 001E6B90 00000000 */   nop
.L001E6B94:
/* E6C94 001E6B94 00009144 */  mtc1       $17, $f0
/* E6C98 001E6B98 00000000 */  nop
/* E6C9C 001E6B9C 20008046 */  cvt.s.w    $f0, $f0
/* E6CA0 001E6BA0 0C00A0E6 */  swc1       $f0, 0xC($21)
/* E6CA4 001E6BA4 01005226 */  addiu      $18, $18, 0x1
.L001E6BA8:
/* E6CA8 001E6BA8 0200422A */  slti       $2, $18, 0x2
/* E6CAC 001E6BAC 89004014 */  bnez       $2, .L001E6DD4
/* E6CB0 001E6BB0 00000000 */   nop
/* E6CB4 001E6BB4 1000A486 */  lh         $4, 0x10($21)
/* E6CB8 001E6BB8 88C7080C */  jal        WhatIsKindofItem__Fi
/* E6CBC 001E6BBC 00000000 */   nop
/* E6CC0 001E6BC0 01000324 */  addiu      $3, $0, 0x1
/* E6CC4 001E6BC4 48004310 */  beq        $2, $3, .L001E6CE8
/* E6CC8 001E6BC8 00000000 */   nop
/* E6CCC 001E6BCC 02000324 */  addiu      $3, $0, 0x2
/* E6CD0 001E6BD0 26004310 */  beq        $2, $3, .L001E6C6C
/* E6CD4 001E6BD4 00000000 */   nop
/* E6CD8 001E6BD8 03004010 */  beqz       $2, .L001E6BE8
/* E6CDC 001E6BDC 00000000 */   nop
/* E6CE0 001E6BE0 6B000010 */  b          .L001E6D90
/* E6CE4 001E6BE4 00000000 */   nop
.L001E6BE8:
/* E6CE8 001E6BE8 0000A286 */  lh         $2, 0x0($21)
/* E6CEC 001E6BEC 0D004010 */  beqz       $2, .L001E6C24
/* E6CF0 001E6BF0 00000000 */   nop
/* E6CF4 001E6BF4 1000A286 */  lh         $2, 0x10($21)
/* E6CF8 001E6BF8 7C00A2A7 */  sh         $2, 0x7C($sp)
/* E6CFC 001E6BFC 1400A286 */  lh         $2, 0x14($21)
/* E6D00 001E6C00 7E00A2A7 */  sh         $2, 0x7E($sp)
/* E6D04 001E6C04 0400A586 */  lh         $5, 0x4($21)
/* E6D08 001E6C08 8C94848F */  lw         $4, -0x6B74($gp)
/* E6D0C 001E6C0C 7C00A627 */  addiu      $6, $sp, 0x7C
/* E6D10 001E6C10 7E00A727 */  addiu      $7, $sp, 0x7E
/* E6D14 001E6C14 B0FD080C */  jal        SetItemToPos__10CStockItemFiPsPs
/* E6D18 001E6C18 00000000 */   nop
/* E6D1C 001E6C1C 5C000010 */  b          .L001E6D90
/* E6D20 001E6C20 00000000 */   nop
.L001E6C24:
/* E6D24 001E6C24 8494828F */  lw         $2, -0x6B7C($gp)
/* E6D28 001E6C28 60434424 */  addiu      $4, $2, 0x4360
/* E6D2C 001E6C2C 1000A386 */  lh         $3, 0x10($21)
/* E6D30 001E6C30 0400A286 */  lh         $2, 0x4($21)
/* E6D34 001E6C34 40100200 */  sll        $2, $2, 1
/* E6D38 001E6C38 21104400 */  addu       $2, $2, $4
/* E6D3C 001E6C3C 0E0043A4 */  sh         $3, 0xE($2)
/* E6D40 001E6C40 1400A386 */  lh         $3, 0x14($21)
/* E6D44 001E6C44 0400A286 */  lh         $2, 0x4($21)
/* E6D48 001E6C48 40100200 */  sll        $2, $2, 1
/* E6D4C 001E6C4C 21104400 */  addu       $2, $2, $4
/* E6D50 001E6C50 DC0043A4 */  sh         $3, 0xDC($2)
/* E6D54 001E6C54 0400A286 */  lh         $2, 0x4($21)
/* E6D58 001E6C58 80180200 */  sll        $3, $2, 2
/* E6D5C 001E6C5C 9494828F */  lw         $2, -0x6B6C($gp)
/* E6D60 001E6C60 21984300 */  addu       $19, $2, $3
/* E6D64 001E6C64 4A000010 */  b          .L001E6D90
/* E6D68 001E6C68 00000000 */   nop
.L001E6C6C:
/* E6D6C 001E6C6C 0000A286 */  lh         $2, 0x0($21)
/* E6D70 001E6C70 08004010 */  beqz       $2, .L001E6C94
/* E6D74 001E6C74 00000000 */   nop
/* E6D78 001E6C78 0400A586 */  lh         $5, 0x4($21)
/* E6D7C 001E6C7C 8C94848F */  lw         $4, -0x6B74($gp)
/* E6D80 001E6C80 1400A626 */  addiu      $6, $21, 0x14
/* E6D84 001E6C84 F4FD080C */  jal        SetAttachToPos__10CStockItemFiP11ATTACH_LIST
/* E6D88 001E6C88 00000000 */   nop
/* E6D8C 001E6C8C 40000010 */  b          .L001E6D90
/* E6D90 001E6C90 00000000 */   nop
.L001E6C94:
/* E6D94 001E6C94 8494828F */  lw         $2, -0x6B7C($gp)
/* E6D98 001E6C98 04055024 */  addiu      $16, $2, 0x504
/* E6D9C 001E6C9C F87F1026 */  addiu      $16, $16, 0x7FF8
/* E6DA0 001E6CA0 0400A286 */  lh         $2, 0x4($21)
/* E6DA4 001E6CA4 40110200 */  sll        $2, $2, 5
/* E6DA8 001E6CA8 21200202 */  addu       $4, $16, $2
/* E6DAC 001E6CAC 1400A526 */  addiu      $5, $21, 0x14
/* E6DB0 001E6CB0 20000624 */  addiu      $6, $0, 0x20
/* E6DB4 001E6CB4 EC0C040C */  jal        memcpy
/* E6DB8 001E6CB8 00000000 */   nop
/* E6DBC 001E6CBC 1000A386 */  lh         $3, 0x10($21)
/* E6DC0 001E6CC0 0400A286 */  lh         $2, 0x4($21)
/* E6DC4 001E6CC4 40110200 */  sll        $2, $2, 5
/* E6DC8 001E6CC8 21100202 */  addu       $2, $16, $2
/* E6DCC 001E6CCC 000043A4 */  sh         $3, 0x0($2)
/* E6DD0 001E6CD0 0400A286 */  lh         $2, 0x4($21)
/* E6DD4 001E6CD4 80180200 */  sll        $3, $2, 2
/* E6DD8 001E6CD8 9C94828F */  lw         $2, -0x6B64($gp)
/* E6DDC 001E6CDC 21984300 */  addu       $19, $2, $3
/* E6DE0 001E6CE0 2B000010 */  b          .L001E6D90
/* E6DE4 001E6CE4 00000000 */   nop
.L001E6CE8:
/* E6DE8 001E6CE8 0000A286 */  lh         $2, 0x0($21)
/* E6DEC 001E6CEC 08004010 */  beqz       $2, .L001E6D10
/* E6DF0 001E6CF0 00000000 */   nop
/* E6DF4 001E6CF4 0400A586 */  lh         $5, 0x4($21)
/* E6DF8 001E6CF8 8C94848F */  lw         $4, -0x6B74($gp)
/* E6DFC 001E6CFC 1400A626 */  addiu      $6, $21, 0x14
/* E6E00 001E6D00 C4FD080C */  jal        SetWepToPos__10CStockItemFiP11WEAPON_HAVE
/* E6E04 001E6D04 00000000 */   nop
/* E6E08 001E6D08 21000010 */  b          .L001E6D90
/* E6E0C 001E6D0C 00000000 */   nop
.L001E6D10:
/* E6E10 001E6D10 0400A586 */  lh         $5, 0x4($21)
/* E6E14 001E6D14 0A000224 */  addiu      $2, $0, 0xA
/* E6E18 001E6D18 1A00A200 */  div        $0, $5, $2
/* E6E1C 001E6D1C 02004014 */  bnez       $2, .L001E6D28
/* E6E20 001E6D20 00000000 */   nop
/* E6E24 001E6D24 CD010000 */  break      0, 7
.L001E6D28:
/* E6E28 001E6D28 12180000 */  mflo       $3
/* E6E2C 001E6D2C 8494848F */  lw         $4, -0x6B7C($gp)
/* E6E30 001E6D30 A80A0224 */  addiu      $2, $0, 0xAA8
/* E6E34 001E6D34 18106200 */  mult       $2, $3, $2
/* E6E38 001E6D38 21108200 */  addu       $2, $4, $2
/* E6E3C 001E6D3C 0C454424 */  addiu      $4, $2, 0x450C
/* E6E40 001E6D40 0A000224 */  addiu      $2, $0, 0xA
/* E6E44 001E6D44 1A00A200 */  div        $0, $5, $2
/* E6E48 001E6D48 00000000 */  nop
/* E6E4C 001E6D4C 00000000 */  nop
/* E6E50 001E6D50 10180000 */  mfhi       $3
/* E6E54 001E6D54 40110300 */  sll        $2, $3, 5
/* E6E58 001E6D58 23104300 */  subu       $2, $2, $3
/* E6E5C 001E6D5C C0100200 */  sll        $2, $2, 3
/* E6E60 001E6D60 21808200 */  addu       $16, $4, $2
/* E6E64 001E6D64 28260072 */  paddub     $4, $16, $0
/* E6E68 001E6D68 1400A526 */  addiu      $5, $21, 0x14
/* E6E6C 001E6D6C F8000624 */  addiu      $6, $0, 0xF8
/* E6E70 001E6D70 EC0C040C */  jal        memcpy
/* E6E74 001E6D74 00000000 */   nop
/* E6E78 001E6D78 1000A286 */  lh         $2, 0x10($21)
/* E6E7C 001E6D7C 000002A6 */  sh         $2, 0x0($16)
/* E6E80 001E6D80 0400A286 */  lh         $2, 0x4($21)
/* E6E84 001E6D84 80180200 */  sll        $3, $2, 2
/* E6E88 001E6D88 9894828F */  lw         $2, -0x6B68($gp)
/* E6E8C 001E6D8C 21984300 */  addu       $19, $2, $3
.L001E6D90:
/* E6E90 001E6D90 C4948287 */  lh         $2, -0x6B3C($gp)
/* E6E94 001E6D94 03004010 */  beqz       $2, .L001E6DA4
/* E6E98 001E6D98 00000000 */   nop
/* E6E9C 001E6D9C 02000224 */  addiu      $2, $0, 0x2
/* E6EA0 001E6DA0 000062AE */  sw         $2, 0x0($19)
.L001E6DA4:
/* E6EA4 001E6DA4 FFFF0224 */  addiu      $2, $0, -0x1
/* E6EA8 001E6DA8 0200A2A6 */  sh         $2, 0x2($21)
/* E6EAC 001E6DAC 0400A2A6 */  sh         $2, 0x4($21)
/* E6EB0 001E6DB0 0600A2A6 */  sh         $2, 0x6($21)
/* E6EB4 001E6DB4 1000A2A6 */  sh         $2, 0x10($21)
/* E6EB8 001E6DB8 0C00A0AE */  sw         $0, 0xC($21)
/* E6EBC 001E6DBC 0800A0AE */  sw         $0, 0x8($21)
/* E6EC0 001E6DC0 1400A426 */  addiu      $4, $21, 0x14
/* E6EC4 001E6DC4 282E0070 */  paddub     $5, $0, $0
/* E6EC8 001E6DC8 F8000624 */  addiu      $6, $0, 0xF8
/* E6ECC 001E6DCC 5A0D040C */  jal        memset
/* E6ED0 001E6DD0 00000000 */   nop
.L001E6DD4:
/* E6ED4 001E6DD4 28160070 */  paddub     $2, $0, $0
.L001E6DD8:
/* E6ED8 001E6DD8 6000BF7B */  lq         $31, 0x60($sp)
/* E6EDC 001E6DDC 5000B57B */  lq         $21, 0x50($sp)
/* E6EE0 001E6DE0 4000B47B */  lq         $20, 0x40($sp)
/* E6EE4 001E6DE4 3000B37B */  lq         $19, 0x30($sp)
/* E6EE8 001E6DE8 2000B27B */  lq         $18, 0x20($sp)
/* E6EEC 001E6DEC 1000B17B */  lq         $17, 0x10($sp)
/* E6EF0 001E6DF0 0000B07B */  lq         $16, 0x0($sp)
/* E6EF4 001E6DF4 8000BD27 */  addiu      $sp, $sp, 0x80
/* E6EF8 001E6DF8 0800E003 */  jr         $31
/* E6EFC 001E6DFC 00000000 */   nop
