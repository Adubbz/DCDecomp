.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetUserID2__17CSHOT_EFFECT_PACKFi
/* 0AE6C0 001AE5C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0AE6C4 001AE5C4 0000BF7F */  sq          $31, 0x0($29)
/* 0AE6C8 001AE5C8 0300013C */  lui         $1, (0x326E0 >> 16)
/* 0AE6CC 001AE5CC 21088100 */  addu        $1, $4, $1
/* 0AE6D0 001AE5D0 E026268C */  lw          $6, (0x326E0 & 0xFFFF)($1)
/* 0AE6D4 001AE5D4 FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE6D8 001AE5D8 0600C310 */  beq         $6, $3, .L001AE5F4
/* 0AE6DC 001AE5DC 00000000 */   nop
/* 0AE6E0 001AE5E0 60A10234 */  ori         $2, $0, 0xA160
/* 0AE6E4 001AE5E4 1810C200 */  mult        $2, $6, $2
/* 0AE6E8 001AE5E8 21208200 */  addu        $4, $4, $2
/* 0AE6EC 001AE5EC 00B9060C */  jal         SetUserID2__12CSHOT_EFFECTFi
/* 0AE6F0 001AE5F0 00000000 */   nop
.L001AE5F4:
/* 0AE6F4 001AE5F4 0000BF7B */  lq          $31, 0x0($29)
/* 0AE6F8 001AE5F8 1000BD27 */  addiu       $29, $29, 0x10
/* 0AE6FC 001AE5FC 0800E003 */  jr          $31
/* 0AE700 001AE600 00000000 */   nop
/* 0AE704 001AE604 00000000 */  nop
/* 0AE708 001AE608 00000000 */  nop
/* 0AE70C 001AE60C 00000000 */  nop
