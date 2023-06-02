.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DistTrapCircle__11CDungeonMapFv
/* C7E80 001C7D80 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* C7E84 001C7D84 4000BF7F */  sq         $31, 0x40($sp)
/* C7E88 001C7D88 3000B37F */  sq         $19, 0x30($sp)
/* C7E8C 001C7D8C 2000B27F */  sq         $18, 0x20($sp)
/* C7E90 001C7D90 1000B17F */  sq         $17, 0x10($sp)
/* C7E94 001C7D94 0000B07F */  sq         $16, 0x0($sp)
/* C7E98 001C7D98 28968070 */  paddub     $18, $4, $0
/* C7E9C 001C7D9C 5000A427 */  addiu      $4, $sp, 0x50
/* C7EA0 001C7DA0 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* C7EA4 001C7DA4 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* C7EA8 001C7DA8 0C86040C */  jal        sceVu0CopyVector
/* C7EAC 001C7DAC 00000000 */   nop
/* C7EB0 001C7DB0 28860070 */  paddub     $16, $0, $0
/* C7EB4 001C7DB4 1E000010 */  b          .L001C7E30
/* C7EB8 001C7DB8 00000000 */   nop
.L001C7DBC:
/* C7EBC 001C7DBC 40111000 */  sll        $2, $16, 5
/* C7EC0 001C7DC0 21205200 */  addu       $4, $2, $18
/* C7EC4 001C7DC4 0100013C */  lui        $at, (0x10AC0 >> 16)
/* C7EC8 001C7DC8 C00A2134 */  ori        $at, $at, (0x10AC0 & 0xFFFF)
/* C7ECC 001C7DCC 21888100 */  addu       $17, $4, $at
/* C7ED0 001C7DD0 0000238E */  lw         $3, 0x0($17)
/* C7ED4 001C7DD4 01000224 */  addiu      $2, $0, 0x1
/* C7ED8 001C7DD8 14006214 */  bne        $3, $2, .L001C7E2C
/* C7EDC 001C7DDC 00000000 */   nop
/* C7EE0 001C7DE0 0100013C */  lui        $at, (0x10AB0 >> 16)
/* C7EE4 001C7DE4 B00A2134 */  ori        $at, $at, (0x10AB0 & 0xFFFF)
/* C7EE8 001C7DE8 21988100 */  addu       $19, $4, $at
/* C7EEC 001C7DEC 28266072 */  paddub     $4, $19, $0
/* C7EF0 001C7DF0 5000A527 */  addiu      $5, $sp, 0x50
/* C7EF4 001C7DF4 648D040C */  jal        DistVector__FPfPf
/* C7EF8 001C7DF8 00000000 */   nop
/* C7EFC 001C7DFC A040023C */  lui        $2, (0x40A00000 >> 16)
/* C7F00 001C7E00 00088244 */  mtc1       $2, $f1
/* C7F04 001C7E04 00000000 */  nop
/* C7F08 001C7E08 36000146 */  c.le.s     $f0, $f1
/* C7F0C 001C7E0C 00000000 */  nop
/* C7F10 001C7E10 06000045 */  bc1f       .L001C7E2C
/* C7F14 001C7E14 00000000 */   nop
/* C7F18 001C7E18 02000224 */  addiu      $2, $0, 0x2
/* C7F1C 001C7E1C 000022AE */  sw         $2, 0x0($17)
/* C7F20 001C7E20 28166072 */  paddub     $2, $19, $0
/* C7F24 001C7E24 06000010 */  b          .L001C7E40
/* C7F28 001C7E28 00000000 */   nop
.L001C7E2C:
/* C7F2C 001C7E2C 01001026 */  addiu      $16, $16, 0x1
.L001C7E30:
/* C7F30 001C7E30 0300022A */  slti       $2, $16, 0x3
/* C7F34 001C7E34 E1FF4014 */  bnez       $2, .L001C7DBC
/* C7F38 001C7E38 00000000 */   nop
/* C7F3C 001C7E3C 28160070 */  paddub     $2, $0, $0
.L001C7E40:
/* C7F40 001C7E40 4000BF7B */  lq         $31, 0x40($sp)
/* C7F44 001C7E44 3000B37B */  lq         $19, 0x30($sp)
/* C7F48 001C7E48 2000B27B */  lq         $18, 0x20($sp)
/* C7F4C 001C7E4C 1000B17B */  lq         $17, 0x10($sp)
/* C7F50 001C7E50 0000B07B */  lq         $16, 0x0($sp)
/* C7F54 001C7E54 6000BD27 */  addiu      $sp, $sp, 0x60
/* C7F58 001C7E58 0800E003 */  jr         $31
/* C7F5C 001C7E5C 00000000 */   nop
