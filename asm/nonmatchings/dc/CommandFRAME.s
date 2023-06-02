.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandFRAME__FPPv
/* 3FCE0 0013FBE0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 3FCE4 0013FBE4 0000BF7F */  sq         $31, 0x0($sp)
/* 3FCE8 0013FBE8 0000858C */  lw         $5, 0x0($4)
/* 3FCEC 0013FBEC 148D848F */  lw         $4, -0x72EC($gp)
/* 3FCF0 0013FBF0 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 3FCF4 0013FBF4 00000000 */   nop
/* 3FCF8 0013FBF8 28264070 */  paddub     $4, $2, $0
/* 3FCFC 0013FBFC 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FD00 0013FC00 3C0064AC */  sw         $4, 0x3C($3)
/* 3FD04 0013FC04 11008010 */  beqz       $4, .L0013FC4C
/* 3FD08 0013FC08 00000000 */   nop
/* 3FD0C 0013FC0C 02000224 */  addiu      $2, $0, 0x2
/* 3FD10 0013FC10 B00082A4 */  sh         $2, 0xB0($4)
/* 3FD14 0013FC14 88A8040C */  jal        GetVisual__9CFrameVu1Fv
/* 3FD18 0013FC18 00000000 */   nop
/* 3FD1C 0013FC1C 28264070 */  paddub     $4, $2, $0
/* 3FD20 0013FC20 0800598C */  lw         $25, 0x8($2)
/* 3FD24 0013FC24 1000398F */  lw         $25, 0x10($25)
/* 3FD28 0013FC28 09F82003 */  jalr       $25
/* 3FD2C 0013FC2C 00000000 */   nop
/* 3FD30 0013FC30 0C8D848F */  lw         $4, -0x72F4($gp)
/* 3FD34 0013FC34 282E4070 */  paddub     $5, $2, $0
/* 3FD38 0013FC38 188D868F */  lw         $6, -0x72E8($gp)
/* 3FD3C 0013FC3C 0800998C */  lw         $25, 0x8($4)
/* 3FD40 0013FC40 2400398F */  lw         $25, 0x24($25)
/* 3FD44 0013FC44 09F82003 */  jalr       $25
/* 3FD48 0013FC48 00000000 */   nop
.L0013FC4C:
/* 3FD4C 0013FC4C 0000BF7B */  lq         $31, 0x0($sp)
/* 3FD50 0013FC50 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3FD54 0013FC54 0800E003 */  jr         $31
/* 3FD58 0013FC58 00000000 */   nop
/* 3FD5C 0013FC5C 00000000 */  nop
