.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetLoop__12CSHOT_EFFECTFi
/* 0ADE20 001ADD20 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ADE24 001ADD24 21088100 */  addu        $1, $4, $1
/* 0ADE28 001ADD28 50A1268C */  lw          $6, -0x5EB0($1)
/* 0ADE2C 001ADD2C FFFF0324 */  addiu       $3, $0, -0x1
/* 0ADE30 001ADD30 0600C310 */  beq         $6, $3, .L001ADD4C
/* 0ADE34 001ADD34 00000000 */   nop
/* 0ADE38 001ADD38 80180600 */  sll         $3, $6, 2
/* 0ADE3C 001ADD3C 21186400 */  addu        $3, $3, $4
/* 0ADE40 001ADD40 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ADE44 001ADD44 21086100 */  addu        $1, $3, $1
/* 0ADE48 001ADD48 B0A025AC */  sw          $5, -0x5F50($1)
.L001ADD4C:
/* 0ADE4C 001ADD4C 0800E003 */  jr          $31
/* 0ADE50 001ADD50 00000000 */   nop
/* 0ADE54 001ADD54 00000000 */  nop
/* 0ADE58 001ADD58 00000000 */  nop
/* 0ADE5C 001ADD5C 00000000 */  nop
