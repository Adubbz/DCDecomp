.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdEventSpriteDraw__Fv
/* 98AD0 001989D0 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* 98AD4 001989D4 A000BF7F */  sq         $31, 0xA0($sp)
/* 98AD8 001989D8 9000BE7F */  sq         $fp, 0x90($sp)
/* 98ADC 001989DC 8000B77F */  sq         $23, 0x80($sp)
/* 98AE0 001989E0 7000B67F */  sq         $22, 0x70($sp)
/* 98AE4 001989E4 6000B57F */  sq         $21, 0x60($sp)
/* 98AE8 001989E8 5000B47F */  sq         $20, 0x50($sp)
/* 98AEC 001989EC 4000B37F */  sq         $19, 0x40($sp)
/* 98AF0 001989F0 3000B27F */  sq         $18, 0x30($sp)
/* 98AF4 001989F4 2000B17F */  sq         $17, 0x20($sp)
/* 98AF8 001989F8 1000B07F */  sq         $16, 0x10($sp)
/* 98AFC 001989FC 2D001024 */  addiu      $16, $0, 0x2D
/* 98B00 00198A00 7E000010 */  b          .L00198BFC
/* 98B04 00198A04 00000000 */   nop
.L00198A08:
/* 98B08 00198A08 288E0070 */  paddub     $17, $0, $0
/* 98B0C 00198A0C 28960070 */  paddub     $18, $0, $0
/* 98B10 00198A10 76000010 */  b          .L00198BEC
/* 98B14 00198A14 00000000 */   nop
.L00198A18:
/* 98B18 00198A18 28264072 */  paddub     $4, $18, $0
/* 98B1C 00198A1C 5428060C */  jal        GetSprite__Fi
/* 98B20 00198A20 00000000 */   nop
/* 98B24 00198A24 289E4070 */  paddub     $19, $2, $0
/* 98B28 00198A28 73006012 */  beqz       $19, .L00198BF8
/* 98B2C 00198A2C 00000000 */   nop
/* 98B30 00198A30 00006286 */  lh         $2, 0x0($19)
/* 98B34 00198A34 6C004010 */  beqz       $2, .L00198BE8
/* 98B38 00198A38 00000000 */   nop
/* 98B3C 00198A3C 02006286 */  lh         $2, 0x2($19)
/* 98B40 00198A40 69004010 */  beqz       $2, .L00198BE8
/* 98B44 00198A44 00000000 */   nop
/* 98B48 00198A48 BC00B527 */  addiu      $21, $sp, 0xBC
/* 98B4C 00198A4C 0000A0AE */  sw         $0, 0x0($21)
/* 98B50 00198A50 B800B427 */  addiu      $20, $sp, 0xB8
/* 98B54 00198A54 000080AE */  sw         $0, 0x0($20)
/* 98B58 00198A58 B400A227 */  addiu      $2, $sp, 0xB4
/* 98B5C 00198A5C 000040AC */  sw         $0, 0x0($2)
/* 98B60 00198A60 B000A0AF */  sw         $0, 0xB0($sp)
/* 98B64 00198A64 CC00B627 */  addiu      $22, $sp, 0xCC
/* 98B68 00198A68 0000C0AE */  sw         $0, 0x0($22)
/* 98B6C 00198A6C C800B727 */  addiu      $23, $sp, 0xC8
/* 98B70 00198A70 0000E0AE */  sw         $0, 0x0($23)
/* 98B74 00198A74 C400BE27 */  addiu      $fp, $sp, 0xC4
/* 98B78 00198A78 0000C0AF */  sw         $0, 0x0($fp)
/* 98B7C 00198A7C C000A0AF */  sw         $0, 0xC0($sp)
/* 98B80 00198A80 08006CC6 */  lwc1       $f12, 0x8($19)
/* 98B84 00198A84 2C44040C */  jal        fptosi
/* 98B88 00198A88 00000000 */   nop
/* 98B8C 00198A8C B000A2AF */  sw         $2, 0xB0($sp)
/* 98B90 00198A90 0C006CC6 */  lwc1       $f12, 0xC($19)
/* 98B94 00198A94 2C44040C */  jal        fptosi
/* 98B98 00198A98 00000000 */   nop
/* 98B9C 00198A9C B400A327 */  addiu      $3, $sp, 0xB4
/* 98BA0 00198AA0 000062AC */  sw         $2, 0x0($3)
/* 98BA4 00198AA4 10006286 */  lh         $2, 0x10($19)
/* 98BA8 00198AA8 000082AE */  sw         $2, 0x0($20)
/* 98BAC 00198AAC 12006286 */  lh         $2, 0x12($19)
/* 98BB0 00198AB0 0000A2AE */  sw         $2, 0x0($21)
/* 98BB4 00198AB4 14006286 */  lh         $2, 0x14($19)
/* 98BB8 00198AB8 C000A2AF */  sw         $2, 0xC0($sp)
/* 98BBC 00198ABC 16006286 */  lh         $2, 0x16($19)
/* 98BC0 00198AC0 0000C2AF */  sw         $2, 0x0($fp)
/* 98BC4 00198AC4 18006286 */  lh         $2, 0x18($19)
/* 98BC8 00198AC8 0000E2AE */  sw         $2, 0x0($23)
/* 98BCC 00198ACC 1A006286 */  lh         $2, 0x1A($19)
/* 98BD0 00198AD0 0000C2AE */  sw         $2, 0x0($22)
/* 98BD4 00198AD4 0000828E */  lw         $2, 0x0($20)
/* 98BD8 00198AD8 03004104 */  bgez       $2, .L00198AE8
/* 98BDC 00198ADC 00000000 */   nop
/* 98BE0 00198AE0 0000E28E */  lw         $2, 0x0($23)
/* 98BE4 00198AE4 000082AE */  sw         $2, 0x0($20)
.L00198AE8:
/* 98BE8 00198AE8 0000A28E */  lw         $2, 0x0($21)
/* 98BEC 00198AEC 03004104 */  bgez       $2, .L00198AFC
/* 98BF0 00198AF0 00000000 */   nop
/* 98BF4 00198AF4 0000C28E */  lw         $2, 0x0($22)
/* 98BF8 00198AF8 0000A2AE */  sw         $2, 0x0($21)
.L00198AFC:
/* 98BFC 00198AFC 38006286 */  lh         $2, 0x38($19)
/* 98C00 00198B00 39005014 */  bne        $2, $16, .L00198BE8
/* 98C04 00198B04 00000000 */   nop
/* 98C08 00198B08 0A002016 */  bnez       $17, .L00198B34
/* 98C0C 00198B0C 00000000 */   nop
/* 98C10 00198B10 A0B8040C */  jal        GetVif1Packet__Fv
/* 98C14 00198B14 00000000 */   nop
/* 98C18 00198B18 C701033C */  lui        $3, %hi(TexManager)
/* 98C1C 00198B1C 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 98C20 00198B20 282E4070 */  paddub     $5, $2, $0
/* 98C24 00198B24 28360072 */  paddub     $6, $16, $0
/* 98C28 00198B28 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 98C2C 00198B2C 00000000 */   nop
/* 98C30 00198B30 01001124 */  addiu      $17, $0, 0x1
.L00198B34:
/* 98C34 00198B34 06006486 */  lh         $4, 0x6($19)
/* 98C38 00198B38 046F050C */  jal        setbilinear__Fi
/* 98C3C 00198B3C 00000000 */   nop
/* 98C40 00198B40 2C0061C6 */  lwc1       $f1, 0x2C($19)
/* 98C44 00198B44 080060C6 */  lwc1       $f0, 0x8($19)
/* 98C48 00198B48 00000146 */  add.s      $f0, $f0, $f1
/* 98C4C 00198B4C 080060E6 */  swc1       $f0, 0x8($19)
/* 98C50 00198B50 300061C6 */  lwc1       $f1, 0x30($19)
/* 98C54 00198B54 0C0060C6 */  lwc1       $f0, 0xC($19)
/* 98C58 00198B58 00000146 */  add.s      $f0, $f0, $f1
/* 98C5C 00198B5C 0C0060E6 */  swc1       $f0, 0xC($19)
/* 98C60 00198B60 04006286 */  lh         $2, 0x4($19)
/* 98C64 00198B64 0F004014 */  bnez       $2, .L00198BA4
/* 98C68 00198B68 00000000 */   nop
/* 98C6C 00198B6C A0B8040C */  jal        GetVif1Packet__Fv
/* 98C70 00198B70 00000000 */   nop
/* 98C74 00198B74 1C006892 */  lbu        $8, 0x1C($19)
/* 98C78 00198B78 1E006992 */  lbu        $9, 0x1E($19)
/* 98C7C 00198B7C 20006A92 */  lbu        $10, 0x20($19)
/* 98C80 00198B80 22006B92 */  lbu        $11, 0x22($19)
/* 98C84 00198B84 28264070 */  paddub     $4, $2, $0
/* 98C88 00198B88 38006526 */  addiu      $5, $19, 0x38
/* 98C8C 00198B8C B000A627 */  addiu      $6, $sp, 0xB0
/* 98C90 00198B90 C000A727 */  addiu      $7, $sp, 0xC0
/* 98C94 00198B94 8C71050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 98C98 00198B98 00000000 */   nop
/* 98C9C 00198B9C 12000010 */  b          .L00198BE8
/* 98CA0 00198BA0 00000000 */   nop
.L00198BA4:
/* 98CA4 00198BA4 A0B8040C */  jal        GetVif1Packet__Fv
/* 98CA8 00198BA8 00000000 */   nop
/* 98CAC 00198BAC 20006392 */  lbu        $3, 0x20($19)
/* 98CB0 00198BB0 0000A3FF */  sd         $3, 0x0($sp)
/* 98CB4 00198BB4 22006392 */  lbu        $3, 0x22($19)
/* 98CB8 00198BB8 0800A3FF */  sd         $3, 0x8($sp)
/* 98CBC 00198BBC 24006886 */  lh         $8, 0x24($19)
/* 98CC0 00198BC0 26006986 */  lh         $9, 0x26($19)
/* 98CC4 00198BC4 1C006A92 */  lbu        $10, 0x1C($19)
/* 98CC8 00198BC8 1E006B92 */  lbu        $11, 0x1E($19)
/* 98CCC 00198BCC 28264070 */  paddub     $4, $2, $0
/* 98CD0 00198BD0 38006526 */  addiu      $5, $19, 0x38
/* 98CD4 00198BD4 B000A627 */  addiu      $6, $sp, 0xB0
/* 98CD8 00198BD8 C000A727 */  addiu      $7, $sp, 0xC0
/* 98CDC 00198BDC 28006CC6 */  lwc1       $f12, 0x28($19)
/* 98CE0 00198BE0 B47A050C */  jal        set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUcUcUcUc
/* 98CE4 00198BE4 00000000 */   nop
.L00198BE8:
/* 98CE8 00198BE8 01005226 */  addiu      $18, $18, 0x1
.L00198BEC:
/* 98CEC 00198BEC 1000422A */  slti       $2, $18, 0x10
/* 98CF0 00198BF0 89FF4014 */  bnez       $2, .L00198A18
/* 98CF4 00198BF4 00000000 */   nop
.L00198BF8:
/* 98CF8 00198BF8 01001026 */  addiu      $16, $16, 0x1
.L00198BFC:
/* 98CFC 00198BFC 3200012A */  slti       $at, $16, 0x32
/* 98D00 00198C00 81FF2014 */  bnez       $at, .L00198A08
/* 98D04 00198C04 00000000 */   nop
/* 98D08 00198C08 A0B8040C */  jal        GetVif1Packet__Fv
/* 98D0C 00198C0C 00000000 */   nop
/* 98D10 00198C10 C701033C */  lui        $3, %hi(TexManager)
/* 98D14 00198C14 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 98D18 00198C18 282E4070 */  paddub     $5, $2, $0
/* 98D1C 00198C1C 2D000624 */  addiu      $6, $0, 0x2D
/* 98D20 00198C20 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 98D24 00198C24 00000000 */   nop
/* 98D28 00198C28 D501023C */  lui        $2, %hi(SpriteTable)
/* 98D2C 00198C2C 708E4424 */  addiu      $4, $2, %lo(SpriteTable)
/* 98D30 00198C30 88AE040C */  jal        DrawTable__12CSpriteTableFv
/* 98D34 00198C34 00000000 */   nop
/* 98D38 00198C38 01000224 */  addiu      $2, $0, 0x1
/* 98D3C 00198C3C A000BF7B */  lq         $31, 0xA0($sp)
/* 98D40 00198C40 9000BE7B */  lq         $fp, 0x90($sp)
/* 98D44 00198C44 8000B77B */  lq         $23, 0x80($sp)
/* 98D48 00198C48 7000B67B */  lq         $22, 0x70($sp)
/* 98D4C 00198C4C 6000B57B */  lq         $21, 0x60($sp)
/* 98D50 00198C50 5000B47B */  lq         $20, 0x50($sp)
/* 98D54 00198C54 4000B37B */  lq         $19, 0x40($sp)
/* 98D58 00198C58 3000B27B */  lq         $18, 0x30($sp)
/* 98D5C 00198C5C 2000B17B */  lq         $17, 0x20($sp)
/* 98D60 00198C60 1000B07B */  lq         $16, 0x10($sp)
/* 98D64 00198C64 D000BD27 */  addiu      $sp, $sp, 0xD0
/* 98D68 00198C68 0800E003 */  jr         $31
/* 98D6C 00198C6C 00000000 */   nop
