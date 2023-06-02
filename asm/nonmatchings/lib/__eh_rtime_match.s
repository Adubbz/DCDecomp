.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __eh_rtime_match
/* DAE0 0010D9E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* DAE4 0010D9E4 0000B0FF */  sd         $16, 0x0($sp)
/* DAE8 0010D9E8 1000BFFF */  sd         $31, 0x10($sp)
/* DAEC 0010D9EC 9C35040C */  jal        __get_eh_info
/* DAF0 0010D9F0 2D808000 */   daddu     $16, $4, $0
/* DAF4 0010D9F4 0000448C */  lw         $4, 0x0($2)
/* DAF8 0010D9F8 0000828C */  lw         $2, 0x0($4)
/* DAFC 0010D9FC 03004014 */  bnez       $2, .L0010DA0C
/* DB00 0010DA00 2D280002 */   daddu     $5, $16, $0
/* DB04 0010DA04 04000010 */  b          .L0010DA18
/* DB08 0010DA08 2D100000 */   daddu     $2, $0, $0
.L0010DA0C:
/* DB0C 0010DA0C 09F84000 */  jalr       $2
/* DB10 0010DA10 2D300000 */   daddu     $6, $0, $0
/* DB14 0010DA14 2B100200 */  sltu       $2, $0, $2
.L0010DA18:
/* DB18 0010DA18 1000BFDF */  ld         $31, 0x10($sp)
/* DB1C 0010DA1C 0000B0DF */  ld         $16, 0x0($sp)
/* DB20 0010DA20 0800E003 */  jr         $31
/* DB24 0010DA24 2000BD27 */   addiu     $sp, $sp, 0x20
