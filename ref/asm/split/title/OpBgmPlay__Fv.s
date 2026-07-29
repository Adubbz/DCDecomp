.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpBgmPlay__Fv
/* 0051B0 01DB0EB0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0051B4 01DB0EB4 0000BF7F */  sq          $31, 0x0($29)
/* 0051B8 01DB0EB8 DD01023C */  lui         $2, %hi(LIT_970__3)
/* 0051BC 01DB0EBC 105C4224 */  addiu       $2, $2, %lo(LIT_970__3)
/* 0051C0 01DB0EC0 1000A427 */  addiu       $4, $29, 0x10
/* 0051C4 01DB0EC4 00004378 */  lq          $3, 0x0($2)
/* 0051C8 01DB0EC8 10004278 */  lq          $2, 0x10($2)
/* 0051CC 01DB0ECC 0000837C */  sq          $3, 0x0($4)
/* 0051D0 01DB0ED0 1000827C */  sq          $2, 0x10($4)
/* 0051D4 01DB0ED4 2C98828F */  lw          $2, -0x67D4($28)
/* 0051D8 01DB0ED8 08004014 */  bnez        $2, .L01DB0EFC_2B66FC
/* 0051DC 01DB0EDC 00000000 */   nop
/* 0051E0 01DB0EE0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0051E4 01DB0EE4 282E0070 */  paddub      $5, $0, $0
/* 0051E8 01DB0EE8 28360070 */  paddub      $6, $0, $0
/* 0051EC 01DB0EEC 8814050C */  jal         SQ_Play__6CSoundFii
/* 0051F0 01DB0EF0 00000000 */   nop
/* 0051F4 01DB0EF4 07000010 */  b           .L01DB0F14_2B6714
/* 0051F8 01DB0EF8 00000000 */   nop
.L01DB0EFC_2B66FC:
/* 0051FC 01DB0EFC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 005200 01DB0F00 282E0070 */  paddub      $5, $0, $0
/* 005204 01DB0F04 28360070 */  paddub      $6, $0, $0
/* 005208 01DB0F08 283E0070 */  paddub      $7, $0, $0
/* 00520C 01DB0F0C FC14050C */  jal         SQ_Play__6CSoundFiii
/* 005210 01DB0F10 00000000 */   nop
.L01DB0F14_2B6714:
/* 005214 01DB0F14 3498848F */  lw          $4, -0x67CC($28)
/* 005218 01DB0F18 80180400 */  sll         $3, $4, 2
/* 00521C 01DB0F1C 21187D00 */  addu        $3, $3, $29
/* 005220 01DB0F20 1000638C */  lw          $3, 0x10($3)
/* 005224 01DB0F24 309883AF */  sw          $3, -0x67D0($28)
/* 005228 01DB0F28 01008324 */  addiu       $3, $4, 0x1
/* 00522C 01DB0F2C 349883AF */  sw          $3, -0x67CC($28)
/* 005230 01DB0F30 0000BF7B */  lq          $31, 0x0($29)
/* 005234 01DB0F34 3000BD27 */  addiu       $29, $29, 0x30
/* 005238 01DB0F38 0800E003 */  jr          $31
/* 00523C 01DB0F3C 00000000 */   nop
