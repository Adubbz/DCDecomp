.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__21CHIT_MACHINGUN_EFFECTFv
/* 0AEB20 001AEA20 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0AEB24 001AEA24 2000BF7F */  sq          $31, 0x20($29)
/* 0AEB28 001AEA28 1000B17F */  sq          $17, 0x10($29)
/* 0AEB2C 001AEA2C 0000B07F */  sq          $16, 0x0($29)
/* 0AEB30 001AEA30 288E8070 */  paddub      $17, $4, $0
/* 0AEB34 001AEA34 28860070 */  paddub      $16, $0, $0
/* 0AEB38 001AEA38 1C000010 */  b           .L001AEAAC
/* 0AEB3C 001AEA3C 00000000 */   nop
.L001AEA40:
/* 0AEB40 001AEA40 80181000 */  sll         $3, $16, 2
/* 0AEB44 001AEA44 21187100 */  addu        $3, $3, $17
/* 0AEB48 001AEA48 0001638C */  lw          $3, 0x100($3)
/* 0AEB4C 001AEA4C 16006004 */  bltz        $3, .L001AEAA8
/* 0AEB50 001AEA50 00000000 */   nop
/* 0AEB54 001AEA54 06000224 */  addiu       $2, $0, 0x6
/* 0AEB58 001AEA58 1A006200 */  div         $0, $3, $2
/* 0AEB5C 001AEA5C 02004014 */  bnez        $2, .L001AEA68
/* 0AEB60 001AEA60 00000000 */   nop
/* 0AEB64 001AEA64 CD010000 */  break       0, 7
.L001AEA68:
/* 0AEB68 001AEA68 12180000 */  mflo        $3
/* 0AEB6C 001AEA6C 02000224 */  addiu       $2, $0, 0x2
/* 0AEB70 001AEA70 23184300 */  subu        $3, $2, $3
/* 0AEB74 001AEA74 00111000 */  sll         $2, $16, 4
/* 0AEB78 001AEA78 21202202 */  addu        $4, $17, $2
/* 0AEB7C 001AEA7C A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0AEB80 001AEA80 00608244 */  mtc1        $2, $f12
/* 0AEB84 001AEA84 00310300 */  sll         $6, $3, 4
/* 0AEB88 001AEA88 2A00023C */  lui         $2, %hi(LIT_1116)
/* 0AEB8C 001AEA8C 20B54524 */  addiu       $5, $2, %lo(LIT_1116)
/* 0AEB90 001AEA90 70000724 */  addiu       $7, $0, 0x70
/* 0AEB94 001AEA94 10000824 */  addiu       $8, $0, 0x10
/* 0AEB98 001AEA98 284E0071 */  paddub      $9, $8, $0
/* 0AEB9C 001AEA9C 80000A24 */  addiu       $10, $0, 0x80
/* 0AEBA0 001AEAA0 C0AE060C */  jal         set3DCellModel__FPfPcfiiiiUc
/* 0AEBA4 001AEAA4 00000000 */   nop
.L001AEAA8:
/* 0AEBA8 001AEAA8 01001026 */  addiu       $16, $16, 0x1
.L001AEAAC:
/* 0AEBAC 001AEAAC 1000032A */  slti        $3, $16, 0x10
/* 0AEBB0 001AEAB0 E3FF6014 */  bnez        $3, .L001AEA40
/* 0AEBB4 001AEAB4 00000000 */   nop
/* 0AEBB8 001AEAB8 2000BF7B */  lq          $31, 0x20($29)
/* 0AEBBC 001AEABC 1000B17B */  lq          $17, 0x10($29)
/* 0AEBC0 001AEAC0 0000B07B */  lq          $16, 0x0($29)
/* 0AEBC4 001AEAC4 3000BD27 */  addiu       $29, $29, 0x30
/* 0AEBC8 001AEAC8 0800E003 */  jr          $31
/* 0AEBCC 001AEACC 00000000 */   nop
