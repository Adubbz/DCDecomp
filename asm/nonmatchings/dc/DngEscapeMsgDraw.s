.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DngEscapeMsgDraw__Fv
/* 10F340 0020F240 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10F344 0020F244 0000BF7F */  sq         $31, 0x0($sp)
/* 10F348 0020F248 80000424 */  addiu      $4, $0, 0x80
/* 10F34C 0020F24C A0B4080C */  jal        AllFadeForMenu__Fi
/* 10F350 0020F250 00000000 */   nop
/* 10F354 0020F254 1896838F */  lw         $3, -0x69E8($gp)
/* 10F358 0020F258 04006010 */  beqz       $3, .L0020F26C
/* 10F35C 0020F25C 00000000 */   nop
/* 10F360 0020F260 1C96838F */  lw         $3, -0x69E4($gp)
/* 10F364 0020F264 03006014 */  bnez       $3, .L0020F274
/* 10F368 0020F268 00000000 */   nop
.L0020F26C:
/* 10F36C 0020F26C 38000010 */  b          .L0020F350
/* 10F370 0020F270 00000000 */   nop
.L0020F274:
/* 10F374 0020F274 2C968487 */  lh         $4, -0x69D4($gp)
/* 10F378 0020F278 38B4080C */  jal        MenuTextureReload__Fi
/* 10F37C 0020F27C 00000000 */   nop
/* 10F380 0020F280 2896848F */  lw         $4, -0x69D8($gp)
/* 10F384 0020F284 282E0070 */  paddub     $5, $0, $0
/* 10F388 0020F288 28360070 */  paddub     $6, $0, $0
/* 10F38C 0020F28C 80000724 */  addiu      $7, $0, 0x80
/* 10F390 0020F290 F4C9080C */  jal        DrawFullSizePicture__FP8CTextureiii
/* 10F394 0020F294 00000000 */   nop
/* 10F398 0020F298 1896828F */  lw         $2, -0x69E8($gp)
/* 10F39C 0020F29C 4C17448C */  lw         $4, 0x174C($2)
/* 10F3A0 0020F2A0 38B4080C */  jal        MenuTextureReload__Fi
/* 10F3A4 0020F2A4 00000000 */   nop
/* 10F3A8 0020F2A8 28260070 */  paddub     $4, $0, $0
/* 10F3AC 0020F2AC 046F050C */  jal        setbilinear__Fi
/* 10F3B0 0020F2B0 00000000 */   nop
/* 10F3B4 0020F2B4 01000324 */  addiu      $3, $0, 0x1
/* 10F3B8 0020F2B8 1896828F */  lw         $2, -0x69E8($gp)
/* 10F3BC 0020F2BC 980043AC */  sw         $3, 0x98($2)
/* 10F3C0 0020F2C0 1896848F */  lw         $4, -0x69E8($gp)
/* 10F3C4 0020F2C4 6437050C */  jal        Step__6ClsMesFv
/* 10F3C8 0020F2C8 00000000 */   nop
/* 10F3CC 0020F2CC 1C96848F */  lw         $4, -0x69E4($gp)
/* 10F3D0 0020F2D0 6437050C */  jal        Step__6ClsMesFv
/* 10F3D4 0020F2D4 00000000 */   nop
/* 10F3D8 0020F2D8 1896848F */  lw         $4, -0x69E8($gp)
/* 10F3DC 0020F2DC C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 10F3E0 0020F2E0 00000000 */   nop
/* 10F3E4 0020F2E4 1C96848F */  lw         $4, -0x69E4($gp)
/* 10F3E8 0020F2E8 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 10F3EC 0020F2EC 00000000 */   nop
/* 10F3F0 0020F2F0 30968287 */  lh         $2, -0x69D0($gp)
/* 10F3F4 0020F2F4 0C004010 */  beqz       $2, .L0020F328
/* 10F3F8 0020F2F8 00000000 */   nop
/* 10F3FC 0020F2FC EC888287 */  lh         $2, -0x7714($gp)
/* 10F400 0020F300 03004224 */  addiu      $2, $2, 0x3
/* 10F404 0020F304 EC8882A7 */  sh         $2, -0x7714($gp)
/* 10F408 0020F308 EC888287 */  lh         $2, -0x7714($gp)
/* 10F40C 0020F30C 81004128 */  slti       $at, $2, 0x81
/* 10F410 0020F310 0C002014 */  bnez       $at, .L0020F344
/* 10F414 0020F314 00000000 */   nop
/* 10F418 0020F318 80000224 */  addiu      $2, $0, 0x80
/* 10F41C 0020F31C EC8882A7 */  sh         $2, -0x7714($gp)
/* 10F420 0020F320 08000010 */  b          .L0020F344
/* 10F424 0020F324 00000000 */   nop
.L0020F328:
/* 10F428 0020F328 EC888287 */  lh         $2, -0x7714($gp)
/* 10F42C 0020F32C FDFF4224 */  addiu      $2, $2, -0x3
/* 10F430 0020F330 EC8882A7 */  sh         $2, -0x7714($gp)
/* 10F434 0020F334 EC888287 */  lh         $2, -0x7714($gp)
/* 10F438 0020F338 02004104 */  bgez       $2, .L0020F344
/* 10F43C 0020F33C 00000000 */   nop
/* 10F440 0020F340 EC8880A7 */  sh         $0, -0x7714($gp)
.L0020F344:
/* 10F444 0020F344 EC888487 */  lh         $4, -0x7714($gp)
/* 10F448 0020F348 A0B4080C */  jal        AllFadeForMenu__Fi
/* 10F44C 0020F34C 00000000 */   nop
.L0020F350:
/* 10F450 0020F350 0000BF7B */  lq         $31, 0x0($sp)
/* 10F454 0020F354 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10F458 0020F358 0800E003 */  jr         $31
/* 10F45C 0020F35C 00000000 */   nop
