.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtlMenuTexBlockEnter__Fv
/* 0F59A0 001F58A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0F59A4 001F58A4 0000BF7F */  sq          $31, 0x0($29)
/* 0F59A8 001F58A8 C701023C */  lui         $2, %hi(TexManager)
/* 0F59AC 001F58AC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F59B0 001F58B0 2A00023C */  lui         $2, %hi(LIT_926__2)
/* 0F59B4 001F58B4 F8D44524 */  addiu       $5, $2, %lo(LIT_926__2)
/* 0F59B8 001F58B8 E094868F */  lw          $6, -0x6B20($28)
/* 0F59BC 001F58BC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F59C0 001F58C0 00000000 */   nop
/* 0F59C4 001F58C4 209582AF */  sw          $2, -0x6AE0($28)
/* 0F59C8 001F58C8 C701023C */  lui         $2, %hi(TexManager)
/* 0F59CC 001F58CC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F59D0 001F58D0 2A00023C */  lui         $2, %hi(LIT_927__2)
/* 0F59D4 001F58D4 08D54524 */  addiu       $5, $2, %lo(LIT_927__2)
/* 0F59D8 001F58D8 E094868F */  lw          $6, -0x6B20($28)
/* 0F59DC 001F58DC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F59E0 001F58E0 00000000 */   nop
/* 0F59E4 001F58E4 289582AF */  sw          $2, -0x6AD8($28)
/* 0F59E8 001F58E8 C701023C */  lui         $2, %hi(TexManager)
/* 0F59EC 001F58EC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F59F0 001F58F0 2A00023C */  lui         $2, %hi(LIT_928__3)
/* 0F59F4 001F58F4 18D54524 */  addiu       $5, $2, %lo(LIT_928__3)
/* 0F59F8 001F58F8 FFFF0624 */  addiu       $6, $0, -0x1
/* 0F59FC 001F58FC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F5A00 001F5900 00000000 */   nop
/* 0F5A04 001F5904 B09682AF */  sw          $2, -0x6950($28)
/* 0F5A08 001F5908 C701023C */  lui         $2, %hi(TexManager)
/* 0F5A0C 001F590C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5A10 001F5910 2A00023C */  lui         $2, %hi(LIT_929__3)
/* 0F5A14 001F5914 20D54524 */  addiu       $5, $2, %lo(LIT_929__3)
/* 0F5A18 001F5918 E094868F */  lw          $6, -0x6B20($28)
/* 0F5A1C 001F591C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F5A20 001F5920 00000000 */   nop
/* 0F5A24 001F5924 A89682AF */  sw          $2, -0x6958($28)
/* 0F5A28 001F5928 C701023C */  lui         $2, %hi(TexManager)
/* 0F5A2C 001F592C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5A30 001F5930 2A00023C */  lui         $2, %hi(LIT_930__3)
/* 0F5A34 001F5934 30D54524 */  addiu       $5, $2, %lo(LIT_930__3)
/* 0F5A38 001F5938 E094868F */  lw          $6, -0x6B20($28)
/* 0F5A3C 001F593C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F5A40 001F5940 00000000 */   nop
/* 0F5A44 001F5944 A49782AF */  sw          $2, -0x685C($28)
/* 0F5A48 001F5948 C701023C */  lui         $2, %hi(TexManager)
/* 0F5A4C 001F594C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5A50 001F5950 2A00023C */  lui         $2, %hi(LIT_931__4)
/* 0F5A54 001F5954 38D54524 */  addiu       $5, $2, %lo(LIT_931__4)
/* 0F5A58 001F5958 E094868F */  lw          $6, -0x6B20($28)
/* 0F5A5C 001F595C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F5A60 001F5960 00000000 */   nop
/* 0F5A64 001F5964 2C9582AF */  sw          $2, -0x6AD4($28)
/* 0F5A68 001F5968 C701023C */  lui         $2, %hi(TexManager)
/* 0F5A6C 001F596C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5A70 001F5970 2A00023C */  lui         $2, %hi(LIT_932__3)
/* 0F5A74 001F5974 48D54524 */  addiu       $5, $2, %lo(LIT_932__3)
/* 0F5A78 001F5978 FFFF0624 */  addiu       $6, $0, -0x1
/* 0F5A7C 001F597C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F5A80 001F5980 00000000 */   nop
/* 0F5A84 001F5984 D09682AF */  sw          $2, -0x6930($28)
/* 0F5A88 001F5988 C701023C */  lui         $2, %hi(TexManager)
/* 0F5A8C 001F598C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5A90 001F5990 2A00023C */  lui         $2, %hi(LIT_933__3)
/* 0F5A94 001F5994 50D54524 */  addiu       $5, $2, %lo(LIT_933__3)
/* 0F5A98 001F5998 FFFF0624 */  addiu       $6, $0, -0x1
/* 0F5A9C 001F599C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F5AA0 001F59A0 00000000 */   nop
/* 0F5AA4 001F59A4 CC9682AF */  sw          $2, -0x6934($28)
/* 0F5AA8 001F59A8 0000BF7B */  lq          $31, 0x0($29)
/* 0F5AAC 001F59AC 1000BD27 */  addiu       $29, $29, 0x10
/* 0F5AB0 001F59B0 0800E003 */  jr          $31
/* 0F5AB4 001F59B4 00000000 */   nop
/* 0F5AB8 001F59B8 00000000 */  nop
/* 0F5ABC 001F59BC 00000000 */  nop
