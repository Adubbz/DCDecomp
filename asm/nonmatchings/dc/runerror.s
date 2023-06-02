.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel runerror__FPCc
/* 13D7C0 0023D6C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13D7C4 0023D6C4 0000BF7F */  sq         $31, 0x0($sp)
/* 13D7C8 0023D6C8 28368070 */  paddub     $6, $4, $0
/* 13D7CC 0023D6CC 2500013C */  lui        $at, (0x250000 >> 16)
/* 13D7D0 0023D6D0 ECFD228C */  lw         $2, -0x214($at)
/* 13D7D4 0023D6D4 0C00448C */  lw         $4, 0xC($2)
/* 13D7D8 0023D6D8 2A00023C */  lui        $2, %hi(_15)
/* 13D7DC 0023D6DC 70F74524 */  addiu      $5, $2, %lo(_15)
/* 13D7E0 0023D6E0 EE06040C */  jal        fprintf
/* 13D7E4 0023D6E4 00000000 */   nop
/* 13D7E8 0023D6E8 FFFF0424 */  addiu      $4, $0, -0x1
/* 13D7EC 0023D6EC DC05040C */  jal        exit_2
/* 13D7F0 0023D6F0 00000000 */   nop
/* 13D7F4 0023D6F4 0000BF7B */  lq         $31, 0x0($sp)
/* 13D7F8 0023D6F8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13D7FC 0023D6FC 0800E003 */  jr         $31
/* 13D800 0023D700 00000000 */   nop
/* 13D804 0023D704 00000000 */  nop
/* 13D808 0023D708 00000000 */  nop
/* 13D80C 0023D70C 00000000 */  nop
