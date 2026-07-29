.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetViewMatrix_sub__FPA4_fff
/* 02DE60 0012DD60 00FFBD27 */  addiu       $29, $29, -0x100
/* 02DE64 0012DD64 5000BF7F */  sq          $31, 0x50($29)
/* 02DE68 0012DD68 4000B37F */  sq          $19, 0x40($29)
/* 02DE6C 0012DD6C 3000B27F */  sq          $18, 0x30($29)
/* 02DE70 0012DD70 2000B17F */  sq          $17, 0x20($29)
/* 02DE74 0012DD74 1000B07F */  sq          $16, 0x10($29)
/* 02DE78 0012DD78 0400B5E7 */  swc1        $f21, 0x4($29)
/* 02DE7C 0012DD7C 0000B4E7 */  swc1        $f20, 0x0($29)
/* 02DE80 0012DD80 28868070 */  paddub      $16, $4, $0
/* 02DE84 0012DD84 46650046 */  mov.s       $f21, $f12
/* 02DE88 0012DD88 066D0046 */  mov.s       $f20, $f13
/* 02DE8C 0012DD8C C701023C */  lui         $2, %hi(mgRenderInfo + 0x90)
/* 02DE90 0012DD90 B0554424 */  addiu       $4, $2, %lo(mgRenderInfo + 0x90)
/* 02DE94 0012DD94 282E0072 */  paddub      $5, $16, $0
/* 02DE98 0012DD98 1086040C */  jal         sceVu0CopyMatrix
/* 02DE9C 0012DD9C 00000000 */   nop
/* 02DEA0 0012DDA0 300000C6 */  lwc1        $f0, 0x30($16)
/* 02DEA4 0012DDA4 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1E0)
/* 02DEA8 0012DDA8 005720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x1E0)($1)
/* 02DEAC 0012DDAC 340000C6 */  lwc1        $f0, 0x34($16)
/* 02DEB0 0012DDB0 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1E4)
/* 02DEB4 0012DDB4 045720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x1E4)($1)
/* 02DEB8 0012DDB8 380000C6 */  lwc1        $f0, 0x38($16)
/* 02DEBC 0012DDBC C701013C */  lui         $1, %hi(mgRenderInfo + 0x1E8)
/* 02DEC0 0012DDC0 085720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x1E8)($1)
/* 02DEC4 0012DDC4 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1EC)
/* 02DEC8 0012DDC8 0C5720AC */  sw          $0, %lo(mgRenderInfo + 0x1EC)($1)
/* 02DECC 0012DDCC 6000A427 */  addiu       $4, $29, 0x60
/* 02DED0 0012DDD0 2A86040C */  jal         sceVu0UnitMatrix
/* 02DED4 0012DDD4 00000000 */   nop
/* 02DED8 0012DDD8 6000B5E7 */  swc1        $f21, 0x60($29)
/* 02DEDC 0012DDDC 7400B4E7 */  swc1        $f20, 0x74($29)
/* 02DEE0 0012DDE0 C701023C */  lui         $2, %hi(mgRenderInfo + 0x10)
/* 02DEE4 0012DDE4 30554424 */  addiu       $4, $2, %lo(mgRenderInfo + 0x10)
/* 02DEE8 0012DDE8 6000A527 */  addiu       $5, $29, 0x60
/* 02DEEC 0012DDEC 28360072 */  paddub      $6, $16, $0
/* 02DEF0 0012DDF0 748D040C */  jal         MulMatrix__FPA4_fPA4_fPA4_f
/* 02DEF4 0012DDF4 00000000 */   nop
/* 02DEF8 0012DDF8 A000A427 */  addiu       $4, $29, 0xA0
/* 02DEFC 0012DDFC 2A86040C */  jal         sceVu0UnitMatrix
/* 02DF00 0012DE00 00000000 */   nop
/* 02DF04 0012DE04 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 02DF08 0012DE08 C05620C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x1A0)($1)
/* 02DF0C 0012DE0C B400A0E7 */  swc1        $f0, 0xB4($29)
/* 02DF10 0012DE10 A000A0E7 */  swc1        $f0, 0xA0($29)
/* 02DF14 0012DE14 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1B8)
/* 02DF18 0012DE18 D85620C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x1B8)($1)
/* 02DF1C 0012DE1C C800A0E7 */  swc1        $f0, 0xC8($29)
/* 02DF20 0012DE20 DC00A0AF */  sw          $0, 0xDC($29)
/* 02DF24 0012DE24 0045023C */  lui         $2, (0x45000000 >> 16)
/* 02DF28 0012DE28 C400A2AF */  sw          $2, 0xC4($29)
/* 02DF2C 0012DE2C C000A2AF */  sw          $2, 0xC0($29)
/* 02DF30 0012DE30 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02DF34 0012DE34 CC00A2AF */  sw          $2, 0xCC($29)
/* 02DF38 0012DE38 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A8)
/* 02DF3C 0012DE3C C85620C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x1A8)($1)
/* 02DF40 0012DE40 D800A0E7 */  swc1        $f0, 0xD8($29)
/* 02DF44 0012DE44 C701023C */  lui         $2, %hi(mgRenderInfo + 0xD0)
/* 02DF48 0012DE48 F0554424 */  addiu       $4, $2, %lo(mgRenderInfo + 0xD0)
/* 02DF4C 0012DE4C A000A527 */  addiu       $5, $29, 0xA0
/* 02DF50 0012DE50 C701023C */  lui         $2, %hi(mgRenderInfo + 0x10)
/* 02DF54 0012DE54 30554624 */  addiu       $6, $2, %lo(mgRenderInfo + 0x10)
/* 02DF58 0012DE58 748D040C */  jal         MulMatrix__FPA4_fPA4_fPA4_f
/* 02DF5C 0012DE5C 00000000 */   nop
/* 02DF60 0012DE60 C701023C */  lui         $2, %hi(mgRenderInfo + 0x50)
/* 02DF64 0012DE64 70554424 */  addiu       $4, $2, %lo(mgRenderInfo + 0x50)
/* 02DF68 0012DE68 A000A527 */  addiu       $5, $29, 0xA0
/* 02DF6C 0012DE6C 1086040C */  jal         sceVu0CopyMatrix
/* 02DF70 0012DE70 00000000 */   nop
/* 02DF74 0012DE74 C701013C */  lui         $1, %hi(mgRenderInfo + 0x98)
/* 02DF78 0012DE78 B85520C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x98)($1)
/* 02DF7C 0012DE7C 07000046 */  neg.s       $f0, $f0
/* 02DF80 0012DE80 E000A0E7 */  swc1        $f0, 0xE0($29)
/* 02DF84 0012DE84 C701013C */  lui         $1, %hi(mgRenderInfo + 0xA8)
/* 02DF88 0012DE88 C85520C4 */  lwc1        $f0, %lo(mgRenderInfo + 0xA8)($1)
/* 02DF8C 0012DE8C 07000046 */  neg.s       $f0, $f0
/* 02DF90 0012DE90 E400B227 */  addiu       $18, $29, 0xE4
/* 02DF94 0012DE94 000040E6 */  swc1        $f0, 0x0($18)
/* 02DF98 0012DE98 C701013C */  lui         $1, %hi(mgRenderInfo + 0xB8)
/* 02DF9C 0012DE9C D85520C4 */  lwc1        $f0, %lo(mgRenderInfo + 0xB8)($1)
/* 02DFA0 0012DEA0 07000046 */  neg.s       $f0, $f0
/* 02DFA4 0012DEA4 E800B027 */  addiu       $16, $29, 0xE8
/* 02DFA8 0012DEA8 000000E6 */  swc1        $f0, 0x0($16)
/* 02DFAC 0012DEAC EC00B327 */  addiu       $19, $29, 0xEC
/* 02DFB0 0012DEB0 000060AE */  sw          $0, 0x0($19)
/* 02DFB4 0012DEB4 E000A0C7 */  lwc1        $f0, 0xE0($29)
/* 02DFB8 0012DEB8 F000A0E7 */  swc1        $f0, 0xF0($29)
/* 02DFBC 0012DEBC F400A0AF */  sw          $0, 0xF4($29)
/* 02DFC0 0012DEC0 000000C6 */  lwc1        $f0, 0x0($16)
/* 02DFC4 0012DEC4 F800B127 */  addiu       $17, $29, 0xF8
/* 02DFC8 0012DEC8 000020E6 */  swc1        $f0, 0x0($17)
/* 02DFCC 0012DECC FC00A0AF */  sw          $0, 0xFC($29)
/* 02DFD0 0012DED0 F000A427 */  addiu       $4, $29, 0xF0
/* 02DFD4 0012DED4 282E8070 */  paddub      $5, $4, $0
/* 02DFD8 0012DED8 9285040C */  jal         sceVu0Normalize
/* 02DFDC 0012DEDC 00000000 */   nop
/* 02DFE0 0012DEE0 F000ACC7 */  lwc1        $f12, 0xF0($29)
/* 02DFE4 0012DEE4 00002DC6 */  lwc1        $f13, 0x0($17)
/* 02DFE8 0012DEE8 5077040C */  jal         atan2f
/* 02DFEC 0012DEEC 00000000 */   nop
/* 02DFF0 0012DEF0 C701013C */  lui         $1, %hi(mgRenderInfo + 0x204)
/* 02DFF4 0012DEF4 245720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x204)($1)
/* 02DFF8 0012DEF8 E000A0C7 */  lwc1        $f0, 0xE0($29)
/* 02DFFC 0012DEFC 1A000046 */  mula.s      $f0, $f0
/* 02E000 0012DF00 000000C6 */  lwc1        $f0, 0x0($16)
/* 02E004 0012DF04 1C030046 */  madd.s      $f12, $f0, $f0
/* 02E008 0012DF08 9A77040C */  jal         sqrtf
/* 02E00C 0012DF0C 00000000 */   nop
/* 02E010 0012DF10 00004CC6 */  lwc1        $f12, 0x0($18)
/* 02E014 0012DF14 46030046 */  mov.s       $f13, $f0
/* 02E018 0012DF18 5077040C */  jal         atan2f
/* 02E01C 0012DF1C 00000000 */   nop
/* 02E020 0012DF20 07000046 */  neg.s       $f0, $f0
/* 02E024 0012DF24 C701013C */  lui         $1, %hi(mgRenderInfo + 0x200)
/* 02E028 0012DF28 205720E4 */  swc1        $f0, %lo(mgRenderInfo + 0x200)($1)
/* 02E02C 0012DF2C 000060AE */  sw          $0, 0x0($19)
/* 02E030 0012DF30 E000A427 */  addiu       $4, $29, 0xE0
/* 02E034 0012DF34 282E8070 */  paddub      $5, $4, $0
/* 02E038 0012DF38 9285040C */  jal         sceVu0Normalize
/* 02E03C 0012DF3C 00000000 */   nop
/* 02E040 0012DF40 5000BF7B */  lq          $31, 0x50($29)
/* 02E044 0012DF44 4000B37B */  lq          $19, 0x40($29)
/* 02E048 0012DF48 3000B27B */  lq          $18, 0x30($29)
/* 02E04C 0012DF4C 2000B17B */  lq          $17, 0x20($29)
/* 02E050 0012DF50 1000B07B */  lq          $16, 0x10($29)
/* 02E054 0012DF54 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 02E058 0012DF58 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 02E05C 0012DF5C 0001BD27 */  addiu       $29, $29, 0x100
/* 02E060 0012DF60 0800E003 */  jr          $31
/* 02E064 0012DF64 00000000 */   nop
/* 02E068 0012DF68 00000000 */  nop
/* 02E06C 0012DF6C 00000000 */  nop
