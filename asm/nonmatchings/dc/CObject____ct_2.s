.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__7CObjectFf
/* 57110 00157010 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 57114 00157014 1000BF7F */  sq         $31, 0x10($sp)
/* 57118 00157018 0000B07F */  sq         $16, 0x0($sp)
/* 5711C 0015701C 28868070 */  paddub     $16, $4, $0
/* 57120 00157020 2A00023C */  lui        $2, %hi(__vt__7CObject)
/* 57124 00157024 D0154224 */  addiu      $2, $2, %lo(__vt__7CObject)
/* 57128 00157028 A00082AC */  sw         $2, 0xA0($4)
/* 5712C 0015702C 145C050C */  jal        Initialize__7CObjectFf
/* 57130 00157030 00000000 */   nop
/* 57134 00157034 28160072 */  paddub     $2, $16, $0
/* 57138 00157038 1000BF7B */  lq         $31, 0x10($sp)
/* 5713C 0015703C 0000B07B */  lq         $16, 0x0($sp)
/* 57140 00157040 2000BD27 */  addiu      $sp, $sp, 0x20
/* 57144 00157044 0800E003 */  jr         $31
/* 57148 00157048 00000000 */   nop
/* 5714C 0015704C 00000000 */  nop
