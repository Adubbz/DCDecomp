.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__21CHIT_MACHINGUN_EFFECTFv
/* AEBD0 001AEAD0 282E0070 */  paddub     $5, $0, $0
/* AEBD4 001AEAD4 0B000010 */  b          .L001AEB04
/* AEBD8 001AEAD8 00000000 */   nop
.L001AEADC:
/* AEBDC 001AEADC 80180500 */  sll        $3, $5, 2
/* AEBE0 001AEAE0 21186400 */  addu       $3, $3, $4
/* AEBE4 001AEAE4 00016624 */  addiu      $6, $3, 0x100
/* AEBE8 001AEAE8 0001638C */  lw         $3, 0x100($3)
/* AEBEC 001AEAEC 04006004 */  bltz       $3, .L001AEB00
/* AEBF0 001AEAF0 00000000 */   nop
/* AEBF4 001AEAF4 0000C38C */  lw         $3, 0x0($6)
/* AEBF8 001AEAF8 FFFF6324 */  addiu      $3, $3, -0x1
/* AEBFC 001AEAFC 0000C3AC */  sw         $3, 0x0($6)
.L001AEB00:
/* AEC00 001AEB00 0100A524 */  addiu      $5, $5, 0x1
.L001AEB04:
/* AEC04 001AEB04 1000A328 */  slti       $3, $5, 0x10
/* AEC08 001AEB08 F4FF6014 */  bnez       $3, .L001AEADC
/* AEC0C 001AEB0C 00000000 */   nop
/* AEC10 001AEB10 0800E003 */  jr         $31
/* AEC14 001AEB14 00000000 */   nop
/* AEC18 001AEB18 00000000 */  nop
/* AEC1C 001AEB1C 00000000 */  nop
