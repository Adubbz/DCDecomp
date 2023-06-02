.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandSKY__FPPv
/* 753B0 001752B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 753B4 001752B4 1000BF7F */  sq         $31, 0x10($sp)
/* 753B8 001752B8 0000B07F */  sq         $16, 0x0($sp)
/* 753BC 001752BC 0000838C */  lw         $3, 0x0($4)
/* 753C0 001752C0 0000638C */  lw         $3, 0x0($3)
/* 753C4 001752C4 FFFF6324 */  addiu      $3, $3, -0x1
/* 753C8 001752C8 04006004 */  bltz       $3, .L001752DC
/* 753CC 001752CC 00000000 */   nop
/* 753D0 001752D0 05006128 */  slti       $at, $3, 0x5
/* 753D4 001752D4 03002014 */  bnez       $at, .L001752E4
/* 753D8 001752D8 00000000 */   nop
.L001752DC:
/* 753DC 001752DC 14000010 */  b          .L00175330
/* 753E0 001752E0 00000000 */   nop
.L001752E4:
/* 753E4 001752E4 40110300 */  sll        $2, $3, 5
/* 753E8 001752E8 23104300 */  subu       $2, $2, $3
/* 753EC 001752EC C0800200 */  sll        $16, $2, 3
/* 753F0 001752F0 C08F828F */  lw         $2, -0x7040($gp)
/* 753F4 001752F4 21105000 */  addu       $2, $2, $16
/* 753F8 001752F8 0400878C */  lw         $7, 0x4($4)
/* 753FC 001752FC F01B4424 */  addiu      $4, $2, 0x1BF0
/* 75400 00175300 2A00023C */  lui        $2, %hi(_501_2)
/* 75404 00175304 E0A74524 */  addiu      $5, $2, %lo(_501_2)
/* 75408 00175308 D201023C */  lui        $2, %hi(CurrentDir_2)
/* 7540C 0017530C F09A4624 */  addiu      $6, $2, %lo(CurrentDir_2)
/* 75410 00175310 1614040C */  jal        sprintf
/* 75414 00175314 00000000 */   nop
/* 75418 00175318 C08F838F */  lw         $3, -0x7040($gp)
/* 7541C 0017531C 21187000 */  addu       $3, $3, $16
/* 75420 00175320 F01B6324 */  addiu      $3, $3, 0x1BF0
/* 75424 00175324 F88F83AF */  sw         $3, -0x7008($gp)
/* 75428 00175328 FC8F80AF */  sw         $0, -0x7004($gp)
/* 7542C 0017532C 009080AF */  sw         $0, -0x7000($gp)
.L00175330:
/* 75430 00175330 1000BF7B */  lq         $31, 0x10($sp)
/* 75434 00175334 0000B07B */  lq         $16, 0x0($sp)
/* 75438 00175338 2000BD27 */  addiu      $sp, $sp, 0x20
/* 7543C 0017533C 0800E003 */  jr         $31
/* 75440 00175340 00000000 */   nop
/* 75444 00175344 00000000 */  nop
/* 75448 00175348 00000000 */  nop
/* 7544C 0017534C 00000000 */  nop
