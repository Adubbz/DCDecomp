.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetParent__6CFrameFP6CFrame
/* 28180 00128080 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 28184 00128084 0000BF7F */  sq         $31, 0x0($sp)
/* 28188 00128088 28368070 */  paddub     $6, $4, $0
/* 2818C 0012808C 1001838C */  lw         $3, 0x110($4)
/* 28190 00128090 08006014 */  bnez       $3, .L001280B4
/* 28194 00128094 00000000 */   nop
/* 28198 00128098 1001C5AC */  sw         $5, 0x110($6)
/* 2819C 0012809C 0500A010 */  beqz       $5, .L001280B4
/* 281A0 001280A0 00000000 */   nop
/* 281A4 001280A4 2826A070 */  paddub     $4, $5, $0
/* 281A8 001280A8 282EC070 */  paddub     $5, $6, $0
/* 281AC 001280AC 48A0040C */  jal        SetChild__6CFrameFP6CFrame
/* 281B0 001280B0 00000000 */   nop
.L001280B4:
/* 281B4 001280B4 0000BF7B */  lq         $31, 0x0($sp)
/* 281B8 001280B8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 281BC 001280BC 0800E003 */  jr         $31
/* 281C0 001280C0 00000000 */   nop
/* 281C4 001280C4 00000000 */  nop
/* 281C8 001280C8 00000000 */  nop
/* 281CC 001280CC 00000000 */  nop
