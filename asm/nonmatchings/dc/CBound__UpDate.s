.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UpDate__6CBoundFv
/* 3DD70 0013DC70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3DD74 0013DC74 1000BF7F */  sq         $31, 0x10($sp)
/* 3DD78 0013DC78 0000B07F */  sq         $16, 0x0($sp)
/* 3DD7C 0013DC7C 28868070 */  paddub     $16, $4, $0
/* 3DD80 0013DC80 E000858C */  lw         $5, 0xE0($4)
/* 3DD84 0013DC84 02000324 */  addiu      $3, $0, 0x2
/* 3DD88 0013DC88 0A00A310 */  beq        $5, $3, .L0013DCB4
/* 3DD8C 0013DC8C 00000000 */   nop
/* 3DD90 0013DC90 01000324 */  addiu      $3, $0, 0x1
/* 3DD94 0013DC94 0300A310 */  beq        $5, $3, .L0013DCA4
/* 3DD98 0013DC98 00000000 */   nop
/* 3DD9C 0013DC9C 07000010 */  b          .L0013DCBC
/* 3DDA0 0013DCA0 00000000 */   nop
.L0013DCA4:
/* 3DDA4 0013DCA4 8CF5040C */  jal        UpDateDir__6CBoundFv
/* 3DDA8 0013DCA8 00000000 */   nop
/* 3DDAC 0013DCAC 03000010 */  b          .L0013DCBC
/* 3DDB0 0013DCB0 00000000 */   nop
.L0013DCB4:
/* 3DDB4 0013DCB4 7CF6040C */  jal        UpDateDirPos__6CBoundFv
/* 3DDB8 0013DCB8 00000000 */   nop
.L0013DCBC:
/* 3DDBC 0013DCBC 0000048E */  lw         $4, 0x0($16)
/* 3DDC0 0013DCC0 03008010 */  beqz       $4, .L0013DCD0
/* 3DDC4 0013DCC4 00000000 */   nop
/* 3DDC8 0013DCC8 1CF7040C */  jal        UpDate__6CBoundFv
/* 3DDCC 0013DCCC 00000000 */   nop
.L0013DCD0:
/* 3DDD0 0013DCD0 1000BF7B */  lq         $31, 0x10($sp)
/* 3DDD4 0013DCD4 0000B07B */  lq         $16, 0x0($sp)
/* 3DDD8 0013DCD8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 3DDDC 0013DCDC 0800E003 */  jr         $31
/* 3DDE0 0013DCE0 00000000 */   nop
/* 3DDE4 0013DCE4 00000000 */  nop
/* 3DDE8 0013DCE8 00000000 */  nop
/* 3DDEC 0013DCEC 00000000 */  nop
