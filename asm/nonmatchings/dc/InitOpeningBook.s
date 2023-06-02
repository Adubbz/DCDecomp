.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitOpeningBook__FP1Pi
/* 13CF60 0023CE60 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 13CF64 0023CE64 2000BF7F */  sq         $31, 0x20($sp)
/* 13CF68 0023CE68 1000B17F */  sq         $17, 0x10($sp)
/* 13CF6C 0023CE6C 0000B07F */  sq         $16, 0x0($sp)
/* 13CF70 0023CE70 288EA070 */  paddub     $17, $5, $0
/* 13CF74 0023CE74 28868070 */  paddub     $16, $4, $0
/* 13CF78 0023CE78 03008014 */  bnez       $4, .L0023CE88
/* 13CF7C 0023CE7C 00000000 */   nop
/* 13CF80 0023CE80 948B908F */  lw         $16, -0x746C($gp)
/* 13CF84 0023CE84 00000000 */  nop
.L0023CE88:
/* 13CF88 0023CE88 28260072 */  paddub     $4, $16, $0
/* 13CF8C 0023CE8C 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 13CF90 0023CE90 00000000 */   nop
/* 13CF94 0023CE94 28864070 */  paddub     $16, $2, $0
/* 13CF98 0023CE98 30FB040C */  jal        StartReadBG__Fv
/* 13CF9C 0023CE9C 00000000 */   nop
/* 13CFA0 0023CEA0 2A00023C */  lui        $2, %hi(_1505)
/* 13CFA4 0023CEA4 C8F64424 */  addiu      $4, $2, %lo(_1505)
/* 13CFA8 0023CEA8 282E0072 */  paddub     $5, $16, $0
/* 13CFAC 0023CEAC ACAE080C */  jal        LoadFileBGMenuData__FPcP1
/* 13CFB0 0023CEB0 00000000 */   nop
/* 13CFB4 0023CEB4 00002386 */  lh         $3, 0x0($17)
/* 13CFB8 0023CEB8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13CFBC 0023CEBC 72BC23A4 */  sh         $3, -0x438E($at)
/* 13CFC0 0023CEC0 04002386 */  lh         $3, 0x4($17)
/* 13CFC4 0023CEC4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13CFC8 0023CEC8 74BC23A4 */  sh         $3, -0x438C($at)
/* 13CFCC 0023CECC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13CFD0 0023CED0 70BC20A4 */  sh         $0, -0x4390($at)
/* 13CFD4 0023CED4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13CFD8 0023CED8 78BC20A4 */  sh         $0, -0x4388($at)
/* 13CFDC 0023CEDC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13CFE0 0023CEE0 76BC20A4 */  sh         $0, -0x438A($at)
/* 13CFE4 0023CEE4 80000324 */  addiu      $3, $0, 0x80
/* 13CFE8 0023CEE8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13CFEC 0023CEEC 7ABC23A4 */  sh         $3, -0x4386($at)
/* 13CFF0 0023CEF0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13CFF4 0023CEF4 7CBC20A4 */  sh         $0, -0x4384($at)
/* 13CFF8 0023CEF8 2000BF7B */  lq         $31, 0x20($sp)
/* 13CFFC 0023CEFC 1000B17B */  lq         $17, 0x10($sp)
/* 13D000 0023CF00 0000B07B */  lq         $16, 0x0($sp)
/* 13D004 0023CF04 3000BD27 */  addiu      $sp, $sp, 0x30
/* 13D008 0023CF08 0800E003 */  jr         $31
/* 13D00C 0023CF0C 00000000 */   nop
