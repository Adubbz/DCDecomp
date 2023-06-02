.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetViewMatrix_sub__FPA4_fff
/* 2DE60 0012DD60 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 2DE64 0012DD64 5000BF7F */  sq         $31, 0x50($sp)
/* 2DE68 0012DD68 4000B37F */  sq         $19, 0x40($sp)
/* 2DE6C 0012DD6C 3000B27F */  sq         $18, 0x30($sp)
/* 2DE70 0012DD70 2000B17F */  sq         $17, 0x20($sp)
/* 2DE74 0012DD74 1000B07F */  sq         $16, 0x10($sp)
/* 2DE78 0012DD78 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 2DE7C 0012DD7C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 2DE80 0012DD80 28868070 */  paddub     $16, $4, $0
/* 2DE84 0012DD84 46650046 */  mov.s      $f21, $f12
/* 2DE88 0012DD88 066D0046 */  mov.s      $f20, $f13
/* 2DE8C 0012DD8C C701023C */  lui        $2, %hi(D_1C755B0)
/* 2DE90 0012DD90 B0554424 */  addiu      $4, $2, %lo(D_1C755B0)
/* 2DE94 0012DD94 282E0072 */  paddub     $5, $16, $0
/* 2DE98 0012DD98 1086040C */  jal        sceVu0CopyMatrix
/* 2DE9C 0012DD9C 00000000 */   nop
/* 2DEA0 0012DDA0 300000C6 */  lwc1       $f0, 0x30($16)
/* 2DEA4 0012DDA4 C701013C */  lui        $at, (0x1C75700 >> 16)
/* 2DEA8 0012DDA8 005720E4 */  swc1       $f0, (0x1C75700 & 0xFFFF)($at)
/* 2DEAC 0012DDAC 340000C6 */  lwc1       $f0, 0x34($16)
/* 2DEB0 0012DDB0 C701013C */  lui        $at, (0x1C75704 >> 16)
/* 2DEB4 0012DDB4 045720E4 */  swc1       $f0, (0x1C75704 & 0xFFFF)($at)
/* 2DEB8 0012DDB8 380000C6 */  lwc1       $f0, 0x38($16)
/* 2DEBC 0012DDBC C701013C */  lui        $at, (0x1C75708 >> 16)
/* 2DEC0 0012DDC0 085720E4 */  swc1       $f0, (0x1C75708 & 0xFFFF)($at)
/* 2DEC4 0012DDC4 C701013C */  lui        $at, (0x1C7570C >> 16)
/* 2DEC8 0012DDC8 0C5720AC */  sw         $0, (0x1C7570C & 0xFFFF)($at)
/* 2DECC 0012DDCC 6000A427 */  addiu      $4, $sp, 0x60
/* 2DED0 0012DDD0 2A86040C */  jal        sceVu0UnitMatrix
/* 2DED4 0012DDD4 00000000 */   nop
/* 2DED8 0012DDD8 6000B5E7 */  swc1       $f21, 0x60($sp)
/* 2DEDC 0012DDDC 7400B4E7 */  swc1       $f20, 0x74($sp)
/* 2DEE0 0012DDE0 C701023C */  lui        $2, %hi(D_1C75530)
/* 2DEE4 0012DDE4 30554424 */  addiu      $4, $2, %lo(D_1C75530)
/* 2DEE8 0012DDE8 6000A527 */  addiu      $5, $sp, 0x60
/* 2DEEC 0012DDEC 28360072 */  paddub     $6, $16, $0
/* 2DEF0 0012DDF0 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 2DEF4 0012DDF4 00000000 */   nop
/* 2DEF8 0012DDF8 A000A427 */  addiu      $4, $sp, 0xA0
/* 2DEFC 0012DDFC 2A86040C */  jal        sceVu0UnitMatrix
/* 2DF00 0012DE00 00000000 */   nop
/* 2DF04 0012DE04 C701013C */  lui        $at, (0x1C756C0 >> 16)
/* 2DF08 0012DE08 C05620C4 */  lwc1       $f0, (0x1C756C0 & 0xFFFF)($at)
/* 2DF0C 0012DE0C B400A0E7 */  swc1       $f0, 0xB4($sp)
/* 2DF10 0012DE10 A000A0E7 */  swc1       $f0, 0xA0($sp)
/* 2DF14 0012DE14 C701013C */  lui        $at, (0x1C756D8 >> 16)
/* 2DF18 0012DE18 D85620C4 */  lwc1       $f0, (0x1C756D8 & 0xFFFF)($at)
/* 2DF1C 0012DE1C C800A0E7 */  swc1       $f0, 0xC8($sp)
/* 2DF20 0012DE20 DC00A0AF */  sw         $0, 0xDC($sp)
/* 2DF24 0012DE24 0045023C */  lui        $2, (0x45000000 >> 16)
/* 2DF28 0012DE28 C400A2AF */  sw         $2, 0xC4($sp)
/* 2DF2C 0012DE2C C000A2AF */  sw         $2, 0xC0($sp)
/* 2DF30 0012DE30 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 2DF34 0012DE34 CC00A2AF */  sw         $2, 0xCC($sp)
/* 2DF38 0012DE38 C701013C */  lui        $at, (0x1C756C8 >> 16)
/* 2DF3C 0012DE3C C85620C4 */  lwc1       $f0, (0x1C756C8 & 0xFFFF)($at)
/* 2DF40 0012DE40 D800A0E7 */  swc1       $f0, 0xD8($sp)
/* 2DF44 0012DE44 C701023C */  lui        $2, %hi(D_1C755F0)
/* 2DF48 0012DE48 F0554424 */  addiu      $4, $2, %lo(D_1C755F0)
/* 2DF4C 0012DE4C A000A527 */  addiu      $5, $sp, 0xA0
/* 2DF50 0012DE50 C701023C */  lui        $2, %hi(D_1C75530)
/* 2DF54 0012DE54 30554624 */  addiu      $6, $2, %lo(D_1C75530)
/* 2DF58 0012DE58 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 2DF5C 0012DE5C 00000000 */   nop
/* 2DF60 0012DE60 C701023C */  lui        $2, %hi(D_1C75570)
/* 2DF64 0012DE64 70554424 */  addiu      $4, $2, %lo(D_1C75570)
/* 2DF68 0012DE68 A000A527 */  addiu      $5, $sp, 0xA0
/* 2DF6C 0012DE6C 1086040C */  jal        sceVu0CopyMatrix
/* 2DF70 0012DE70 00000000 */   nop
/* 2DF74 0012DE74 C701013C */  lui        $at, (0x1C755B8 >> 16)
/* 2DF78 0012DE78 B85520C4 */  lwc1       $f0, (0x1C755B8 & 0xFFFF)($at)
/* 2DF7C 0012DE7C 07000046 */  neg.s      $f0, $f0
/* 2DF80 0012DE80 E000A0E7 */  swc1       $f0, 0xE0($sp)
/* 2DF84 0012DE84 C701013C */  lui        $at, (0x1C755C8 >> 16)
/* 2DF88 0012DE88 C85520C4 */  lwc1       $f0, (0x1C755C8 & 0xFFFF)($at)
/* 2DF8C 0012DE8C 07000046 */  neg.s      $f0, $f0
/* 2DF90 0012DE90 E400B227 */  addiu      $18, $sp, 0xE4
/* 2DF94 0012DE94 000040E6 */  swc1       $f0, 0x0($18)
/* 2DF98 0012DE98 C701013C */  lui        $at, (0x1C755D8 >> 16)
/* 2DF9C 0012DE9C D85520C4 */  lwc1       $f0, (0x1C755D8 & 0xFFFF)($at)
/* 2DFA0 0012DEA0 07000046 */  neg.s      $f0, $f0
/* 2DFA4 0012DEA4 E800B027 */  addiu      $16, $sp, 0xE8
/* 2DFA8 0012DEA8 000000E6 */  swc1       $f0, 0x0($16)
/* 2DFAC 0012DEAC EC00B327 */  addiu      $19, $sp, 0xEC
/* 2DFB0 0012DEB0 000060AE */  sw         $0, 0x0($19)
/* 2DFB4 0012DEB4 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 2DFB8 0012DEB8 F000A0E7 */  swc1       $f0, 0xF0($sp)
/* 2DFBC 0012DEBC F400A0AF */  sw         $0, 0xF4($sp)
/* 2DFC0 0012DEC0 000000C6 */  lwc1       $f0, 0x0($16)
/* 2DFC4 0012DEC4 F800B127 */  addiu      $17, $sp, 0xF8
/* 2DFC8 0012DEC8 000020E6 */  swc1       $f0, 0x0($17)
/* 2DFCC 0012DECC FC00A0AF */  sw         $0, 0xFC($sp)
/* 2DFD0 0012DED0 F000A427 */  addiu      $4, $sp, 0xF0
/* 2DFD4 0012DED4 282E8070 */  paddub     $5, $4, $0
/* 2DFD8 0012DED8 9285040C */  jal        sceVu0Normalize
/* 2DFDC 0012DEDC 00000000 */   nop
/* 2DFE0 0012DEE0 F000ACC7 */  lwc1       $f12, 0xF0($sp)
/* 2DFE4 0012DEE4 00002DC6 */  lwc1       $f13, 0x0($17)
/* 2DFE8 0012DEE8 5077040C */  jal        atan2f
/* 2DFEC 0012DEEC 00000000 */   nop
/* 2DFF0 0012DEF0 C701013C */  lui        $at, (0x1C75724 >> 16)
/* 2DFF4 0012DEF4 245720E4 */  swc1       $f0, (0x1C75724 & 0xFFFF)($at)
/* 2DFF8 0012DEF8 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 2DFFC 0012DEFC 1A000046 */  mula.s     $f0, $f0
/* 2E000 0012DF00 000000C6 */  lwc1       $f0, 0x0($16)
/* 2E004 0012DF04 1C030046 */  madd.s     $f12, $f0, $f0
/* 2E008 0012DF08 9A77040C */  jal        sqrtf
/* 2E00C 0012DF0C 00000000 */   nop
/* 2E010 0012DF10 00004CC6 */  lwc1       $f12, 0x0($18)
/* 2E014 0012DF14 46030046 */  mov.s      $f13, $f0
/* 2E018 0012DF18 5077040C */  jal        atan2f
/* 2E01C 0012DF1C 00000000 */   nop
/* 2E020 0012DF20 07000046 */  neg.s      $f0, $f0
/* 2E024 0012DF24 C701013C */  lui        $at, (0x1C75720 >> 16)
/* 2E028 0012DF28 205720E4 */  swc1       $f0, (0x1C75720 & 0xFFFF)($at)
/* 2E02C 0012DF2C 000060AE */  sw         $0, 0x0($19)
/* 2E030 0012DF30 E000A427 */  addiu      $4, $sp, 0xE0
/* 2E034 0012DF34 282E8070 */  paddub     $5, $4, $0
/* 2E038 0012DF38 9285040C */  jal        sceVu0Normalize
/* 2E03C 0012DF3C 00000000 */   nop
/* 2E040 0012DF40 5000BF7B */  lq         $31, 0x50($sp)
/* 2E044 0012DF44 4000B37B */  lq         $19, 0x40($sp)
/* 2E048 0012DF48 3000B27B */  lq         $18, 0x30($sp)
/* 2E04C 0012DF4C 2000B17B */  lq         $17, 0x20($sp)
/* 2E050 0012DF50 1000B07B */  lq         $16, 0x10($sp)
/* 2E054 0012DF54 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 2E058 0012DF58 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 2E05C 0012DF5C 0001BD27 */  addiu      $sp, $sp, 0x100
/* 2E060 0012DF60 0800E003 */  jr         $31
/* 2E064 0012DF64 00000000 */   nop
/* 2E068 0012DF68 00000000 */  nop
/* 2E06C 0012DF6C 00000000 */  nop
