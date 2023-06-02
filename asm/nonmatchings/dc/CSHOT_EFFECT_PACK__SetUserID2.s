.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetUserID2__17CSHOT_EFFECT_PACKFi
/* AE6C0 001AE5C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* AE6C4 001AE5C4 0000BF7F */  sq         $31, 0x0($sp)
/* AE6C8 001AE5C8 0300013C */  lui        $at, (0x326E0 >> 16)
/* AE6CC 001AE5CC 21088100 */  addu       $at, $4, $at
/* AE6D0 001AE5D0 E026268C */  lw         $6, (0x326E0 & 0xFFFF)($at)
/* AE6D4 001AE5D4 FFFF0324 */  addiu      $3, $0, -0x1
/* AE6D8 001AE5D8 0600C310 */  beq        $6, $3, .L001AE5F4
/* AE6DC 001AE5DC 00000000 */   nop
/* AE6E0 001AE5E0 60A10234 */  ori        $2, $0, 0xA160
/* AE6E4 001AE5E4 1810C200 */  mult       $2, $6, $2
/* AE6E8 001AE5E8 21208200 */  addu       $4, $4, $2
/* AE6EC 001AE5EC 00B9060C */  jal        SetUserID2__12CSHOT_EFFECTFi
/* AE6F0 001AE5F0 00000000 */   nop
.L001AE5F4:
/* AE6F4 001AE5F4 0000BF7B */  lq         $31, 0x0($sp)
/* AE6F8 001AE5F8 1000BD27 */  addiu      $sp, $sp, 0x10
/* AE6FC 001AE5FC 0800E003 */  jr         $31
/* AE700 001AE600 00000000 */   nop
/* AE704 001AE604 00000000 */  nop
/* AE708 001AE608 00000000 */  nop
/* AE70C 001AE60C 00000000 */  nop
