.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OptionDraw__Fv
/* 1132E0 002131E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1132E4 002131E4 0000BF7F */  sq         $31, 0x0($sp)
/* 1132E8 002131E8 AC7C080C */  jal        DrawMenuOption__Fv
/* 1132EC 002131EC 00000000 */   nop
/* 1132F0 002131F0 28260070 */  paddub     $4, $0, $0
/* 1132F4 002131F4 046F050C */  jal        setbilinear__Fi
/* 1132F8 002131F8 00000000 */   nop
/* 1132FC 002131FC 78968387 */  lh         $3, -0x6988($gp)
/* 113300 00213200 02000224 */  addiu      $2, $0, 0x2
/* 113304 00213204 06006210 */  beq        $3, $2, .L00213220
/* 113308 00213208 00000000 */   nop
/* 11330C 0021320C 01000224 */  addiu      $2, $0, 0x1
/* 113310 00213210 03006210 */  beq        $3, $2, .L00213220
/* 113314 00213214 00000000 */   nop
/* 113318 00213218 05000010 */  b          .L00213230
/* 11331C 0021321C 00000000 */   nop
.L00213220:
/* 113320 00213220 3C41080C */  jal        DrawMoveMenuIcon__Fv
/* 113324 00213224 00000000 */   nop
/* 113328 00213228 04000010 */  b          .L0021323C
/* 11332C 0021322C 00000000 */   nop
.L00213230:
/* 113330 00213230 04000424 */  addiu      $4, $0, 0x4
/* 113334 00213234 C840080C */  jal        DrawMenuIcon__Fi
/* 113338 00213238 00000000 */   nop
.L0021323C:
/* 11333C 0021323C 0000BF7B */  lq         $31, 0x0($sp)
/* 113340 00213240 1000BD27 */  addiu      $sp, $sp, 0x10
/* 113344 00213244 0800E003 */  jr         $31
/* 113348 00213248 00000000 */   nop
/* 11334C 0021324C 00000000 */  nop