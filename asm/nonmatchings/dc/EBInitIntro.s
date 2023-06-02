.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EBInitIntro__Fv
/* 68300 00168200 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 68304 00168204 0000BF7F */  sq         $31, 0x0($sp)
/* 68308 00168208 C701023C */  lui        $2, %hi(TexManager)
/* 6830C 0016820C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 68310 00168210 2A00023C */  lui        $2, %hi(_314_2)
/* 68314 00168214 D0A14524 */  addiu      $5, $2, %lo(_314_2)
/* 68318 00168218 FFFF0624 */  addiu      $6, $0, -0x1
/* 6831C 0016821C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 68320 00168220 00000000 */   nop
/* 68324 00168224 D88E82AF */  sw         $2, -0x7128($gp)
/* 68328 00168228 D88E838F */  lw         $3, -0x7128($gp)
/* 6832C 0016822C 1A006010 */  beqz       $3, .L00168298
/* 68330 00168230 00000000 */   nop
/* 68334 00168234 C701023C */  lui        $2, %hi(TexManager)
/* 68338 00168238 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 6833C 0016823C 2A00023C */  lui        $2, %hi(_315_2)
/* 68340 00168240 D8A14524 */  addiu      $5, $2, %lo(_315_2)
/* 68344 00168244 FFFF0624 */  addiu      $6, $0, -0x1
/* 68348 00168248 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 6834C 0016824C 00000000 */   nop
/* 68350 00168250 DC8E82AF */  sw         $2, -0x7124($gp)
/* 68354 00168254 DC8E838F */  lw         $3, -0x7124($gp)
/* 68358 00168258 0F006010 */  beqz       $3, .L00168298
/* 6835C 0016825C 00000000 */   nop
/* 68360 00168260 A88E80AF */  sw         $0, -0x7158($gp)
/* 68364 00168264 01000324 */  addiu      $3, $0, 0x1
/* 68368 00168268 A08E83AF */  sw         $3, -0x7160($gp)
/* 6836C 0016826C 80020324 */  addiu      $3, $0, 0x280
/* 68370 00168270 1000A3AF */  sw         $3, 0x10($sp)
/* 68374 00168274 1400A0AF */  sw         $0, 0x14($sp)
/* 68378 00168278 1800A0AF */  sw         $0, 0x18($sp)
/* 6837C 0016827C C0010324 */  addiu      $3, $0, 0x1C0
/* 68380 00168280 1C00A3AF */  sw         $3, 0x1C($sp)
/* 68384 00168284 1000A527 */  addiu      $5, $sp, 0x10
/* 68388 00168288 D201033C */  lui        $3, %hi(draw_rect)
/* 6838C 0016828C 608F6424 */  addiu      $4, $3, %lo(draw_rect)
/* 68390 00168290 0000A378 */  lq         $3, 0x0($5)
/* 68394 00168294 0000837C */  sq         $3, 0x0($4)
.L00168298:
/* 68398 00168298 0000BF7B */  lq         $31, 0x0($sp)
/* 6839C 0016829C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 683A0 001682A0 0800E003 */  jr         $31
/* 683A4 001682A4 00000000 */   nop
/* 683A8 001682A8 00000000 */  nop
/* 683AC 001682AC 00000000 */  nop