.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Stop__6CSoundFi
/* 46A10 00146910 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 46A14 00146914 1000BF7F */  sq         $31, 0x10($sp)
/* 46A18 00146918 0000B07F */  sq         $16, 0x0($sp)
/* 46A1C 0014691C 2886A070 */  paddub     $16, $5, $0
/* 46A20 00146920 20000426 */  addiu      $4, $16, 0x20
/* 46A24 00146924 282E0070 */  paddub     $5, $0, $0
/* 46A28 00146928 801E050C */  jal        ezMidi__Fii
/* 46A2C 0014692C 00000000 */   nop
/* 46A30 00146930 2A00023C */  lui        $2, %hi(_979)
/* 46A34 00146934 109A4424 */  addiu      $4, $2, %lo(_979)
/* 46A38 00146938 282E0072 */  paddub     $5, $16, $0
/* 46A3C 0014693C A611040C */  jal        printf
/* 46A40 00146940 00000000 */   nop
/* 46A44 00146944 1000BF7B */  lq         $31, 0x10($sp)
/* 46A48 00146948 0000B07B */  lq         $16, 0x0($sp)
/* 46A4C 0014694C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 46A50 00146950 0800E003 */  jr         $31
/* 46A54 00146954 00000000 */   nop
/* 46A58 00146958 00000000 */  nop
/* 46A5C 0014695C 00000000 */  nop
