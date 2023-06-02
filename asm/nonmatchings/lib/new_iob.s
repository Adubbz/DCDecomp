.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel new_iob
/* 17C70 00117B70 2B00043C */  lui        $4, %hi(D_002A8010)
/* 17C74 00117B74 00000000 */  nop
.L00117B78:
/* 17C78 00117B78 39000042 */  di # handwritten instruction
/* 17C7C 00117B7C 0F040000 */  sync.p
/* 17C80 00117B80 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 17C84 00117B84 0100033C */  lui        $3, (0x10000 >> 16)
/* 17C88 00117B88 24104300 */  and        $2, $2, $3
/* 17C8C 00117B8C FAFF4014 */  bnez       $2, .L00117B78
/* 17C90 00117B90 00000000 */   nop
/* 17C94 00117B94 10808324 */  addiu      $3, $4, %lo(D_002A8010)
/* 17C98 00117B98 00016424 */  addiu      $4, $3, 0x100
/* 17C9C 00117B9C 2B106400 */  sltu       $2, $3, $4
/* 17CA0 00117BA0 0C004010 */  beqz       $2, .L00117BD4
/* 17CA4 00117BA4 0010053C */   lui       $5, (0x10000000 >> 16)
/* 17CA8 00117BA8 0400628C */  lw         $2, 0x4($3)
/* 17CAC 00117BAC 00000000 */  nop
.L00117BB0:
/* 17CB0 00117BB0 05004054 */  bnel       $2, $0, .L00117BC8
/* 17CB4 00117BB4 10006324 */   addiu     $3, $3, 0x10
/* 17CB8 00117BB8 040065AC */  sw         $5, 0x4($3)
/* 17CBC 00117BBC 38000042 */  ei # handwritten instruction
/* 17CC0 00117BC0 0800E003 */  jr         $31
/* 17CC4 00117BC4 2D106000 */   daddu     $2, $3, $0
.L00117BC8:
/* 17CC8 00117BC8 2B106400 */  sltu       $2, $3, $4
/* 17CCC 00117BCC F8FF4054 */  bnel       $2, $0, .L00117BB0
/* 17CD0 00117BD0 0400628C */   lw        $2, 0x4($3)
.L00117BD4:
/* 17CD4 00117BD4 38000042 */  ei # handwritten instruction
/* 17CD8 00117BD8 0800E003 */  jr         $31
/* 17CDC 00117BDC 2D100000 */   daddu     $2, $0, $0
