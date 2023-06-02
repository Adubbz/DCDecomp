.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel is_true__F12RS_STACKDATA
/* 13D8B0 0023D7B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13D8B4 0023D7B4 0800A4FF */  sd         $4, 0x8($sp)
/* 13D8B8 0023D7B8 0C00A38F */  lw         $3, 0xC($sp)
/* 13D8BC 0023D7BC 0800A28F */  lw         $2, 0x8($sp)
/* 13D8C0 0023D7C0 26104000 */  xor        $2, $2, $0
/* 13D8C4 0023D7C4 0100422C */  sltiu      $2, $2, 0x1
/* 13D8C8 0023D7C8 03004010 */  beqz       $2, .L0023D7D8
/* 13D8CC 0023D7CC 00000000 */   nop
/* 13D8D0 0023D7D0 26106000 */  xor        $2, $3, $0
/* 13D8D4 0023D7D4 0100422C */  sltiu      $2, $2, 0x1
.L0023D7D8:
/* 13D8D8 0023D7D8 01004238 */  xori       $2, $2, 0x1
/* 13D8DC 0023D7DC FF004230 */  andi       $2, $2, 0xFF
/* 13D8E0 0023D7E0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13D8E4 0023D7E4 0800E003 */  jr         $31
/* 13D8E8 0023D7E8 00000000 */   nop
/* 13D8EC 0023D7EC 00000000 */  nop
