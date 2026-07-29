.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitSave__Fv
/* 042C00 00142B00 F0FFBD27 */  addiu       $29, $29, -0x10
/* 042C04 00142B04 0000BF7F */  sq          $31, 0x0($29)
/* 042C08 00142B08 6496040C */  jal         InitializeDataBuffer__Fv
/* 042C0C 00142B0C 00000000 */   nop
/* 042C10 00142B10 2B00023C */  lui         $2, %hi(TextureData)
/* 042C14 00142B14 30B04424 */  addiu       $4, $2, %lo(TextureData)
/* 042C18 00142B18 0100023C */  lui         $2, (0x186A0 >> 16)
/* 042C1C 00142B1C A0864534 */  ori         $5, $2, (0x186A0 & 0xFFFF)
/* 042C20 00142B20 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 042C24 00142B24 00000000 */   nop
/* 042C28 00142B28 10270424 */  addiu       $4, $0, 0x2710
/* 042C2C 00142B2C 0100023C */  lui         $2, (0x186A0 >> 16)
/* 042C30 00142B30 A0864534 */  ori         $5, $2, (0x186A0 & 0xFFFF)
/* 042C34 00142B34 B896040C */  jal         SetPacketReadBuffer__Fii
/* 042C38 00142B38 00000000 */   nop
/* 042C3C 00142B3C C701023C */  lui         $2, %hi(TexManager)
/* 042C40 00142B40 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 042C44 00142B44 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 042C48 00142B48 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 042C4C 00142B4C 00000000 */   nop
/* 042C50 00142B50 C701023C */  lui         $2, %hi(TexManager)
/* 042C54 00142B54 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 042C58 00142B58 2500023C */  lui         $2, %hi(texdata$1078)
/* 042C5C 00142B5C D0224524 */  addiu       $5, $2, %lo(texdata$1078)
/* 042C60 00142B60 98D0040C */  jal         EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO
/* 042C64 00142B64 00000000 */   nop
/* 042C68 00142B68 C701023C */  lui         $2, %hi(TexManager)
/* 042C6C 00142B6C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 042C70 00142B70 FFFF0524 */  addiu       $5, $0, -0x1
/* 042C74 00142B74 948B868F */  lw          $6, -0x746C($28)
/* 042C78 00142B78 4CCF040C */  jal         LoadTextureBlock__15CTextureManagerFiPUi
/* 042C7C 00142B7C 00000000 */   nop
/* 042C80 00142B80 948B858F */  lw          $5, -0x746C($28)
/* 042C84 00142B84 2A00023C */  lui         $2, %hi(LIT_1086)
/* 042C88 00142B88 88964424 */  addiu       $4, $2, %lo(LIT_1086)
/* 042C8C 00142B8C D0AE080C */  jal         LoadFileMenuData__FPcPUi
/* 042C90 00142B90 00000000 */   nop
/* 042C94 00142B94 948B858F */  lw          $5, -0x746C($28)
/* 042C98 00142B98 C701023C */  lui         $2, %hi(TexManager)
/* 042C9C 00142B9C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 042CA0 00142BA0 4CCA040C */  jal         EnterFixTextureZ__15CTextureManagerFPUc
/* 042CA4 00142BA4 00000000 */   nop
/* 042CA8 00142BA8 C701023C */  lui         $2, %hi(TexManager)
/* 042CAC 00142BAC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 042CB0 00142BB0 2A00023C */  lui         $2, %hi(LIT_1087)
/* 042CB4 00142BB4 98964524 */  addiu       $5, $2, %lo(LIT_1087)
/* 042CB8 00142BB8 FFFF0624 */  addiu       $6, $0, -0x1
/* 042CBC 00142BBC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 042CC0 00142BC0 00000000 */   nop
/* 042CC4 00142BC4 1C9082AF */  sw          $2, -0x6FE4($28)
/* 042CC8 00142BC8 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 042CCC 00142BCC 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 042CD0 00142BD0 388D858F */  lw          $5, -0x72C8($28)
/* 042CD4 00142BD4 8C36050C */  jal         SetBuff_system__6ClsMesFPs
/* 042CD8 00142BD8 00000000 */   nop
/* 042CDC 00142BDC D001023C */  lui         $2, %hi(MesWinTexBuff_01)
/* 042CE0 00142BE0 408B4224 */  addiu       $2, $2, %lo(MesWinTexBuff_01)
/* 042CE4 00142BE4 D201013C */  lui         $1, %hi(EditSystemMes + 0x17B0)
/* 042CE8 00142BE8 C04322AC */  sw          $2, %lo(EditSystemMes + 0x17B0)($1)
/* 042CEC 00142BEC 948B868F */  lw          $6, -0x746C($28)
/* 042CF0 00142BF0 548D848F */  lw          $4, -0x72AC($28)
/* 042CF4 00142BF4 01000524 */  addiu       $5, $0, 0x1
/* 042CF8 00142BF8 C47E080C */  jal         InitMenuSave__FiiP1
/* 042CFC 00142BFC 00000000 */   nop
/* 042D00 00142C00 0000BF7B */  lq          $31, 0x0($29)
/* 042D04 00142C04 1000BD27 */  addiu       $29, $29, 0x10
/* 042D08 00142C08 0800E003 */  jr          $31
/* 042D0C 00142C0C 00000000 */   nop
