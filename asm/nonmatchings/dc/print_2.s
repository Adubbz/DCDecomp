.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel print__FP12RS_STACKDATAi
/* 13D950 0023D850 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 13D954 0023D854 3000BF7F */  sq         $31, 0x30($sp)
/* 13D958 0023D858 2000B27F */  sq         $18, 0x20($sp)
/* 13D95C 0023D85C 1000B17F */  sq         $17, 0x10($sp)
/* 13D960 0023D860 0000B07F */  sq         $16, 0x0($sp)
/* 13D964 0023D864 28968070 */  paddub     $18, $4, $0
/* 13D968 0023D868 288EA070 */  paddub     $17, $5, $0
/* 13D96C 0023D86C 28860070 */  paddub     $16, $0, $0
/* 13D970 0023D870 27000010 */  b          .L0023D910
/* 13D974 0023D874 00000000 */   nop
.L0023D878:
/* 13D978 0023D878 0000438E */  lw         $3, 0x0($18)
/* 13D97C 0023D87C 08006014 */  bnez       $3, .L0023D8A0
/* 13D980 0023D880 00000000 */   nop
/* 13D984 0023D884 2A00023C */  lui        $2, %hi(_50)
/* 13D988 0023D888 F0F74424 */  addiu      $4, $2, %lo(_50)
/* 13D98C 0023D88C 0400458E */  lw         $5, 0x4($18)
/* 13D990 0023D890 A611040C */  jal        printf
/* 13D994 0023D894 00000000 */   nop
/* 13D998 0023D898 16000010 */  b          .L0023D8F4
/* 13D99C 0023D89C 00000000 */   nop
.L0023D8A0:
/* 13D9A0 0023D8A0 02000224 */  addiu      $2, $0, 0x2
/* 13D9A4 0023D8A4 08006214 */  bne        $3, $2, .L0023D8C8
/* 13D9A8 0023D8A8 00000000 */   nop
/* 13D9AC 0023D8AC 2A00023C */  lui        $2, %hi(_51)
/* 13D9B0 0023D8B0 F8F74424 */  addiu      $4, $2, %lo(_51)
/* 13D9B4 0023D8B4 0400458E */  lw         $5, 0x4($18)
/* 13D9B8 0023D8B8 A611040C */  jal        printf
/* 13D9BC 0023D8BC 00000000 */   nop
/* 13D9C0 0023D8C0 0C000010 */  b          .L0023D8F4
/* 13D9C4 0023D8C4 00000000 */   nop
.L0023D8C8:
/* 13D9C8 0023D8C8 01000224 */  addiu      $2, $0, 0x1
/* 13D9CC 0023D8CC 09006214 */  bne        $3, $2, .L0023D8F4
/* 13D9D0 0023D8D0 00000000 */   nop
/* 13D9D4 0023D8D4 04004CC6 */  lwc1       $f12, 0x4($18)
/* 13D9D8 0023D8D8 9044040C */  jal        fptodp
/* 13D9DC 0023D8DC 00000000 */   nop
/* 13D9E0 0023D8E0 2A00033C */  lui        $3, %hi(_52)
/* 13D9E4 0023D8E4 00F86424 */  addiu      $4, $3, %lo(_52)
/* 13D9E8 0023D8E8 282E4070 */  paddub     $5, $2, $0
/* 13D9EC 0023D8EC A611040C */  jal        printf
/* 13D9F0 0023D8F0 00000000 */   nop
.L0023D8F4:
/* 13D9F4 0023D8F4 2500013C */  lui        $at, (0x250000 >> 16)
/* 13D9F8 0023D8F8 ECFD228C */  lw         $2, -0x214($at)
/* 13D9FC 0023D8FC 0800448C */  lw         $4, 0x8($2)
/* 13DA00 0023D900 0806040C */  jal        fflush
/* 13DA04 0023D904 00000000 */   nop
/* 13DA08 0023D908 01001026 */  addiu      $16, $16, 0x1
/* 13DA0C 0023D90C 08005226 */  addiu      $18, $18, 0x8
.L0023D910:
/* 13DA10 0023D910 2A181102 */  slt        $3, $16, $17
/* 13DA14 0023D914 D8FF6014 */  bnez       $3, .L0023D878
/* 13DA18 0023D918 00000000 */   nop
/* 13DA1C 0023D91C 3000BF7B */  lq         $31, 0x30($sp)
/* 13DA20 0023D920 2000B27B */  lq         $18, 0x20($sp)
/* 13DA24 0023D924 1000B17B */  lq         $17, 0x10($sp)
/* 13DA28 0023D928 0000B07B */  lq         $16, 0x0($sp)
/* 13DA2C 0023D92C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 13DA30 0023D930 0800E003 */  jr         $31
/* 13DA34 0023D934 00000000 */   nop
/* 13DA38 0023D938 00000000 */  nop
/* 13DA3C 0023D93C 00000000 */  nop
