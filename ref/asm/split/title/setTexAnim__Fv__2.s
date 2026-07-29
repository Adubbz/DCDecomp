.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setTexAnim__Fv__2
/* 017DD0 01DC3AD0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 017DD4 01DC3AD4 1000BF7F */  sq          $31, 0x10($29)
/* 017DD8 01DC3AD8 0000B07F */  sq          $16, 0x0($29)
/* 017DDC 01DC3ADC D48B848F */  lw          $4, -0x742C($28)
/* 017DE0 01DC3AE0 282E0070 */  paddub      $5, $0, $0
/* 017DE4 01DC3AE4 2083040C */  jal         sceVif1PkCnt
/* 017DE8 01DC3AE8 00000000 */   nop
/* 017DEC 01DC3AEC D48B848F */  lw          $4, -0x742C($28)
/* 017DF0 01DC3AF0 282E0070 */  paddub      $5, $0, $0
/* 017DF4 01DC3AF4 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 017DF8 01DC3AF8 00000000 */   nop
/* 017DFC 01DC3AFC C701023C */  lui         $2, %hi(GiftagAD)
/* 017E00 01DC3B00 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 017E04 01DC3B04 D48B848F */  lw          $4, -0x742C($28)
/* 017E08 01DC3B08 00004578 */  lq          $5, 0x0($2)
/* 017E0C 01DC3B0C B083040C */  jal         sceVif1PkOpenGifTag
/* 017E10 01DC3B10 00000000 */   nop
/* 017E14 01DC3B14 D48B848F */  lw          $4, -0x742C($28)
/* 017E18 01DC3B18 3F000524 */  addiu       $5, $0, 0x3F
/* 017E1C 01DC3B1C 28360070 */  paddub      $6, $0, $0
/* 017E20 01DC3B20 0A84040C */  jal         sceVif1PkAddGsAD
/* 017E24 01DC3B24 00000000 */   nop
/* 017E28 01DC3B28 D48B848F */  lw          $4, -0x742C($28)
/* 017E2C 01DC3B2C B683040C */  jal         sceVif1PkCloseGifTag
/* 017E30 01DC3B30 00000000 */   nop
/* 017E34 01DC3B34 D48B848F */  lw          $4, -0x742C($28)
/* 017E38 01DC3B38 A483040C */  jal         sceVif1PkCloseDirectCode
/* 017E3C 01DC3B3C 00000000 */   nop
/* 017E40 01DC3B40 7C9A81C7 */  lwc1        $f1, -0x6584($28)
/* 017E44 01DC3B44 E040023C */  lui         $2, (0x40E00000 >> 16)
/* 017E48 01DC3B48 00008244 */  mtc1        $2, $f0
/* 017E4C 01DC3B4C 00000000 */  nop
/* 017E50 01DC3B50 34080046 */  c.lt.s      $f1, $f0
/* 017E54 01DC3B54 00000000 */  nop
/* 017E58 01DC3B58 04000145 */  bc1t        .L01DC3B6C_2C936C
/* 017E5C 01DC3B5C 00000000 */   nop
/* 017E60 01DC3B60 7C9A80AF */  sw          $0, -0x6584($28)
/* 017E64 01DC3B64 04000010 */  b           .L01DC3B78_2C9378
/* 017E68 01DC3B68 00000000 */   nop
.L01DC3B6C_2C936C:
/* 017E6C 01DC3B6C 9C8280C7 */  lwc1        $f0, -0x7D64($28)
/* 017E70 01DC3B70 00080046 */  add.s       $f0, $f1, $f0
/* 017E74 01DC3B74 7C9A80E7 */  swc1        $f0, -0x6584($28)
.L01DC3B78_2C9378:
/* 017E78 01DC3B78 7C9A8CC7 */  lwc1        $f12, -0x6584($28)
/* 017E7C 01DC3B7C 2C44040C */  jal         fptosi
/* 017E80 01DC3B80 00000000 */   nop
/* 017E84 01DC3B84 789A82AF */  sw          $2, -0x6588($28)
/* 017E88 01DC3B88 C701023C */  lui         $2, %hi(TexManager)
/* 017E8C 01DC3B8C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 017E90 01DC3B90 DE01023C */  lui         $2, %hi(LIT_1873)
/* 017E94 01DC3B94 E8F94524 */  addiu       $5, $2, %lo(LIT_1873)
/* 017E98 01DC3B98 FFFF0624 */  addiu       $6, $0, -0x1
/* 017E9C 01DC3B9C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 017EA0 01DC3BA0 00000000 */   nop
/* 017EA4 01DC3BA4 28864070 */  paddub      $16, $2, $0
/* 017EA8 01DC3BA8 C701023C */  lui         $2, %hi(TexManager)
/* 017EAC 01DC3BAC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 017EB0 01DC3BB0 DE01023C */  lui         $2, %hi(LIT_1874)
/* 017EB4 01DC3BB4 F0F94524 */  addiu       $5, $2, %lo(LIT_1874)
/* 017EB8 01DC3BB8 FFFF0624 */  addiu       $6, $0, -0x1
/* 017EBC 01DC3BBC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 017EC0 01DC3BC0 00000000 */   nop
/* 017EC4 01DC3BC4 03000012 */  beqz        $16, .L01DC3BD4_2C93D4
/* 017EC8 01DC3BC8 00000000 */   nop
/* 017ECC 01DC3BCC 03004014 */  bnez        $2, .L01DC3BDC_2C93DC
/* 017ED0 01DC3BD0 00000000 */   nop
.L01DC3BD4_2C93D4:
/* 017ED4 01DC3BD4 29000010 */  b           .L01DC3C7C_2C947C
/* 017ED8 01DC3BD8 00000000 */   nop
.L01DC3BDC_2C93DC:
/* 017EDC 01DC3BDC 789A838F */  lw          $3, -0x6588($28)
/* 017EE0 01DC3BE0 80190300 */  sll         $3, $3, 6
/* 017EE4 01DC3BE4 2000A0AF */  sw          $0, 0x20($29)
/* 017EE8 01DC3BE8 2400A3AF */  sw          $3, 0x24($29)
/* 017EEC 01DC3BEC 40000324 */  addiu       $3, $0, 0x40
/* 017EF0 01DC3BF0 2800A3AF */  sw          $3, 0x28($29)
/* 017EF4 01DC3BF4 2C00A3AF */  sw          $3, 0x2C($29)
/* 017EF8 01DC3BF8 28000426 */  addiu       $4, $16, 0x28
/* 017EFC 01DC3BFC 28004624 */  addiu       $6, $2, 0x28
/* 017F00 01DC3C00 2000A527 */  addiu       $5, $29, 0x20
/* 017F04 01DC3C04 283E0070 */  paddub      $7, $0, $0
/* 017F08 01DC3C08 28460070 */  paddub      $8, $0, $0
/* 017F0C 01DC3C0C 284E0070 */  paddub      $9, $0, $0
/* 017F10 01DC3C10 84BC040C */  jal         MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 017F14 01DC3C14 00000000 */   nop
/* 017F18 01DC3C18 D48B848F */  lw          $4, -0x742C($28)
/* 017F1C 01DC3C1C 282E0070 */  paddub      $5, $0, $0
/* 017F20 01DC3C20 2083040C */  jal         sceVif1PkCnt
/* 017F24 01DC3C24 00000000 */   nop
/* 017F28 01DC3C28 D48B848F */  lw          $4, -0x742C($28)
/* 017F2C 01DC3C2C 282E0070 */  paddub      $5, $0, $0
/* 017F30 01DC3C30 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 017F34 01DC3C34 00000000 */   nop
/* 017F38 01DC3C38 C701023C */  lui         $2, %hi(GiftagAD)
/* 017F3C 01DC3C3C C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 017F40 01DC3C40 D48B848F */  lw          $4, -0x742C($28)
/* 017F44 01DC3C44 00004578 */  lq          $5, 0x0($2)
/* 017F48 01DC3C48 B083040C */  jal         sceVif1PkOpenGifTag
/* 017F4C 01DC3C4C 00000000 */   nop
/* 017F50 01DC3C50 D48B848F */  lw          $4, -0x742C($28)
/* 017F54 01DC3C54 3F000524 */  addiu       $5, $0, 0x3F
/* 017F58 01DC3C58 28360070 */  paddub      $6, $0, $0
/* 017F5C 01DC3C5C 0A84040C */  jal         sceVif1PkAddGsAD
/* 017F60 01DC3C60 00000000 */   nop
/* 017F64 01DC3C64 D48B848F */  lw          $4, -0x742C($28)
/* 017F68 01DC3C68 B683040C */  jal         sceVif1PkCloseGifTag
/* 017F6C 01DC3C6C 00000000 */   nop
/* 017F70 01DC3C70 D48B848F */  lw          $4, -0x742C($28)
/* 017F74 01DC3C74 A483040C */  jal         sceVif1PkCloseDirectCode
/* 017F78 01DC3C78 00000000 */   nop
.L01DC3C7C_2C947C:
/* 017F7C 01DC3C7C 1000BF7B */  lq          $31, 0x10($29)
/* 017F80 01DC3C80 0000B07B */  lq          $16, 0x0($29)
/* 017F84 01DC3C84 3000BD27 */  addiu       $29, $29, 0x30
/* 017F88 01DC3C88 0800E003 */  jr          $31
/* 017F8C 01DC3C8C 00000000 */   nop
