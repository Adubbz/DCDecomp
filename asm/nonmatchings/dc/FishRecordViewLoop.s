.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishRecordViewLoop__Fv
/* F3E60 001F3D60 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* F3E64 001F3D64 1000BF7F */  sq         $31, 0x10($sp)
/* F3E68 001F3D68 0000B07F */  sq         $16, 0x0($sp)
/* F3E6C 001F3D6C 78CC070C */  jal        FishRecordViewKey__Fv
/* F3E70 001F3D70 00000000 */   nop
/* F3E74 001F3D74 28864070 */  paddub     $16, $2, $0
/* F3E78 001F3D78 10CF070C */  jal        FishRecordViewDraw__Fv
/* F3E7C 001F3D7C 00000000 */   nop
/* F3E80 001F3D80 28160072 */  paddub     $2, $16, $0
/* F3E84 001F3D84 1000BF7B */  lq         $31, 0x10($sp)
/* F3E88 001F3D88 0000B07B */  lq         $16, 0x0($sp)
/* F3E8C 001F3D8C 2000BD27 */  addiu      $sp, $sp, 0x20
/* F3E90 001F3D90 0800E003 */  jr         $31
/* F3E94 001F3D94 00000000 */   nop
/* F3E98 001F3D98 00000000 */  nop
/* F3E9C 001F3D9C 00000000 */  nop
