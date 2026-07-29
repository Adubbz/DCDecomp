.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EditPartsObjectOnOff__Fv
/* 07DEB0 0017DDB0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 07DEB4 0017DDB4 1000BF7F */  sq          $31, 0x10($29)
/* 07DEB8 0017DDB8 0000B07F */  sq          $16, 0x0($29)
/* 07DEBC 0017DDBC D201023C */  lui         $2, %hi(EditPartsInfo)
/* 07DEC0 0017DDC0 F09B4424 */  addiu       $4, $2, %lo(EditPartsInfo)
/* 07DEC4 0017DDC4 FFFF0524 */  addiu       $5, $0, -0x1
/* 07DEC8 0017DDC8 8468060C */  jal         GetNextParts__14CEditPartsInfoFi
/* 07DECC 0017DDCC 00000000 */   nop
/* 07DED0 0017DDD0 28864070 */  paddub      $16, $2, $0
/* 07DED4 0017DDD4 17000010 */  b           .L0017DE34
/* 07DED8 0017DDD8 00000000 */   nop
.L0017DDDC:
/* 07DEDC 0017DDDC D201023C */  lui         $2, %hi(EditPartsInfo)
/* 07DEE0 0017DDE0 F09B4424 */  addiu       $4, $2, %lo(EditPartsInfo)
/* 07DEE4 0017DDE4 282E0072 */  paddub      $5, $16, $0
/* 07DEE8 0017DDE8 F467060C */  jal         GetPartsInfo__14CEditPartsInfoFi
/* 07DEEC 0017DDEC 00000000 */   nop
/* 07DEF0 0017DDF0 C0181000 */  sll         $3, $16, 3
/* 07DEF4 0017DDF4 23207000 */  subu        $4, $3, $16
/* 07DEF8 0017DDF8 80180400 */  sll         $3, $4, 2
/* 07DEFC 0017DDFC 23186400 */  subu        $3, $3, $4
/* 07DF00 0017DE00 40210300 */  sll         $4, $3, 5
/* 07DF04 0017DE04 F090838F */  lw          $3, -0x6F10($28)
/* 07DF08 0017DE08 21206400 */  addu        $4, $3, $4
/* 07DF0C 0017DE0C 282E4070 */  paddub      $5, $2, $0
/* 07DF10 0017DE10 28360070 */  paddub      $6, $0, $0
/* 07DF14 0017DE14 2814060C */  jal         EdPartsObjectOnOff__FP9CMapPartsP14EDITPARTS_INFOi
/* 07DF18 0017DE18 00000000 */   nop
/* 07DF1C 0017DE1C D201023C */  lui         $2, %hi(EditPartsInfo)
/* 07DF20 0017DE20 F09B4424 */  addiu       $4, $2, %lo(EditPartsInfo)
/* 07DF24 0017DE24 282E0072 */  paddub      $5, $16, $0
/* 07DF28 0017DE28 8468060C */  jal         GetNextParts__14CEditPartsInfoFi
/* 07DF2C 0017DE2C 00000000 */   nop
/* 07DF30 0017DE30 28864070 */  paddub      $16, $2, $0
.L0017DE34:
/* 07DF34 0017DE34 E9FF0106 */  bgez        $16, .L0017DDDC
/* 07DF38 0017DE38 00000000 */   nop
/* 07DF3C 0017DE3C E890848F */  lw          $4, -0x6F18($28)
/* 07DF40 0017DE40 F897060C */  jal         RequestCheck__11CEditGroundFv
/* 07DF44 0017DE44 00000000 */   nop
/* 07DF48 0017DE48 1000BF7B */  lq          $31, 0x10($29)
/* 07DF4C 0017DE4C 0000B07B */  lq          $16, 0x0($29)
/* 07DF50 0017DE50 2000BD27 */  addiu       $29, $29, 0x20
/* 07DF54 0017DE54 0800E003 */  jr          $31
/* 07DF58 0017DE58 00000000 */   nop
/* 07DF5C 0017DE5C 00000000 */  nop
