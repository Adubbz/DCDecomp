.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditPartsObjectOnOff__Fv
/* 7DEB0 0017DDB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7DEB4 0017DDB4 1000BF7F */  sq         $31, 0x10($sp)
/* 7DEB8 0017DDB8 0000B07F */  sq         $16, 0x0($sp)
/* 7DEBC 0017DDBC D201023C */  lui        $2, %hi(EditPartsInfo)
/* 7DEC0 0017DDC0 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 7DEC4 0017DDC4 FFFF0524 */  addiu      $5, $0, -0x1
/* 7DEC8 0017DDC8 8468060C */  jal        GetNextParts__14CEditPartsInfoFi
/* 7DECC 0017DDCC 00000000 */   nop
/* 7DED0 0017DDD0 28864070 */  paddub     $16, $2, $0
/* 7DED4 0017DDD4 17000010 */  b          .L0017DE34
/* 7DED8 0017DDD8 00000000 */   nop
.L0017DDDC:
/* 7DEDC 0017DDDC D201023C */  lui        $2, %hi(EditPartsInfo)
/* 7DEE0 0017DDE0 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 7DEE4 0017DDE4 282E0072 */  paddub     $5, $16, $0
/* 7DEE8 0017DDE8 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* 7DEEC 0017DDEC 00000000 */   nop
/* 7DEF0 0017DDF0 C0181000 */  sll        $3, $16, 3
/* 7DEF4 0017DDF4 23207000 */  subu       $4, $3, $16
/* 7DEF8 0017DDF8 80180400 */  sll        $3, $4, 2
/* 7DEFC 0017DDFC 23186400 */  subu       $3, $3, $4
/* 7DF00 0017DE00 40210300 */  sll        $4, $3, 5
/* 7DF04 0017DE04 F090838F */  lw         $3, -0x6F10($gp)
/* 7DF08 0017DE08 21206400 */  addu       $4, $3, $4
/* 7DF0C 0017DE0C 282E4070 */  paddub     $5, $2, $0
/* 7DF10 0017DE10 28360070 */  paddub     $6, $0, $0
/* 7DF14 0017DE14 2814060C */  jal        EdPartsObjectOnOff__FP9CMapPartsP14EDITPARTS_INFOi
/* 7DF18 0017DE18 00000000 */   nop
/* 7DF1C 0017DE1C D201023C */  lui        $2, %hi(EditPartsInfo)
/* 7DF20 0017DE20 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 7DF24 0017DE24 282E0072 */  paddub     $5, $16, $0
/* 7DF28 0017DE28 8468060C */  jal        GetNextParts__14CEditPartsInfoFi
/* 7DF2C 0017DE2C 00000000 */   nop
/* 7DF30 0017DE30 28864070 */  paddub     $16, $2, $0
.L0017DE34:
/* 7DF34 0017DE34 E9FF0106 */  bgez       $16, .L0017DDDC
/* 7DF38 0017DE38 00000000 */   nop
/* 7DF3C 0017DE3C E890848F */  lw         $4, -0x6F18($gp)
/* 7DF40 0017DE40 F897060C */  jal        RequestCheck__11CEditGroundFv
/* 7DF44 0017DE44 00000000 */   nop
/* 7DF48 0017DE48 1000BF7B */  lq         $31, 0x10($sp)
/* 7DF4C 0017DE4C 0000B07B */  lq         $16, 0x0($sp)
/* 7DF50 0017DE50 2000BD27 */  addiu      $sp, $sp, 0x20
/* 7DF54 0017DE54 0800E003 */  jr         $31
/* 7DF58 0017DE58 00000000 */   nop
/* 7DF5C 0017DE5C 00000000 */  nop
