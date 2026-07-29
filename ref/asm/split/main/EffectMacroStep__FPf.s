.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EffectMacroStep__FPf
/* 064C30 00164B30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 064C34 00164B34 0000BF7F */  sq          $31, 0x0($29)
/* 064C38 00164B38 282E8070 */  paddub      $5, $4, $0
/* 064C3C 00164B3C 2600023C */  lui         $2, %hi(wind_dir)
/* 064C40 00164B40 20694424 */  addiu       $4, $2, %lo(wind_dir)
/* 064C44 00164B44 0C86040C */  jal         sceVu0CopyVector
/* 064C48 00164B48 00000000 */   nop
/* 064C4C 00164B4C 7C8E828F */  lw          $2, -0x7184($28)
/* 064C50 00164B50 01004224 */  addiu       $2, $2, 0x1
/* 064C54 00164B54 7C8E82AF */  sw          $2, -0x7184($28)
/* 064C58 00164B58 C701023C */  lui         $2, %hi(TexManager)
/* 064C5C 00164B5C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 064C60 00164B60 2A00023C */  lui         $2, %hi(LIT_621__2)
/* 064C64 00164B64 08A14524 */  addiu       $5, $2, %lo(LIT_621__2)
/* 064C68 00164B68 FFFF0624 */  addiu       $6, $0, -0x1
/* 064C6C 00164B6C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 064C70 00164B70 00000000 */   nop
/* 064C74 00164B74 808E82AF */  sw          $2, -0x7180($28)
/* 064C78 00164B78 C701023C */  lui         $2, %hi(TexManager)
/* 064C7C 00164B7C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 064C80 00164B80 2A00023C */  lui         $2, %hi(LIT_622)
/* 064C84 00164B84 10A14524 */  addiu       $5, $2, %lo(LIT_622)
/* 064C88 00164B88 FFFF0624 */  addiu       $6, $0, -0x1
/* 064C8C 00164B8C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 064C90 00164B90 00000000 */   nop
/* 064C94 00164B94 848E82AF */  sw          $2, -0x717C($28)
/* 064C98 00164B98 C701023C */  lui         $2, %hi(TexManager)
/* 064C9C 00164B9C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 064CA0 00164BA0 2A00023C */  lui         $2, %hi(LIT_623)
/* 064CA4 00164BA4 18A14524 */  addiu       $5, $2, %lo(LIT_623)
/* 064CA8 00164BA8 FFFF0624 */  addiu       $6, $0, -0x1
/* 064CAC 00164BAC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 064CB0 00164BB0 00000000 */   nop
/* 064CB4 00164BB4 888E82AF */  sw          $2, -0x7178($28)
/* 064CB8 00164BB8 0000BF7B */  lq          $31, 0x0($29)
/* 064CBC 00164BBC 1000BD27 */  addiu       $29, $29, 0x10
/* 064CC0 00164BC0 0800E003 */  jr          $31
/* 064CC4 00164BC4 00000000 */   nop
/* 064CC8 00164BC8 00000000 */  nop
/* 064CCC 00164BCC 00000000 */  nop
