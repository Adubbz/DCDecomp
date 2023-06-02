.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetLoop__12CSHOT_EFFECTFi
/* ADE20 001ADD20 0100013C */  lui        $at, (0x10000 >> 16)
/* ADE24 001ADD24 21088100 */  addu       $at, $4, $at
/* ADE28 001ADD28 50A1268C */  lw         $6, -0x5EB0($at)
/* ADE2C 001ADD2C FFFF0324 */  addiu      $3, $0, -0x1
/* ADE30 001ADD30 0600C310 */  beq        $6, $3, .L001ADD4C
/* ADE34 001ADD34 00000000 */   nop
/* ADE38 001ADD38 80180600 */  sll        $3, $6, 2
/* ADE3C 001ADD3C 21186400 */  addu       $3, $3, $4
/* ADE40 001ADD40 0100013C */  lui        $at, (0x10000 >> 16)
/* ADE44 001ADD44 21086100 */  addu       $at, $3, $at
/* ADE48 001ADD48 B0A025AC */  sw         $5, -0x5F50($at)
.L001ADD4C:
/* ADE4C 001ADD4C 0800E003 */  jr         $31
/* ADE50 001ADD50 00000000 */   nop
/* ADE54 001ADD54 00000000 */  nop
/* ADE58 001ADD58 00000000 */  nop
/* ADE5C 001ADD5C 00000000 */  nop
