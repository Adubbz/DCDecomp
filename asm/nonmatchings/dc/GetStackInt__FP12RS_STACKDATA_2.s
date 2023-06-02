.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStackInt__FP12RS_STACKDATA_2
/* BBA30 001BB930 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BBA34 001BB934 0000BF7F */  sq         $31, 0x0($sp)
/* BBA38 001BB938 0000838C */  lw         $3, 0x0($4)
/* BBA3C 001BB93C 01000224 */  addiu      $2, $0, 0x1
/* BBA40 001BB940 06006214 */  bne        $3, $2, .L001BB95C
/* BBA44 001BB944 00000000 */   nop
/* BBA48 001BB948 04008CC4 */  lwc1       $f12, 0x4($4)
/* BBA4C 001BB94C 2C44040C */  jal        fptosi
/* BBA50 001BB950 00000000 */   nop
/* BBA54 001BB954 03000010 */  b          .L001BB964
/* BBA58 001BB958 00000000 */   nop
.L001BB95C:
/* BBA5C 001BB95C 0400828C */  lw         $2, 0x4($4)
/* BBA60 001BB960 00000000 */  nop
.L001BB964:
/* BBA64 001BB964 0000BF7B */  lq         $31, 0x0($sp)
/* BBA68 001BB968 1000BD27 */  addiu      $sp, $sp, 0x10
/* BBA6C 001BB96C 0800E003 */  jr         $31
/* BBA70 001BB970 00000000 */   nop
/* BBA74 001BB974 00000000 */  nop
/* BBA78 001BB978 00000000 */  nop
/* BBA7C 001BB97C 00000000 */  nop
