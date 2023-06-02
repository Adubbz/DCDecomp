.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetBrother__6CFrameFP6CFrame
/* 281D0 001280D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 281D4 001280D4 0000BF7F */  sq         $31, 0x0($sp)
/* 281D8 001280D8 0C00A010 */  beqz       $5, .L0012810C
/* 281DC 001280DC 00000000 */   nop
/* 281E0 001280E0 3C01838C */  lw         $3, 0x13C($4)
/* 281E4 001280E4 06006010 */  beqz       $3, .L00128100
/* 281E8 001280E8 00000000 */   nop
/* 281EC 001280EC 28266070 */  paddub     $4, $3, $0
/* 281F0 001280F0 34A0040C */  jal        SetBrother__6CFrameFP6CFrame
/* 281F4 001280F4 00000000 */   nop
/* 281F8 001280F8 04000010 */  b          .L0012810C
/* 281FC 001280FC 00000000 */   nop
.L00128100:
/* 28200 00128100 3C0185AC */  sw         $5, 0x13C($4)
/* 28204 00128104 3C01838C */  lw         $3, 0x13C($4)
/* 28208 00128108 400164AC */  sw         $4, 0x140($3)
.L0012810C:
/* 2820C 0012810C 0000BF7B */  lq         $31, 0x0($sp)
/* 28210 00128110 1000BD27 */  addiu      $sp, $sp, 0x10
/* 28214 00128114 0800E003 */  jr         $31
/* 28218 00128118 00000000 */   nop
/* 2821C 0012811C 00000000 */  nop
