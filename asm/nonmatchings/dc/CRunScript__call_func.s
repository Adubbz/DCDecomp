.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel call_func__10CRunScriptFP8funcdataP8vmcode_t
/* 13DCB0 0023DBB0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 13DCB4 0023DBB4 3000BF7F */  sq         $31, 0x30($sp)
/* 13DCB8 0023DBB8 2000B27F */  sq         $18, 0x20($sp)
/* 13DCBC 0023DBBC 1000B17F */  sq         $17, 0x10($sp)
/* 13DCC0 0023DBC0 0000B07F */  sq         $16, 0x0($sp)
/* 13DCC4 0023DBC4 288E8070 */  paddub     $17, $4, $0
/* 13DCC8 0023DBC8 2886A070 */  paddub     $16, $5, $0
/* 13DCCC 0023DBCC 2896C070 */  paddub     $18, $6, $0
/* 13DCD0 0023DBD0 2000838C */  lw         $3, 0x20($4)
/* 13DCD4 0023DBD4 2400828C */  lw         $2, 0x24($4)
/* 13DCD8 0023DBD8 2B106200 */  sltu       $2, $3, $2
/* 13DCDC 0023DBDC 08004014 */  bnez       $2, .L0023DC00
/* 13DCE0 0023DBE0 00000000 */   nop
/* 13DCE4 0023DBE4 2A00023C */  lui        $2, %hi(_68)
/* 13DCE8 0023DBE8 10F84424 */  addiu      $4, $2, %lo(_68)
/* 13DCEC 0023DBEC A611040C */  jal        printf
/* 13DCF0 0023DBF0 00000000 */   nop
/* 13DCF4 0023DBF4 FEFF0424 */  addiu      $4, $0, -0x2
/* 13DCF8 0023DBF8 DC05040C */  jal        exit_2
/* 13DCFC 0023DBFC 00000000 */   nop
.L0023DC00:
/* 13DD00 0023DC00 2000228E */  lw         $2, 0x20($17)
/* 13DD04 0023DC04 000052AC */  sw         $18, 0x0($2)
/* 13DD08 0023DC08 2C00238E */  lw         $3, 0x2C($17)
/* 13DD0C 0023DC0C 2000228E */  lw         $2, 0x20($17)
/* 13DD10 0023DC10 080043AC */  sw         $3, 0x8($2)
/* 13DD14 0023DC14 2800238E */  lw         $3, 0x28($17)
/* 13DD18 0023DC18 2000228E */  lw         $2, 0x20($17)
/* 13DD1C 0023DC1C 040043AC */  sw         $3, 0x4($2)
/* 13DD20 0023DC20 1000238E */  lw         $3, 0x10($17)
/* 13DD24 0023DC24 0C00028E */  lw         $2, 0xC($16)
/* 13DD28 0023DC28 C0100200 */  sll        $2, $2, 3
/* 13DD2C 0023DC2C 23106200 */  subu       $2, $3, $2
/* 13DD30 0023DC30 280022AE */  sw         $2, 0x28($17)
/* 13DD34 0023DC34 0800028E */  lw         $2, 0x8($16)
/* 13DD38 0023DC38 C0180200 */  sll        $3, $2, 3
/* 13DD3C 0023DC3C 2800228E */  lw         $2, 0x28($17)
/* 13DD40 0023DC40 21104300 */  addu       $2, $2, $3
/* 13DD44 0023DC44 100022AE */  sw         $2, 0x10($17)
/* 13DD48 0023DC48 2C0030AE */  sw         $16, 0x2C($17)
/* 13DD4C 0023DC4C 2000228E */  lw         $2, 0x20($17)
/* 13DD50 0023DC50 0C004224 */  addiu      $2, $2, 0xC
/* 13DD54 0023DC54 200022AE */  sw         $2, 0x20($17)
/* 13DD58 0023DC58 2C00258E */  lw         $5, 0x2C($17)
/* 13DD5C 0023DC5C 0C00A68C */  lw         $6, 0xC($5)
/* 13DD60 0023DC60 C0180600 */  sll        $3, $6, 3
/* 13DD64 0023DC64 2800228E */  lw         $2, 0x28($17)
/* 13DD68 0023DC68 21204300 */  addu       $4, $2, $3
/* 13DD6C 0023DC6C 0800A28C */  lw         $2, 0x8($5)
/* 13DD70 0023DC70 23104600 */  subu       $2, $2, $6
/* 13DD74 0023DC74 C0300200 */  sll        $6, $2, 3
/* 13DD78 0023DC78 282E0070 */  paddub     $5, $0, $0
/* 13DD7C 0023DC7C 5A0D040C */  jal        memset
/* 13DD80 0023DC80 00000000 */   nop
/* 13DD84 0023DC84 28262072 */  paddub     $4, $17, $0
/* 13DD88 0023DC88 60F6080C */  jal        check_stack__10CRunScriptFv
/* 13DD8C 0023DC8C 00000000 */   nop
/* 13DD90 0023DC90 0000038E */  lw         $3, 0x0($16)
/* 13DD94 0023DC94 4000228E */  lw         $2, 0x40($17)
/* 13DD98 0023DC98 21104300 */  addu       $2, $2, $3
/* 13DD9C 0023DC9C 3000BF7B */  lq         $31, 0x30($sp)
/* 13DDA0 0023DCA0 2000B27B */  lq         $18, 0x20($sp)
/* 13DDA4 0023DCA4 1000B17B */  lq         $17, 0x10($sp)
/* 13DDA8 0023DCA8 0000B07B */  lq         $16, 0x0($sp)
/* 13DDAC 0023DCAC 4000BD27 */  addiu      $sp, $sp, 0x40
/* 13DDB0 0023DCB0 0800E003 */  jr         $31
/* 13DDB4 0023DCB4 00000000 */   nop
/* 13DDB8 0023DCB8 00000000 */  nop
/* 13DDBC 0023DCBC 00000000 */  nop
