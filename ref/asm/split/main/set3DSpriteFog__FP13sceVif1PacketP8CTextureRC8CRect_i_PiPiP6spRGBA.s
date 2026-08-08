.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel set3DSpriteFog__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiP6spRGBA
/* 05DDA0 0015DCA0 80FFBD27 */  addiu       $29, $29, -0x80
/* 05DDA4 0015DCA4 6000BF7F */  sq          $31, 0x60($29)
/* 05DDA8 0015DCA8 5000B57F */  sq          $21, 0x50($29)
/* 05DDAC 0015DCAC 4000B47F */  sq          $20, 0x40($29)
/* 05DDB0 0015DCB0 3000B37F */  sq          $19, 0x30($29)
/* 05DDB4 0015DCB4 2000B27F */  sq          $18, 0x20($29)
/* 05DDB8 0015DCB8 1000B17F */  sq          $17, 0x10($29)
/* 05DDBC 0015DCBC 0000B07F */  sq          $16, 0x0($29)
/* 05DDC0 0015DCC0 28AE8070 */  paddub      $21, $4, $0
/* 05DDC4 0015DCC4 28A6A070 */  paddub      $20, $5, $0
/* 05DDC8 0015DCC8 289EC070 */  paddub      $19, $6, $0
/* 05DDCC 0015DCCC 2896E070 */  paddub      $18, $7, $0
/* 05DDD0 0015DCD0 288E0071 */  paddub      $17, $8, $0
/* 05DDD4 0015DCD4 28862071 */  paddub      $16, $9, $0
/* 05DDD8 0015DCD8 71008012 */  beqz        $20, .L0015DEA0
/* 05DDDC 0015DCDC 00000000 */   nop
/* 05DDE0 0015DCE0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 05DDE4 0015DCE4 7C00A2AF */  sw          $2, 0x7C($29)
/* 05DDE8 0015DCE8 282E0070 */  paddub      $5, $0, $0
/* 05DDEC 0015DCEC 2083040C */  jal         sceVif1PkCnt
/* 05DDF0 0015DCF0 00000000 */   nop
/* 05DDF4 0015DCF4 2826A072 */  paddub      $4, $21, $0
/* 05DDF8 0015DCF8 282E0070 */  paddub      $5, $0, $0
/* 05DDFC 0015DCFC 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 05DE00 0015DD00 00000000 */   nop
/* 05DE04 0015DD04 C701023C */  lui         $2, %hi(GiftagAD)
/* 05DE08 0015DD08 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 05DE0C 0015DD0C 2826A072 */  paddub      $4, $21, $0
/* 05DE10 0015DD10 00004578 */  lq          $5, 0x0($2)
/* 05DE14 0015DD14 B083040C */  jal         sceVif1PkOpenGifTag
/* 05DE18 0015DD18 00000000 */   nop
/* 05DE1C 0015DD1C 2826A072 */  paddub      $4, $21, $0
/* 05DE20 0015DD20 14000524 */  addiu       $5, $0, 0x14
/* 05DE24 0015DD24 61000624 */  addiu       $6, $0, 0x61
/* 05DE28 0015DD28 0A84040C */  jal         sceVif1PkAddGsAD
/* 05DE2C 0015DD2C 00000000 */   nop
/* 05DE30 0015DD30 2826A072 */  paddub      $4, $21, $0
/* 05DE34 0015DD34 282E0070 */  paddub      $5, $0, $0
/* 05DE38 0015DD38 76010624 */  addiu       $6, $0, 0x176
/* 05DE3C 0015DD3C 0A84040C */  jal         sceVif1PkAddGsAD
/* 05DE40 0015DD40 00000000 */   nop
/* 05DE44 0015DD44 01000292 */  lbu         $2, 0x1($16)
/* 05DE48 0015DD48 381A0200 */  dsll        $3, $2, 8
/* 05DE4C 0015DD4C 00000292 */  lbu         $2, 0x0($16)
/* 05DE50 0015DD50 25184300 */  or          $3, $2, $3
/* 05DE54 0015DD54 02000292 */  lbu         $2, 0x2($16)
/* 05DE58 0015DD58 38140200 */  dsll        $2, $2, 16
/* 05DE5C 0015DD5C 25184300 */  or          $3, $2, $3
/* 05DE60 0015DD60 03000292 */  lbu         $2, 0x3($16)
/* 05DE64 0015DD64 38160200 */  dsll        $2, $2, 24
/* 05DE68 0015DD68 25184300 */  or          $3, $2, $3
/* 05DE6C 0015DD6C 7C00A227 */  addiu       $2, $29, 0x7C
/* 05DE70 0015DD70 0000429C */  lwu         $2, 0x0($2)
/* 05DE74 0015DD74 3C100200 */  dsll32      $2, $2, 0
/* 05DE78 0015DD78 25304300 */  or          $6, $2, $3
/* 05DE7C 0015DD7C 2826A072 */  paddub      $4, $21, $0
/* 05DE80 0015DD80 01000524 */  addiu       $5, $0, 0x1
/* 05DE84 0015DD84 0A84040C */  jal         sceVif1PkAddGsAD
/* 05DE88 0015DD88 00000000 */   nop
/* 05DE8C 0015DD8C 2826A072 */  paddub      $4, $21, $0
/* 05DE90 0015DD90 06000524 */  addiu       $5, $0, 0x6
/* 05DE94 0015DD94 280086DE */  ld          $6, 0x28($20)
/* 05DE98 0015DD98 0A84040C */  jal         sceVif1PkAddGsAD
/* 05DE9C 0015DD9C 00000000 */   nop
/* 05DEA0 0015DDA0 0400628E */  lw          $2, 0x4($19)
/* 05DEA4 0015DDA4 00110200 */  sll         $2, $2, 4
/* 05DEA8 0015DDA8 381C0200 */  dsll        $3, $2, 16
/* 05DEAC 0015DDAC 0000628E */  lw          $2, 0x0($19)
/* 05DEB0 0015DDB0 00110200 */  sll         $2, $2, 4
/* 05DEB4 0015DDB4 25304300 */  or          $6, $2, $3
/* 05DEB8 0015DDB8 2826A072 */  paddub      $4, $21, $0
/* 05DEBC 0015DDBC 03000524 */  addiu       $5, $0, 0x3
/* 05DEC0 0015DDC0 0A84040C */  jal         sceVif1PkAddGsAD
/* 05DEC4 0015DDC4 00000000 */   nop
/* 05DEC8 0015DDC8 0400428E */  lw          $2, 0x4($18)
/* 05DECC 0015DDCC 381C0200 */  dsll        $3, $2, 16
/* 05DED0 0015DDD0 0000428E */  lw          $2, 0x0($18)
/* 05DED4 0015DDD4 25184300 */  or          $3, $2, $3
/* 05DED8 0015DDD8 0800428E */  lw          $2, 0x8($18)
/* 05DEDC 0015DDDC 3C100200 */  dsll32      $2, $2, 0
/* 05DEE0 0015DDE0 25184300 */  or          $3, $2, $3
/* 05DEE4 0015DDE4 0C00428E */  lw          $2, 0xC($18)
/* 05DEE8 0015DDE8 3C160200 */  dsll32      $2, $2, 24
/* 05DEEC 0015DDEC 25304300 */  or          $6, $2, $3
/* 05DEF0 0015DDF0 2826A072 */  paddub      $4, $21, $0
/* 05DEF4 0015DDF4 04000524 */  addiu       $5, $0, 0x4
/* 05DEF8 0015DDF8 0A84040C */  jal         sceVif1PkAddGsAD
/* 05DEFC 0015DDFC 00000000 */   nop
/* 05DF00 0015DE00 0400638E */  lw          $3, 0x4($19)
/* 05DF04 0015DE04 0C00628E */  lw          $2, 0xC($19)
/* 05DF08 0015DE08 21106200 */  addu        $2, $3, $2
/* 05DF0C 0015DE0C 00110200 */  sll         $2, $2, 4
/* 05DF10 0015DE10 38240200 */  dsll        $4, $2, 16
/* 05DF14 0015DE14 0000638E */  lw          $3, 0x0($19)
/* 05DF18 0015DE18 0800628E */  lw          $2, 0x8($19)
/* 05DF1C 0015DE1C 21106200 */  addu        $2, $3, $2
/* 05DF20 0015DE20 00110200 */  sll         $2, $2, 4
/* 05DF24 0015DE24 25304400 */  or          $6, $2, $4
/* 05DF28 0015DE28 2826A072 */  paddub      $4, $21, $0
/* 05DF2C 0015DE2C 03000524 */  addiu       $5, $0, 0x3
/* 05DF30 0015DE30 0A84040C */  jal         sceVif1PkAddGsAD
/* 05DF34 0015DE34 00000000 */   nop
/* 05DF38 0015DE38 0400228E */  lw          $2, 0x4($17)
/* 05DF3C 0015DE3C 381C0200 */  dsll        $3, $2, 16
/* 05DF40 0015DE40 0000228E */  lw          $2, 0x0($17)
/* 05DF44 0015DE44 25184300 */  or          $3, $2, $3
/* 05DF48 0015DE48 0800228E */  lw          $2, 0x8($17)
/* 05DF4C 0015DE4C 3C100200 */  dsll32      $2, $2, 0
/* 05DF50 0015DE50 25184300 */  or          $3, $2, $3
/* 05DF54 0015DE54 0C00228E */  lw          $2, 0xC($17)
/* 05DF58 0015DE58 3C160200 */  dsll32      $2, $2, 24
/* 05DF5C 0015DE5C 25304300 */  or          $6, $2, $3
/* 05DF60 0015DE60 2826A072 */  paddub      $4, $21, $0
/* 05DF64 0015DE64 04000524 */  addiu       $5, $0, 0x4
/* 05DF68 0015DE68 0A84040C */  jal         sceVif1PkAddGsAD
/* 05DF6C 0015DE6C 00000000 */   nop
/* 05DF70 0015DE70 E88B8227 */  addiu       $2, $28, -0x7418
/* 05DF74 0015DE74 2826A072 */  paddub      $4, $21, $0
/* 05DF78 0015DE78 47000524 */  addiu       $5, $0, 0x47
/* 05DF7C 0015DE7C 000046DC */  ld          $6, 0x0($2)
/* 05DF80 0015DE80 0A84040C */  jal         sceVif1PkAddGsAD
/* 05DF84 0015DE84 00000000 */   nop
/* 05DF88 0015DE88 2826A072 */  paddub      $4, $21, $0
/* 05DF8C 0015DE8C B683040C */  jal         sceVif1PkCloseGifTag
/* 05DF90 0015DE90 00000000 */   nop
/* 05DF94 0015DE94 2826A072 */  paddub      $4, $21, $0
/* 05DF98 0015DE98 A483040C */  jal         sceVif1PkCloseDirectCode
/* 05DF9C 0015DE9C 00000000 */   nop
.L0015DEA0:
/* 05DFA0 0015DEA0 6000BF7B */  lq          $31, 0x60($29)
/* 05DFA4 0015DEA4 5000B57B */  lq          $21, 0x50($29)
/* 05DFA8 0015DEA8 4000B47B */  lq          $20, 0x40($29)
/* 05DFAC 0015DEAC 3000B37B */  lq          $19, 0x30($29)
/* 05DFB0 0015DEB0 2000B27B */  lq          $18, 0x20($29)
/* 05DFB4 0015DEB4 1000B17B */  lq          $17, 0x10($29)
/* 05DFB8 0015DEB8 0000B07B */  lq          $16, 0x0($29)
/* 05DFBC 0015DEBC 8000BD27 */  addiu       $29, $29, 0x80
/* 05DFC0 0015DEC0 0800E003 */  jr          $31
/* 05DFC4 0015DEC4 00000000 */   nop
/* 05DFC8 0015DEC8 00000000 */  nop
/* 05DFCC 0015DECC 00000000 */  nop
