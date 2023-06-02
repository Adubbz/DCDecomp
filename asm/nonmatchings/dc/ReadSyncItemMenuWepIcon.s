.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ReadSyncItemMenuWepIcon__Fv
/* 102610 00202510 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 102614 00202514 0000BF7F */  sq         $31, 0x0($sp)
/* 102618 00202518 28260070 */  paddub     $4, $0, $0
/* 10261C 0020251C 18FB040C */  jal        GetReadBGFile__Fi
/* 102620 00202520 00000000 */   nop
/* 102624 00202524 2900033C */  lui        $3, %hi(_4331)
/* 102628 00202528 90346624 */  addiu      $6, $3, %lo(_4331)
/* 10262C 0020252C 1000A527 */  addiu      $5, $sp, 0x10
/* 102630 00202530 02000424 */  addiu      $4, $0, 0x2
.L00202534:
/* 102634 00202534 0000C378 */  lq         $3, 0x0($6)
/* 102638 00202538 1000C624 */  addiu      $6, $6, 0x10
/* 10263C 0020253C FFFF8424 */  addiu      $4, $4, -0x1
/* 102640 00202540 0000A37C */  sq         $3, 0x0($5)
/* 102644 00202544 1000A524 */  addiu      $5, $5, 0x10
/* 102648 00202548 FAFF801C */  bgtz       $4, .L00202534
/* 10264C 0020254C 00000000 */   nop
/* 102650 00202550 0000C3C4 */  lwc1       $f3, 0x0($6)
/* 102654 00202554 0000A3E4 */  swc1       $f3, 0x0($5)
/* 102658 00202558 EC94838F */  lw         $3, -0x6B14($gp)
/* 10265C 0020255C 1400A3AF */  sw         $3, 0x14($sp)
/* 102660 00202560 8C00428C */  lw         $2, 0x8C($2)
/* 102664 00202564 1C00A2AF */  sw         $2, 0x1C($sp)
/* 102668 00202568 2000A3AF */  sw         $3, 0x20($sp)
/* 10266C 0020256C C701023C */  lui        $2, %hi(TexManager)
/* 102670 00202570 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 102674 00202574 2A00023C */  lui        $2, %hi(_4334)
/* 102678 00202578 80DA4524 */  addiu      $5, $2, %lo(_4334)
/* 10267C 0020257C FFFF0624 */  addiu      $6, $0, -0x1
/* 102680 00202580 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 102684 00202584 00000000 */   nop
/* 102688 00202588 1C9582AF */  sw         $2, -0x6AE4($gp)
/* 10268C 0020258C C701023C */  lui        $2, %hi(TexManager)
/* 102690 00202590 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 102694 00202594 EC94858F */  lw         $5, -0x6B14($gp)
/* 102698 00202598 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 10269C 0020259C 00000000 */   nop
/* 1026A0 002025A0 C701023C */  lui        $2, %hi(TexManager)
/* 1026A4 002025A4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 1026A8 002025A8 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 1026AC 002025AC 00000000 */   nop
/* 1026B0 002025B0 C701023C */  lui        $2, %hi(TexManager)
/* 1026B4 002025B4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 1026B8 002025B8 FFFF0524 */  addiu      $5, $0, -0x1
/* 1026BC 002025BC 1000A627 */  addiu      $6, $sp, 0x10
/* 1026C0 002025C0 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 1026C4 002025C4 00000000 */   nop
/* 1026C8 002025C8 0000BF7B */  lq         $31, 0x0($sp)
/* 1026CC 002025CC 4000BD27 */  addiu      $sp, $sp, 0x40
/* 1026D0 002025D0 0800E003 */  jr         $31
/* 1026D4 002025D4 00000000 */   nop
/* 1026D8 002025D8 00000000 */  nop
/* 1026DC 002025DC 00000000 */  nop
