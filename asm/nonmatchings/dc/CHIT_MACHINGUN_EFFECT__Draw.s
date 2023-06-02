.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__21CHIT_MACHINGUN_EFFECTFv
/* AEB20 001AEA20 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* AEB24 001AEA24 2000BF7F */  sq         $31, 0x20($sp)
/* AEB28 001AEA28 1000B17F */  sq         $17, 0x10($sp)
/* AEB2C 001AEA2C 0000B07F */  sq         $16, 0x0($sp)
/* AEB30 001AEA30 288E8070 */  paddub     $17, $4, $0
/* AEB34 001AEA34 28860070 */  paddub     $16, $0, $0
/* AEB38 001AEA38 1C000010 */  b          .L001AEAAC
/* AEB3C 001AEA3C 00000000 */   nop
.L001AEA40:
/* AEB40 001AEA40 80181000 */  sll        $3, $16, 2
/* AEB44 001AEA44 21187100 */  addu       $3, $3, $17
/* AEB48 001AEA48 0001638C */  lw         $3, 0x100($3)
/* AEB4C 001AEA4C 16006004 */  bltz       $3, .L001AEAA8
/* AEB50 001AEA50 00000000 */   nop
/* AEB54 001AEA54 06000224 */  addiu      $2, $0, 0x6
/* AEB58 001AEA58 1A006200 */  div        $0, $3, $2
/* AEB5C 001AEA5C 02004014 */  bnez       $2, .L001AEA68
/* AEB60 001AEA60 00000000 */   nop
/* AEB64 001AEA64 CD010000 */  break      0, 7
.L001AEA68:
/* AEB68 001AEA68 12180000 */  mflo       $3
/* AEB6C 001AEA6C 02000224 */  addiu      $2, $0, 0x2
/* AEB70 001AEA70 23184300 */  subu       $3, $2, $3
/* AEB74 001AEA74 00111000 */  sll        $2, $16, 4
/* AEB78 001AEA78 21202202 */  addu       $4, $17, $2
/* AEB7C 001AEA7C A040023C */  lui        $2, (0x40A00000 >> 16)
/* AEB80 001AEA80 00608244 */  mtc1       $2, $f12
/* AEB84 001AEA84 00310300 */  sll        $6, $3, 4
/* AEB88 001AEA88 2A00023C */  lui        $2, %hi(_1116)
/* AEB8C 001AEA8C 20B54524 */  addiu      $5, $2, %lo(_1116)
/* AEB90 001AEA90 70000724 */  addiu      $7, $0, 0x70
/* AEB94 001AEA94 10000824 */  addiu      $8, $0, 0x10
/* AEB98 001AEA98 284E0071 */  paddub     $9, $8, $0
/* AEB9C 001AEA9C 80000A24 */  addiu      $10, $0, 0x80
/* AEBA0 001AEAA0 C0AE060C */  jal        set3DCellModel__FPfPcfiiiiUc
/* AEBA4 001AEAA4 00000000 */   nop
.L001AEAA8:
/* AEBA8 001AEAA8 01001026 */  addiu      $16, $16, 0x1
.L001AEAAC:
/* AEBAC 001AEAAC 1000032A */  slti       $3, $16, 0x10
/* AEBB0 001AEAB0 E3FF6014 */  bnez       $3, .L001AEA40
/* AEBB4 001AEAB4 00000000 */   nop
/* AEBB8 001AEAB8 2000BF7B */  lq         $31, 0x20($sp)
/* AEBBC 001AEABC 1000B17B */  lq         $17, 0x10($sp)
/* AEBC0 001AEAC0 0000B07B */  lq         $16, 0x0($sp)
/* AEBC4 001AEAC4 3000BD27 */  addiu      $sp, $sp, 0x30
/* AEBC8 001AEAC8 0800E003 */  jr         $31
/* AEBCC 001AEACC 00000000 */   nop
