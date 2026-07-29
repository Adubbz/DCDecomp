.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitEyeCamera__FP10CCharacter
/* 069E90 00169D90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 069E94 00169D94 0000BF7F */  sq          $31, 0x0($29)
/* 069E98 00169D98 A000998C */  lw          $25, 0xA0($4)
/* 069E9C 00169D9C 7800398F */  lw          $25, 0x78($25)
/* 069EA0 00169DA0 09F82003 */  jalr        $25
/* 069EA4 00169DA4 00000000 */   nop
/* 069EA8 00169DA8 040040C4 */  lwc1        $f0, 0x4($2)
/* 069EAC 00169DAC 008F80E7 */  swc1        $f0, -0x7100($28)
/* 069EB0 00169DB0 048F80AF */  sw          $0, -0x70FC($28)
/* 069EB4 00169DB4 0000BF7B */  lq          $31, 0x0($29)
/* 069EB8 00169DB8 1000BD27 */  addiu       $29, $29, 0x10
/* 069EBC 00169DBC 0800E003 */  jr          $31
/* 069EC0 00169DC0 00000000 */   nop
/* 069EC4 00169DC4 00000000 */  nop
/* 069EC8 00169DC8 00000000 */  nop
/* 069ECC 00169DCC 00000000 */  nop
