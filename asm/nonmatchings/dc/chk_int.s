.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel chk_int__F12RS_STACKDATAP8funcdata
/* 13D840 0023D740 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 13D844 0023D744 0000BF7F */  sq         $31, 0x0($sp)
/* 13D848 0023D748 1800A4FF */  sd         $4, 0x18($sp)
/* 13D84C 0023D74C 2836A070 */  paddub     $6, $5, $0
/* 13D850 0023D750 1C00A28F */  lw         $2, 0x1C($sp)
/* 13D854 0023D754 1800A38F */  lw         $3, 0x18($sp)
/* 13D858 0023D758 03006014 */  bnez       $3, .L0023D768
/* 13D85C 0023D75C 00000000 */   nop
/* 13D860 0023D760 0D000010 */  b          .L0023D798
/* 13D864 0023D764 00000000 */   nop
.L0023D768:
/* 13D868 0023D768 2500013C */  lui        $at, (0x250000 >> 16)
/* 13D86C 0023D76C ECFD228C */  lw         $2, -0x214($at)
/* 13D870 0023D770 0C00448C */  lw         $4, 0xC($2)
/* 13D874 0023D774 2A00023C */  lui        $2, %hi(_24)
/* 13D878 0023D778 A0F74524 */  addiu      $5, $2, %lo(_24)
/* 13D87C 0023D77C 0400C68C */  lw         $6, 0x4($6)
/* 13D880 0023D780 EE06040C */  jal        fprintf
/* 13D884 0023D784 00000000 */   nop
/* 13D888 0023D788 FFFF0424 */  addiu      $4, $0, -0x1
/* 13D88C 0023D78C DC05040C */  jal        exit_2
/* 13D890 0023D790 00000000 */   nop
/* 13D894 0023D794 28160070 */  paddub     $2, $0, $0
.L0023D798:
/* 13D898 0023D798 0000BF7B */  lq         $31, 0x0($sp)
/* 13D89C 0023D79C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 13D8A0 0023D7A0 0800E003 */  jr         $31
/* 13D8A4 0023D7A4 00000000 */   nop
/* 13D8A8 0023D7A8 00000000 */  nop
/* 13D8AC 0023D7AC 00000000 */  nop
