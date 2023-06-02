.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__12CSHOT_EFFECTFv
/* 43780 00143680 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 43784 00143684 1000BF7F */  sq         $31, 0x10($sp)
/* 43788 00143688 0000B07F */  sq         $16, 0x0($sp)
/* 4378C 0014368C 28868070 */  paddub     $16, $4, $0
/* 43790 00143690 10000426 */  addiu      $4, $16, 0x10
/* 43794 00143694 4C0D050C */  jal        __ct__10CCharacterFv
/* 43798 00143698 00000000 */   nop
/* 4379C 0014369C C0110426 */  addiu      $4, $16, 0x11C0
/* 437A0 001436A0 1400023C */  lui        $2, %hi(__ct__10CCharacterFv)
/* 437A4 001436A4 30354524 */  addiu      $5, $2, %lo(__ct__10CCharacterFv)
/* 437A8 001436A8 28360070 */  paddub     $6, $0, $0
/* 437AC 001436AC B0110724 */  addiu      $7, $0, 0x11B0
/* 437B0 001436B0 08000824 */  addiu      $8, $0, 0x8
/* 437B4 001436B4 B488040C */  jal        __construct_array
/* 437B8 001436B8 00000000 */   nop
/* 437BC 001436BC 28160072 */  paddub     $2, $16, $0
/* 437C0 001436C0 1000BF7B */  lq         $31, 0x10($sp)
/* 437C4 001436C4 0000B07B */  lq         $16, 0x0($sp)
/* 437C8 001436C8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 437CC 001436CC 0800E003 */  jr         $31
/* 437D0 001436D0 00000000 */   nop
/* 437D4 001436D4 00000000 */  nop
/* 437D8 001436D8 00000000 */  nop
/* 437DC 001436DC 00000000 */  nop
