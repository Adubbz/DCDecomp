.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__6CClothFiif
/* 3CC70 0013CB70 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 3CC74 0013CB74 4000BF7F */  sq         $31, 0x40($sp)
/* 3CC78 0013CB78 3000B27F */  sq         $18, 0x30($sp)
/* 3CC7C 0013CB7C 2000B17F */  sq         $17, 0x20($sp)
/* 3CC80 0013CB80 1000B07F */  sq         $16, 0x10($sp)
/* 3CC84 0013CB84 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 3CC88 0013CB88 28968070 */  paddub     $18, $4, $0
/* 3CC8C 0013CB8C 288EA070 */  paddub     $17, $5, $0
/* 3CC90 0013CB90 2886C070 */  paddub     $16, $6, $0
/* 3CC94 0013CB94 06650046 */  mov.s      $f20, $f12
/* 3CC98 0013CB98 C0D3040C */  jal        __ct__10CVisualVu1Fv
/* 3CC9C 0013CB9C 00000000 */   nop
/* 3CCA0 0013CBA0 2A00023C */  lui        $2, %hi(__vt__6CCloth)
/* 3CCA4 0013CBA4 90134224 */  addiu      $2, $2, %lo(__vt__6CCloth)
/* 3CCA8 0013CBA8 080042AE */  sw         $2, 0x8($18)
/* 3CCAC 0013CBAC 28264072 */  paddub     $4, $18, $0
/* 3CCB0 0013CBB0 6CF2040C */  jal        InitParam__6CClothFv
/* 3CCB4 0013CBB4 00000000 */   nop
/* 3CCB8 0013CBB8 2C0051AE */  sw         $17, 0x2C($18)
/* 3CCBC 0013CBBC 300050AE */  sw         $16, 0x30($18)
/* 3CCC0 0013CBC0 340054E6 */  swc1       $f20, 0x34($18)
/* 3CCC4 0013CBC4 28164072 */  paddub     $2, $18, $0
/* 3CCC8 0013CBC8 4000BF7B */  lq         $31, 0x40($sp)
/* 3CCCC 0013CBCC 3000B27B */  lq         $18, 0x30($sp)
/* 3CCD0 0013CBD0 2000B17B */  lq         $17, 0x20($sp)
/* 3CCD4 0013CBD4 1000B07B */  lq         $16, 0x10($sp)
/* 3CCD8 0013CBD8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 3CCDC 0013CBDC 5000BD27 */  addiu      $sp, $sp, 0x50
/* 3CCE0 0013CBE0 0800E003 */  jr         $31
/* 3CCE4 0013CBE4 00000000 */   nop
/* 3CCE8 0013CBE8 00000000 */  nop
/* 3CCEC 0013CBEC 00000000 */  nop
