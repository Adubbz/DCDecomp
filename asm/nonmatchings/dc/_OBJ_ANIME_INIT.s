.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _OBJ_ANIME_INIT__FP12RS_STACKDATAi
/* 94CF0 00194BF0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 94CF4 00194BF4 3000BF7F */  sq         $31, 0x30($sp)
/* 94CF8 00194BF8 2000B27F */  sq         $18, 0x20($sp)
/* 94CFC 00194BFC 1000B17F */  sq         $17, 0x10($sp)
/* 94D00 00194C00 0000B07F */  sq         $16, 0x0($sp)
/* 94D04 00194C04 28968070 */  paddub     $18, $4, $0
/* 94D08 00194C08 288EA070 */  paddub     $17, $5, $0
/* 94D0C 00194C0C 28860070 */  paddub     $16, $0, $0
/* 94D10 00194C10 09000010 */  b          .L00194C38
/* 94D14 00194C14 00000000 */   nop
.L00194C18:
/* 94D18 00194C18 28264072 */  paddub     $4, $18, $0
/* 94D1C 00194C1C 08009224 */  addiu      $18, $4, 0x8
/* 94D20 00194C20 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94D24 00194C24 00000000 */   nop
/* 94D28 00194C28 28264070 */  paddub     $4, $2, $0
/* 94D2C 00194C2C 8C28060C */  jal        ClearObjAnime__Fi
/* 94D30 00194C30 00000000 */   nop
/* 94D34 00194C34 01001026 */  addiu      $16, $16, 0x1
.L00194C38:
/* 94D38 00194C38 2A101102 */  slt        $2, $16, $17
/* 94D3C 00194C3C F6FF4014 */  bnez       $2, .L00194C18
/* 94D40 00194C40 00000000 */   nop
/* 94D44 00194C44 01000224 */  addiu      $2, $0, 0x1
/* 94D48 00194C48 3000BF7B */  lq         $31, 0x30($sp)
/* 94D4C 00194C4C 2000B27B */  lq         $18, 0x20($sp)
/* 94D50 00194C50 1000B17B */  lq         $17, 0x10($sp)
/* 94D54 00194C54 0000B07B */  lq         $16, 0x0($sp)
/* 94D58 00194C58 4000BD27 */  addiu      $sp, $sp, 0x40
/* 94D5C 00194C5C 0800E003 */  jr         $31
/* 94D60 00194C60 00000000 */   nop
/* 94D64 00194C64 00000000 */  nop
/* 94D68 00194C68 00000000 */  nop
/* 94D6C 00194C6C 00000000 */  nop
