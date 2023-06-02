.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdOptionSelect__Fv
/* 113350 00213250 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 113354 00213254 2000BF7F */  sq         $31, 0x20($sp)
/* 113358 00213258 1000B17F */  sq         $17, 0x10($sp)
/* 11335C 0021325C 0000B07F */  sq         $16, 0x0($sp)
/* 113360 00213260 28860070 */  paddub     $16, $0, $0
/* 113364 00213264 78968387 */  lh         $3, -0x6988($gp)
/* 113368 00213268 02000224 */  addiu      $2, $0, 0x2
/* 11336C 0021326C 0F006210 */  beq        $3, $2, .L002132AC
/* 113370 00213270 00000000 */   nop
/* 113374 00213274 01000224 */  addiu      $2, $0, 0x1
/* 113378 00213278 03006210 */  beq        $3, $2, .L00213288
/* 11337C 0021327C 00000000 */   nop
/* 113380 00213280 0D000010 */  b          .L002132B8
/* 113384 00213284 00000000 */   nop
.L00213288:
/* 113388 00213288 AC41080C */  jal        CalMoveFromMenuIcon__Fv
/* 11338C 0021328C 00000000 */   nop
/* 113390 00213290 28864070 */  paddub     $16, $2, $0
/* 113394 00213294 08000012 */  beqz       $16, .L002132B8
/* 113398 00213298 00000000 */   nop
/* 11339C 0021329C 789680A7 */  sh         $0, -0x6988($gp)
/* 1133A0 002132A0 7C9680AF */  sw         $0, -0x6984($gp)
/* 1133A4 002132A4 04000010 */  b          .L002132B8
/* 1133A8 002132A8 00000000 */   nop
.L002132AC:
/* 1133AC 002132AC 3C42080C */  jal        CalMoveToMenuIcon__Fv
/* 1133B0 002132B0 00000000 */   nop
/* 1133B4 002132B4 28864070 */  paddub     $16, $2, $0
.L002132B8:
/* 1133B8 002132B8 78968287 */  lh         $2, -0x6988($gp)
/* 1133BC 002132BC 09004010 */  beqz       $2, .L002132E4
/* 1133C0 002132C0 00000000 */   nop
/* 1133C4 002132C4 7C9681C7 */  lwc1       $f1, -0x6984($gp)
/* 1133C8 002132C8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 1133CC 002132CC 00008244 */  mtc1       $2, $f0
/* 1133D0 002132D0 00000000 */  nop
/* 1133D4 002132D4 00080046 */  add.s      $f0, $f1, $f0
/* 1133D8 002132D8 7C9680E7 */  swc1       $f0, -0x6984($gp)
/* 1133DC 002132DC 02000010 */  b          .L002132E8
/* 1133E0 002132E0 00000000 */   nop
.L002132E4:
/* 1133E4 002132E4 7C9680AF */  sw         $0, -0x6984($gp)
.L002132E8:
/* 1133E8 002132E8 6C7A080C */  jal        MenuOptionKey__Fv
/* 1133EC 002132EC 00000000 */   nop
/* 1133F0 002132F0 288E4070 */  paddub     $17, $2, $0
/* 1133F4 002132F4 B87E080C */  jal        OptionMenuFadeOutStart__Fv
/* 1133F8 002132F8 00000000 */   nop
/* 1133FC 002132FC 0B004010 */  beqz       $2, .L0021332C
/* 113400 00213300 00000000 */   nop
/* 113404 00213304 02000324 */  addiu      $3, $0, 0x2
/* 113408 00213308 789683A7 */  sh         $3, -0x6988($gp)
/* 11340C 0021330C 07000012 */  beqz       $16, .L0021332C
/* 113410 00213310 00000000 */   nop
/* 113414 00213314 05002012 */  beqz       $17, .L0021332C
/* 113418 00213318 00000000 */   nop
/* 11341C 0021331C 5C9680AF */  sw         $0, -0x69A4($gp)
/* 113420 00213320 549683AF */  sw         $3, -0x69AC($gp)
/* 113424 00213324 01000324 */  addiu      $3, $0, 0x1
/* 113428 00213328 909683A7 */  sh         $3, -0x6970($gp)
.L0021332C:
/* 11342C 0021332C 2000BF7B */  lq         $31, 0x20($sp)
/* 113430 00213330 1000B17B */  lq         $17, 0x10($sp)
/* 113434 00213334 0000B07B */  lq         $16, 0x0($sp)
/* 113438 00213338 3000BD27 */  addiu      $sp, $sp, 0x30
/* 11343C 0021333C 0800E003 */  jr         $31
/* 113440 00213340 00000000 */   nop
/* 113444 00213344 00000000 */  nop
/* 113448 00213348 00000000 */  nop
/* 11344C 0021334C 00000000 */  nop
