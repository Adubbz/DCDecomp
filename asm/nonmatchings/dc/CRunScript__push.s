.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel push__10CRunScriptF12RS_STACKDATA
/* 13DAC0 0023D9C0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 13DAC4 0023D9C4 1000BF7F */  sq         $31, 0x10($sp)
/* 13DAC8 0023D9C8 0000B07F */  sq         $16, 0x0($sp)
/* 13DACC 0023D9CC 28868070 */  paddub     $16, $4, $0
/* 13DAD0 0023D9D0 2800A5FF */  sd         $5, 0x28($sp)
/* 13DAD4 0023D9D4 60F6080C */  jal        check_stack__10CRunScriptFv
/* 13DAD8 0023D9D8 00000000 */   nop
/* 13DADC 0023D9DC 1000048E */  lw         $4, 0x10($16)
/* 13DAE0 0023D9E0 08008324 */  addiu      $3, $4, 0x8
/* 13DAE4 0023D9E4 100003AE */  sw         $3, 0x10($16)
/* 13DAE8 0023D9E8 2800A327 */  addiu      $3, $sp, 0x28
/* 13DAEC 0023D9EC 000061C4 */  lwc1       $f1, 0x0($3)
/* 13DAF0 0023D9F0 040060C4 */  lwc1       $f0, 0x4($3)
/* 13DAF4 0023D9F4 000081E4 */  swc1       $f1, 0x0($4)
/* 13DAF8 0023D9F8 040080E4 */  swc1       $f0, 0x4($4)
/* 13DAFC 0023D9FC 1000BF7B */  lq         $31, 0x10($sp)
/* 13DB00 0023DA00 0000B07B */  lq         $16, 0x0($sp)
/* 13DB04 0023DA04 3000BD27 */  addiu      $sp, $sp, 0x30
/* 13DB08 0023DA08 0800E003 */  jr         $31
/* 13DB0C 0023DA0C 00000000 */   nop
