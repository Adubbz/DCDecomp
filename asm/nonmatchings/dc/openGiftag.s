.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel openGiftag__FP13sceVif1Packet
/* 3DFA0 0013DEA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3DFA4 0013DEA4 1000BF7F */  sq         $31, 0x10($sp)
/* 3DFA8 0013DEA8 0000B07F */  sq         $16, 0x0($sp)
/* 3DFAC 0013DEAC 28868070 */  paddub     $16, $4, $0
/* 3DFB0 0013DEB0 282E0070 */  paddub     $5, $0, $0
/* 3DFB4 0013DEB4 2083040C */  jal        sceVif1PkCnt
/* 3DFB8 0013DEB8 00000000 */   nop
/* 3DFBC 0013DEBC 28260072 */  paddub     $4, $16, $0
/* 3DFC0 0013DEC0 282E0070 */  paddub     $5, $0, $0
/* 3DFC4 0013DEC4 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 3DFC8 0013DEC8 00000000 */   nop
/* 3DFCC 0013DECC C701023C */  lui        $2, %hi(GiftagAD)
/* 3DFD0 0013DED0 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 3DFD4 0013DED4 28260072 */  paddub     $4, $16, $0
/* 3DFD8 0013DED8 00004578 */  lq         $5, 0x0($2)
/* 3DFDC 0013DEDC B083040C */  jal        sceVif1PkOpenGifTag
/* 3DFE0 0013DEE0 00000000 */   nop
/* 3DFE4 0013DEE4 1000BF7B */  lq         $31, 0x10($sp)
/* 3DFE8 0013DEE8 0000B07B */  lq         $16, 0x0($sp)
/* 3DFEC 0013DEEC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 3DFF0 0013DEF0 0800E003 */  jr         $31
/* 3DFF4 0013DEF4 00000000 */   nop
/* 3DFF8 0013DEF8 00000000 */  nop
/* 3DFFC 0013DEFC 00000000 */  nop
