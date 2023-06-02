.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyUnFormat__Fv
/* 122270 00222170 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 122274 00222174 0000BF7F */  sq         $31, 0x0($sp)
/* 122278 00222178 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12227C 0022217C 8082248C */  lw         $4, -0x7D80($at)
/* 122280 00222180 C0100400 */  sll        $2, $4, 3
/* 122284 00222184 21104400 */  addu       $2, $2, $4
/* 122288 00222188 80180200 */  sll        $3, $2, 2
/* 12228C 0022218C DB01023C */  lui        $2, %hi(McAccess)
/* 122290 00222190 80824224 */  addiu      $2, $2, %lo(McAccess)
/* 122294 00222194 21104300 */  addu       $2, $2, $3
/* 122298 00222198 DC04428C */  lw         $2, 0x4DC($2)
/* 12229C 0022219C 08004010 */  beqz       $2, .L002221C0
/* 1222A0 002221A0 00000000 */   nop
/* 1222A4 002221A4 DB01023C */  lui        $2, %hi(McAccess)
/* 1222A8 002221A8 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 1222AC 002221AC 0A000524 */  addiu      $5, $0, 0xA
/* 1222B0 002221B0 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 1222B4 002221B4 00000000 */   nop
/* 1222B8 002221B8 06000010 */  b          .L002221D4
/* 1222BC 002221BC 00000000 */   nop
.L002221C0:
/* 1222C0 002221C0 03000224 */  addiu      $2, $0, 0x3
/* 1222C4 002221C4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1222C8 002221C8 D48A22AC */  sw         $2, -0x752C($at)
/* 1222CC 002221CC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1222D0 002221D0 DC8A24AC */  sw         $4, -0x7524($at)
.L002221D4:
/* 1222D4 002221D4 01000224 */  addiu      $2, $0, 0x1
/* 1222D8 002221D8 0000BF7B */  lq         $31, 0x0($sp)
/* 1222DC 002221DC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 1222E0 002221E0 0800E003 */  jr         $31
/* 1222E4 002221E4 00000000 */   nop
/* 1222E8 002221E8 00000000 */  nop
/* 1222EC 002221EC 00000000 */  nop
