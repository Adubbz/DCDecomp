.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set2DSprite__FP13sceVif1PacketP8CTextureP4RECTP4RECTUc
/* 5F190 0015F090 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5F194 0015F094 0000BF7F */  sq         $31, 0x0($sp)
/* 5F198 0015F098 0C00E98C */  lw         $9, 0xC($7)
/* 5F19C 0015F09C 0800E38C */  lw         $3, 0x8($7)
/* 5F1A0 0015F0A0 0400E28C */  lw         $2, 0x4($7)
/* 5F1A4 0015F0A4 0000E78C */  lw         $7, 0x0($7)
/* 5F1A8 0015F0A8 2000A7AF */  sw         $7, 0x20($sp)
/* 5F1AC 0015F0AC 2400A2AF */  sw         $2, 0x24($sp)
/* 5F1B0 0015F0B0 2800A3AF */  sw         $3, 0x28($sp)
/* 5F1B4 0015F0B4 2C00A9AF */  sw         $9, 0x2C($sp)
/* 5F1B8 0015F0B8 0C00C78C */  lw         $7, 0xC($6)
/* 5F1BC 0015F0BC 0800C38C */  lw         $3, 0x8($6)
/* 5F1C0 0015F0C0 0400C28C */  lw         $2, 0x4($6)
/* 5F1C4 0015F0C4 0000C68C */  lw         $6, 0x0($6)
/* 5F1C8 0015F0C8 1000A6AF */  sw         $6, 0x10($sp)
/* 5F1CC 0015F0CC 1400A2AF */  sw         $2, 0x14($sp)
/* 5F1D0 0015F0D0 1800A3AF */  sw         $3, 0x18($sp)
/* 5F1D4 0015F0D4 1C00A7AF */  sw         $7, 0x1C($sp)
/* 5F1D8 0015F0D8 1000A627 */  addiu      $6, $sp, 0x10
/* 5F1DC 0015F0DC 2000A727 */  addiu      $7, $sp, 0x20
/* 5F1E0 0015F0E0 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 5F1E4 0015F0E4 00000000 */   nop
/* 5F1E8 0015F0E8 0000BF7B */  lq         $31, 0x0($sp)
/* 5F1EC 0015F0EC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 5F1F0 0015F0F0 0800E003 */  jr         $31
/* 5F1F4 0015F0F4 00000000 */   nop
/* 5F1F8 0015F0F8 00000000 */  nop
/* 5F1FC 0015F0FC 00000000 */  nop
