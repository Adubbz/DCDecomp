.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitItemTrushStart__Fv
/* 102D10 00202C10 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 102D14 00202C14 0000BF7F */  sq         $31, 0x0($sp)
/* 102D18 00202C18 8CFB040C */  jal        ReadBGSync__Fv
/* 102D1C 00202C1C 00000000 */   nop
/* 102D20 00202C20 14004014 */  bnez       $2, .L00202C74
/* 102D24 00202C24 00000000 */   nop
/* 102D28 00202C28 70D6070C */  jal        BattleMenuTexEnter__Fv
/* 102D2C 00202C2C 00000000 */   nop
/* 102D30 00202C30 D894838F */  lw         $3, -0x6B28($gp)
/* 102D34 00202C34 01000224 */  addiu      $2, $0, 0x1
/* 102D38 00202C38 03006214 */  bne        $3, $2, .L00202C48
/* 102D3C 00202C3C 00000000 */   nop
/* 102D40 00202C40 D494828F */  lw         $2, -0x6B2C($gp)
/* 102D44 00202C44 040040A0 */  sb         $0, 0x4($2)
.L00202C48:
/* 102D48 00202C48 D494828F */  lw         $2, -0x6B2C($gp)
/* 102D4C 00202C4C 04004580 */  lb         $5, 0x4($2)
/* 102D50 00202C50 28260070 */  paddub     $4, $0, $0
/* 102D54 00202C54 7809080C */  jal        InitItemMode__Fii
/* 102D58 00202C58 00000000 */   nop
/* 102D5C 00202C5C 5895838F */  lw         $3, -0x6AA8($gp)
/* 102D60 00202C60 08006324 */  addiu      $3, $3, 0x8
/* 102D64 00202C64 208883AF */  sw         $3, -0x77E0($gp)
/* 102D68 00202C68 01000324 */  addiu      $3, $0, 0x1
/* 102D6C 00202C6C 308883AF */  sw         $3, -0x77D0($gp)
/* 102D70 00202C70 849580AF */  sw         $0, -0x6A7C($gp)
.L00202C74:
/* 102D74 00202C74 0000BF7B */  lq         $31, 0x0($sp)
/* 102D78 00202C78 1000BD27 */  addiu      $sp, $sp, 0x10
/* 102D7C 00202C7C 0800E003 */  jr         $31
/* 102D80 00202C80 00000000 */   nop
/* 102D84 00202C84 00000000 */  nop
/* 102D88 00202C88 00000000 */  nop
/* 102D8C 00202C8C 00000000 */  nop
