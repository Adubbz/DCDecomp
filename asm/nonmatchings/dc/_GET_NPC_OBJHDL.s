.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_NPC_OBJHDL__FP12RS_STACKDATAi
/* BCC30 001BCB30 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* BCC34 001BCB34 2000BF7F */  sq         $31, 0x20($sp)
/* BCC38 001BCB38 1000B17F */  sq         $17, 0x10($sp)
/* BCC3C 001BCB3C 0000B07F */  sq         $16, 0x0($sp)
/* BCC40 001BCB40 08009124 */  addiu      $17, $4, 0x8
/* BCC44 001BCB44 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCC48 001BCB48 00000000 */   nop
/* BCC4C 001BCB4C 28864070 */  paddub     $16, $2, $0
/* BCC50 001BCB50 28262072 */  paddub     $4, $17, $0
/* BCC54 001BCB54 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCC58 001BCB58 00000000 */   nop
/* BCC5C 001BCB5C 288E4070 */  paddub     $17, $2, $0
/* BCC60 001BCB60 28260072 */  paddub     $4, $16, $0
/* BCC64 001BCB64 80EC060C */  jal        GetObjHDL__Fi
/* BCC68 001BCB68 00000000 */   nop
/* BCC6C 001BCB6C 04002006 */  bltz       $17, .L001BCB80
/* BCC70 001BCB70 00000000 */   nop
/* BCC74 001BCB74 0400212A */  slti       $at, $17, 0x4
/* BCC78 001BCB78 08002014 */  bnez       $at, .L001BCB9C
/* BCC7C 001BCB7C 00000000 */   nop
.L001BCB80:
/* BCC80 001BCB80 2A00023C */  lui        $2, %hi(_833)
/* BCC84 001BCB84 48BD4424 */  addiu      $4, $2, %lo(_833)
/* BCC88 001BCB88 A611040C */  jal        printf
/* BCC8C 001BCB8C 00000000 */   nop
/* BCC90 001BCB90 01000224 */  addiu      $2, $0, 0x1
/* BCC94 001BCB94 13000010 */  b          .L001BCBE4
/* BCC98 001BCB98 00000000 */   nop
.L001BCB9C:
/* BCC9C 001BCB9C 30130324 */  addiu      $3, $0, 0x1330
/* BCCA0 001BCBA0 18202302 */  mult       $4, $17, $3
/* BCCA4 001BCBA4 C89C838F */  lw         $3, -0x6338($gp)
/* BCCA8 001BCBA8 21186400 */  addu       $3, $3, $4
/* BCCAC 001BCBAC F83D6424 */  addiu      $4, $3, 0x3DF8
/* BCCB0 001BCBB0 F87F8424 */  addiu      $4, $4, 0x7FF8
/* BCCB4 001BCBB4 BC00838C */  lw         $3, 0xBC($4)
/* BCCB8 001BCBB8 06006010 */  beqz       $3, .L001BCBD4
/* BCCBC 001BCBBC 00000000 */   nop
/* BCCC0 001BCBC0 040044AC */  sw         $4, 0x4($2)
/* BCCC4 001BCBC4 01000324 */  addiu      $3, $0, 0x1
/* BCCC8 001BCBC8 080043AC */  sw         $3, 0x8($2)
/* BCCCC 001BCBCC 04000010 */  b          .L001BCBE0
/* BCCD0 001BCBD0 00000000 */   nop
.L001BCBD4:
/* BCCD4 001BCBD4 040040AC */  sw         $0, 0x4($2)
/* BCCD8 001BCBD8 01000324 */  addiu      $3, $0, 0x1
/* BCCDC 001BCBDC 080043AC */  sw         $3, 0x8($2)
.L001BCBE0:
/* BCCE0 001BCBE0 01000224 */  addiu      $2, $0, 0x1
.L001BCBE4:
/* BCCE4 001BCBE4 2000BF7B */  lq         $31, 0x20($sp)
/* BCCE8 001BCBE8 1000B17B */  lq         $17, 0x10($sp)
/* BCCEC 001BCBEC 0000B07B */  lq         $16, 0x0($sp)
/* BCCF0 001BCBF0 3000BD27 */  addiu      $sp, $sp, 0x30
/* BCCF4 001BCBF4 0800E003 */  jr         $31
/* BCCF8 001BCBF8 00000000 */   nop
/* BCCFC 001BCBFC 00000000 */  nop
