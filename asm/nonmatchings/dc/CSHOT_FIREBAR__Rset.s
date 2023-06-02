.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Rset__13CSHOT_FIREBARFv
/* AF060 001AEF60 28360070 */  paddub     $6, $0, $0
/* AF064 001AEF64 06000010 */  b          .L001AEF80
/* AF068 001AEF68 00000000 */   nop
.L001AEF6C:
/* AF06C 001AEF6C FFFF0524 */  addiu      $5, $0, -0x1
/* AF070 001AEF70 80180600 */  sll        $3, $6, 2
/* AF074 001AEF74 21186400 */  addu       $3, $3, $4
/* AF078 001AEF78 000C65AC */  sw         $5, 0xC00($3)
/* AF07C 001AEF7C 0100C624 */  addiu      $6, $6, 0x1
.L001AEF80:
/* AF080 001AEF80 1800C328 */  slti       $3, $6, 0x18
/* AF084 001AEF84 F9FF6014 */  bnez       $3, .L001AEF6C
/* AF088 001AEF88 00000000 */   nop
/* AF08C 001AEF8C 0800E003 */  jr         $31
/* AF090 001AEF90 00000000 */   nop
/* AF094 001AEF94 00000000 */  nop
/* AF098 001AEF98 00000000 */  nop
/* AF09C 001AEF9C 00000000 */  nop
