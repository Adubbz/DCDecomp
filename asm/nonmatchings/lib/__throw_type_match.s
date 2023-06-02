.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __throw_type_match
/* D6B8 0010D5B8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D6BC 0010D5BC 0000B0FF */  sd         $16, 0x0($sp)
/* D6C0 0010D5C0 1000BFFF */  sd         $31, 0x10($sp)
/* D6C4 0010D5C4 0815040C */  jal        strcmp
/* D6C8 0010D5C8 2D80C000 */   daddu     $16, $6, $0
/* D6CC 0010D5CC 0B800200 */  movn       $16, $0, $2
/* D6D0 0010D5D0 1000BFDF */  ld         $31, 0x10($sp)
/* D6D4 0010D5D4 2D100002 */  daddu      $2, $16, $0
/* D6D8 0010D5D8 0000B0DF */  ld         $16, 0x0($sp)
/* D6DC 0010D5DC 0800E003 */  jr         $31
/* D6E0 0010D5E0 2000BD27 */   addiu     $sp, $sp, 0x20
/* D6E4 0010D5E4 00000000 */  nop
