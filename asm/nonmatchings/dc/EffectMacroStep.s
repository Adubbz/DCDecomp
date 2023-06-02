.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EffectMacroStep__FPf
/* 64C30 00164B30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 64C34 00164B34 0000BF7F */  sq         $31, 0x0($sp)
/* 64C38 00164B38 282E8070 */  paddub     $5, $4, $0
/* 64C3C 00164B3C 2600023C */  lui        $2, %hi(wind_dir)
/* 64C40 00164B40 20694424 */  addiu      $4, $2, %lo(wind_dir)
/* 64C44 00164B44 0C86040C */  jal        sceVu0CopyVector
/* 64C48 00164B48 00000000 */   nop
/* 64C4C 00164B4C 7C8E828F */  lw         $2, -0x7184($gp)
/* 64C50 00164B50 01004224 */  addiu      $2, $2, 0x1
/* 64C54 00164B54 7C8E82AF */  sw         $2, -0x7184($gp)
/* 64C58 00164B58 C701023C */  lui        $2, %hi(TexManager)
/* 64C5C 00164B5C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 64C60 00164B60 2A00023C */  lui        $2, %hi(_621_2)
/* 64C64 00164B64 08A14524 */  addiu      $5, $2, %lo(_621_2)
/* 64C68 00164B68 FFFF0624 */  addiu      $6, $0, -0x1
/* 64C6C 00164B6C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 64C70 00164B70 00000000 */   nop
/* 64C74 00164B74 808E82AF */  sw         $2, -0x7180($gp)
/* 64C78 00164B78 C701023C */  lui        $2, %hi(TexManager)
/* 64C7C 00164B7C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 64C80 00164B80 2A00023C */  lui        $2, %hi(_622)
/* 64C84 00164B84 10A14524 */  addiu      $5, $2, %lo(_622)
/* 64C88 00164B88 FFFF0624 */  addiu      $6, $0, -0x1
/* 64C8C 00164B8C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 64C90 00164B90 00000000 */   nop
/* 64C94 00164B94 848E82AF */  sw         $2, -0x717C($gp)
/* 64C98 00164B98 C701023C */  lui        $2, %hi(TexManager)
/* 64C9C 00164B9C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 64CA0 00164BA0 2A00023C */  lui        $2, %hi(_623)
/* 64CA4 00164BA4 18A14524 */  addiu      $5, $2, %lo(_623)
/* 64CA8 00164BA8 FFFF0624 */  addiu      $6, $0, -0x1
/* 64CAC 00164BAC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 64CB0 00164BB0 00000000 */   nop
/* 64CB4 00164BB4 888E82AF */  sw         $2, -0x7178($gp)
/* 64CB8 00164BB8 0000BF7B */  lq         $31, 0x0($sp)
/* 64CBC 00164BBC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 64CC0 00164BC0 0800E003 */  jr         $31
/* 64CC4 00164BC4 00000000 */   nop
/* 64CC8 00164BC8 00000000 */  nop
/* 64CCC 00164BCC 00000000 */  nop
