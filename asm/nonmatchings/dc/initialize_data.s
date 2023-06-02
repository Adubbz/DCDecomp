.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel initialize_data__Fv
/* 41180 00141080 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 41184 00141084 0000BF7F */  sq         $31, 0x0($sp)
/* 41188 00141088 DC03050C */  jal        LoadSystemMessage__Fv
/* 4118C 0014108C 00000000 */   nop
/* 41190 00141090 FFFF0224 */  addiu      $2, $0, -0x1
/* 41194 00141094 F49382AF */  sw         $2, -0x6C0C($gp)
/* 41198 00141098 A403050C */  jal        LoadSndTxt__Fv
/* 4119C 0014109C 00000000 */   nop
/* 411A0 001410A0 0000BF7B */  lq         $31, 0x0($sp)
/* 411A4 001410A4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 411A8 001410A8 0800E003 */  jr         $31
/* 411AC 001410AC 00000000 */   nop
