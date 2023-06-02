.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawLimmitMax__Fiii
/* F9FB0 001F9EB0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* F9FB4 001F9EB4 0000BF7F */  sq         $31, 0x0($sp)
/* F9FB8 001F9EB8 283EC070 */  paddub     $7, $6, $0
/* F9FBC 001F9EBC F8000224 */  addiu      $2, $0, 0xF8
/* F9FC0 001F9EC0 2000A2AF */  sw         $2, 0x20($sp)
/* F9FC4 001F9EC4 58010224 */  addiu      $2, $0, 0x158
/* F9FC8 001F9EC8 2400A2AF */  sw         $2, 0x24($sp)
/* F9FCC 001F9ECC 1E000324 */  addiu      $3, $0, 0x1E
/* F9FD0 001F9ED0 2800A3AF */  sw         $3, 0x28($sp)
/* F9FD4 001F9ED4 0A000224 */  addiu      $2, $0, 0xA
/* F9FD8 001F9ED8 2C00A2AF */  sw         $2, 0x2C($sp)
/* F9FDC 001F9EDC 1000A4AF */  sw         $4, 0x10($sp)
/* F9FE0 001F9EE0 1400A5AF */  sw         $5, 0x14($sp)
/* F9FE4 001F9EE4 1800A3AF */  sw         $3, 0x18($sp)
/* F9FE8 001F9EE8 1C00A2AF */  sw         $2, 0x1C($sp)
/* F9FEC 001F9EEC 2C95848F */  lw         $4, -0x6AD4($gp)
/* F9FF0 001F9EF0 1000A527 */  addiu      $5, $sp, 0x10
/* F9FF4 001F9EF4 2000A627 */  addiu      $6, $sp, 0x20
/* F9FF8 001F9EF8 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F9FFC 001F9EFC 00000000 */   nop
/* FA000 001F9F00 0000BF7B */  lq         $31, 0x0($sp)
/* FA004 001F9F04 3000BD27 */  addiu      $sp, $sp, 0x30
/* FA008 001F9F08 0800E003 */  jr         $31
/* FA00C 001F9F0C 00000000 */   nop
