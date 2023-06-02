.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__12CGroundWaterFv
/* A5BE0 001A5AE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A5BE4 001A5AE4 1000BF7F */  sq         $31, 0x10($sp)
/* A5BE8 001A5AE8 0000B07F */  sq         $16, 0x0($sp)
/* A5BEC 001A5AEC 28868070 */  paddub     $16, $4, $0
/* A5BF0 001A5AF0 90000426 */  addiu      $4, $16, 0x90
/* A5BF4 001A5AF4 7085050C */  jal        __ct__6CWaterFv
/* A5BF8 001A5AF8 00000000 */   nop
/* A5BFC 001A5AFC 28160072 */  paddub     $2, $16, $0
/* A5C00 001A5B00 1000BF7B */  lq         $31, 0x10($sp)
/* A5C04 001A5B04 0000B07B */  lq         $16, 0x0($sp)
/* A5C08 001A5B08 2000BD27 */  addiu      $sp, $sp, 0x20
/* A5C0C 001A5B0C 0800E003 */  jr         $31
/* A5C10 001A5B10 00000000 */   nop
/* A5C14 001A5B14 00000000 */  nop
/* A5C18 001A5B18 00000000 */  nop
/* A5C1C 001A5B1C 00000000 */  nop
