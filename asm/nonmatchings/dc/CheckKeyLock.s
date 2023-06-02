.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckKeyLock__Fv
/* 78040 00177F40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 78044 00177F44 0000BF7F */  sq         $31, 0x0($sp)
/* 78048 00177F48 B0DF050C */  jal        run_event_check__Fv
/* 7804C 00177F4C 00000000 */   nop
/* 78050 00177F50 03004010 */  beqz       $2, .L00177F60
/* 78054 00177F54 00000000 */   nop
/* 78058 00177F58 01000324 */  addiu      $3, $0, 0x1
/* 7805C 00177F5C 849083AF */  sw         $3, -0x6F7C($gp)
.L00177F60:
/* 78060 00177F60 8490838F */  lw         $3, -0x6F7C($gp)
/* 78064 00177F64 05006014 */  bnez       $3, .L00177F7C
/* 78068 00177F68 00000000 */   nop
/* 7806C 00177F6C 9090838F */  lw         $3, -0x6F70($gp)
/* 78070 00177F70 02006128 */  slti       $at, $3, 0x2
/* 78074 00177F74 04002010 */  beqz       $at, .L00177F88
/* 78078 00177F78 00000000 */   nop
.L00177F7C:
/* 7807C 00177F7C 28260070 */  paddub     $4, $0, $0
/* 78080 00177F80 FCA5050C */  jal        EdSetKeyMode__Fi
/* 78084 00177F84 00000000 */   nop
.L00177F88:
/* 78088 00177F88 0000BF7B */  lq         $31, 0x0($sp)
/* 7808C 00177F8C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 78090 00177F90 0800E003 */  jr         $31
/* 78094 00177F94 00000000 */   nop
/* 78098 00177F98 00000000 */  nop
/* 7809C 00177F9C 00000000 */  nop
