.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RetCTex__FsRiRi
/* 12DE90 0022DD90 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12DE94 0022DD94 3000BF7F */  sq         $31, 0x30($sp)
/* 12DE98 0022DD98 2000B27F */  sq         $18, 0x20($sp)
/* 12DE9C 0022DD9C 1000B17F */  sq         $17, 0x10($sp)
/* 12DEA0 0022DDA0 0000B07F */  sq         $16, 0x0($sp)
/* 12DEA4 0022DDA4 2896A070 */  paddub     $18, $5, $0
/* 12DEA8 0022DDA8 288EC070 */  paddub     $17, $6, $0
/* 12DEAC 0022DDAC 3C240400 */  dsll32     $4, $4, 16
/* 12DEB0 0022DDB0 3F240400 */  dsra32     $4, $4, 16
/* 12DEB4 0022DDB4 7443070C */  jal        GetCommonItemInfo__Fi
/* 12DEB8 0022DDB8 00000000 */   nop
/* 12DEBC 0022DDBC 04004014 */  bnez       $2, .L0022DDD0
/* 12DEC0 0022DDC0 00000000 */   nop
/* 12DEC4 0022DDC4 28160070 */  paddub     $2, $0, $0
/* 12DEC8 0022DDC8 24000010 */  b          .L0022DE5C
/* 12DECC 0022DDCC 00000000 */   nop
.L0022DDD0:
/* 12DED0 0022DDD0 04004584 */  lh         $5, 0x4($2)
/* 12DED4 0022DDD4 0400A104 */  bgez       $5, .L0022DDE8
/* 12DED8 0022DDD8 00000000 */   nop
/* 12DEDC 0022DDDC 28160070 */  paddub     $2, $0, $0
/* 12DEE0 0022DDE0 1E000010 */  b          .L0022DE5C
/* 12DEE4 0022DDE4 00000000 */   nop
.L0022DDE8:
/* 12DEE8 0022DDE8 0800A424 */  addiu      $4, $5, 0x8
/* 12DEEC 0022DDEC 07008330 */  andi       $3, $4, 0x7
/* 12DEF0 0022DDF0 04008104 */  bgez       $4, .L0022DE04
/* 12DEF4 0022DDF4 00000000 */   nop
/* 12DEF8 0022DDF8 02006010 */  beqz       $3, .L0022DE04
/* 12DEFC 0022DDFC 00000000 */   nop
/* 12DF00 0022DE00 F8FF6324 */  addiu      $3, $3, -0x8
.L0022DE04:
/* 12DF04 0022DE04 40190300 */  sll        $3, $3, 5
/* 12DF08 0022DE08 000043AE */  sw         $3, 0x0($18)
/* 12DF0C 0022DE0C C3180500 */  sra        $3, $5, 3
/* 12DF10 0022DE10 40190300 */  sll        $3, $3, 5
/* 12DF14 0022DE14 000023AE */  sw         $3, 0x0($17)
/* 12DF18 0022DE18 00004380 */  lb         $3, 0x0($2)
/* 12DF1C 0022DE1C 02000224 */  addiu      $2, $0, 0x2
/* 12DF20 0022DE20 0B006210 */  beq        $3, $2, .L0022DE50
/* 12DF24 0022DE24 00000000 */   nop
/* 12DF28 0022DE28 09006010 */  beqz       $3, .L0022DE50
/* 12DF2C 0022DE2C 00000000 */   nop
/* 12DF30 0022DE30 01000224 */  addiu      $2, $0, 0x1
/* 12DF34 0022DE34 03006210 */  beq        $3, $2, .L0022DE44
/* 12DF38 0022DE38 00000000 */   nop
/* 12DF3C 0022DE3C 06000010 */  b          .L0022DE58
/* 12DF40 0022DE40 00000000 */   nop
.L0022DE44:
/* 12DF44 0022DE44 A896908F */  lw         $16, -0x6958($gp)
/* 12DF48 0022DE48 03000010 */  b          .L0022DE58
/* 12DF4C 0022DE4C 00000000 */   nop
.L0022DE50:
/* 12DF50 0022DE50 B096908F */  lw         $16, -0x6950($gp)
/* 12DF54 0022DE54 00000000 */  nop
.L0022DE58:
/* 12DF58 0022DE58 28160072 */  paddub     $2, $16, $0
.L0022DE5C:
/* 12DF5C 0022DE5C 3000BF7B */  lq         $31, 0x30($sp)
/* 12DF60 0022DE60 2000B27B */  lq         $18, 0x20($sp)
/* 12DF64 0022DE64 1000B17B */  lq         $17, 0x10($sp)
/* 12DF68 0022DE68 0000B07B */  lq         $16, 0x0($sp)
/* 12DF6C 0022DE6C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12DF70 0022DE70 0800E003 */  jr         $31
/* 12DF74 0022DE74 00000000 */   nop
/* 12DF78 0022DE78 00000000 */  nop
/* 12DF7C 0022DE7C 00000000 */  nop
