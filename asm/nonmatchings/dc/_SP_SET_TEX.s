.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SP_SET_TEX__FP12RS_STACKDATAi
/* 93B70 00193A70 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 93B74 00193A74 4000BF7F */  sq         $31, 0x40($sp)
/* 93B78 00193A78 3000B37F */  sq         $19, 0x30($sp)
/* 93B7C 00193A7C 2000B27F */  sq         $18, 0x20($sp)
/* 93B80 00193A80 1000B17F */  sq         $17, 0x10($sp)
/* 93B84 00193A84 0000B07F */  sq         $16, 0x0($sp)
/* 93B88 00193A88 2896A070 */  paddub     $18, $5, $0
/* 93B8C 00193A8C 08009324 */  addiu      $19, $4, 0x8
/* 93B90 00193A90 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93B94 00193A94 00000000 */   nop
/* 93B98 00193A98 28264070 */  paddub     $4, $2, $0
/* 93B9C 00193A9C 5428060C */  jal        GetSprite__Fi
/* 93BA0 00193AA0 00000000 */   nop
/* 93BA4 00193AA4 28864070 */  paddub     $16, $2, $0
/* 93BA8 00193AA8 04000016 */  bnez       $16, .L00193ABC
/* 93BAC 00193AAC 00000000 */   nop
/* 93BB0 00193AB0 28160070 */  paddub     $2, $0, $0
/* 93BB4 00193AB4 3A000010 */  b          .L00193BA0
/* 93BB8 00193AB8 00000000 */   nop
.L00193ABC:
/* 93BBC 00193ABC 01000224 */  addiu      $2, $0, 0x1
/* 93BC0 00193AC0 000002A6 */  sh         $2, 0x0($16)
/* 93BC4 00193AC4 28266072 */  paddub     $4, $19, $0
/* 93BC8 00193AC8 08009324 */  addiu      $19, $4, 0x8
/* 93BCC 00193ACC F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 93BD0 00193AD0 00000000 */   nop
/* 93BD4 00193AD4 288E4070 */  paddub     $17, $2, $0
/* 93BD8 00193AD8 28266072 */  paddub     $4, $19, $0
/* 93BDC 00193ADC 08009324 */  addiu      $19, $4, 0x8
/* 93BE0 00193AE0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93BE4 00193AE4 00000000 */   nop
/* 93BE8 00193AE8 140002A6 */  sh         $2, 0x14($16)
/* 93BEC 00193AEC 28266072 */  paddub     $4, $19, $0
/* 93BF0 00193AF0 08009324 */  addiu      $19, $4, 0x8
/* 93BF4 00193AF4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93BF8 00193AF8 00000000 */   nop
/* 93BFC 00193AFC 160002A6 */  sh         $2, 0x16($16)
/* 93C00 00193B00 28266072 */  paddub     $4, $19, $0
/* 93C04 00193B04 08009324 */  addiu      $19, $4, 0x8
/* 93C08 00193B08 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93C0C 00193B0C 00000000 */   nop
/* 93C10 00193B10 180002A6 */  sh         $2, 0x18($16)
/* 93C14 00193B14 28266072 */  paddub     $4, $19, $0
/* 93C18 00193B18 08009324 */  addiu      $19, $4, 0x8
/* 93C1C 00193B1C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93C20 00193B20 00000000 */   nop
/* 93C24 00193B24 1A0002A6 */  sh         $2, 0x1A($16)
/* 93C28 00193B28 0700412A */  slti       $at, $18, 0x7
/* 93C2C 00193B2C 05002014 */  bnez       $at, .L00193B44
/* 93C30 00193B30 00000000 */   nop
/* 93C34 00193B34 28266072 */  paddub     $4, $19, $0
/* 93C38 00193B38 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93C3C 00193B3C 00000000 */   nop
/* 93C40 00193B40 060002A6 */  sh         $2, 0x6($16)
.L00193B44:
/* 93C44 00193B44 C701023C */  lui        $2, %hi(TexManager)
/* 93C48 00193B48 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 93C4C 00193B4C 282E2072 */  paddub     $5, $17, $0
/* 93C50 00193B50 FFFF0624 */  addiu      $6, $0, -0x1
/* 93C54 00193B54 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 93C58 00193B58 00000000 */   nop
/* 93C5C 00193B5C 04004014 */  bnez       $2, .L00193B70
/* 93C60 00193B60 00000000 */   nop
/* 93C64 00193B64 28160070 */  paddub     $2, $0, $0
/* 93C68 00193B68 0D000010 */  b          .L00193BA0
/* 93C6C 00193B6C 00000000 */   nop
.L00193B70:
/* 93C70 00193B70 38000626 */  addiu      $6, $16, 0x38
/* 93C74 00193B74 05000524 */  addiu      $5, $0, 0x5
.L00193B78:
/* 93C78 00193B78 000044DC */  ld         $4, 0x0($2)
/* 93C7C 00193B7C 080043DC */  ld         $3, 0x8($2)
/* 93C80 00193B80 10004224 */  addiu      $2, $2, 0x10
/* 93C84 00193B84 FFFFA524 */  addiu      $5, $5, -0x1
/* 93C88 00193B88 0000C4FC */  sd         $4, 0x0($6)
/* 93C8C 00193B8C 0800C3FC */  sd         $3, 0x8($6)
/* 93C90 00193B90 1000C624 */  addiu      $6, $6, 0x10
/* 93C94 00193B94 F8FFA01C */  bgtz       $5, .L00193B78
/* 93C98 00193B98 00000000 */   nop
/* 93C9C 00193B9C 01000224 */  addiu      $2, $0, 0x1
.L00193BA0:
/* 93CA0 00193BA0 4000BF7B */  lq         $31, 0x40($sp)
/* 93CA4 00193BA4 3000B37B */  lq         $19, 0x30($sp)
/* 93CA8 00193BA8 2000B27B */  lq         $18, 0x20($sp)
/* 93CAC 00193BAC 1000B17B */  lq         $17, 0x10($sp)
/* 93CB0 00193BB0 0000B07B */  lq         $16, 0x0($sp)
/* 93CB4 00193BB4 5000BD27 */  addiu      $sp, $sp, 0x50
/* 93CB8 00193BB8 0800E003 */  jr         $31
/* 93CBC 00193BBC 00000000 */   nop
