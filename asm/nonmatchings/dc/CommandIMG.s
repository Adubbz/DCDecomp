.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandIMG__FPPv
/* 3AB50 0013AA50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 3AB54 0013AA54 2000BF7F */  sq         $31, 0x20($sp)
/* 3AB58 0013AA58 1000B17F */  sq         $17, 0x10($sp)
/* 3AB5C 0013AA5C 0000B07F */  sq         $16, 0x0($sp)
/* 3AB60 0013AA60 988C838F */  lw         $3, -0x7368($gp)
/* 3AB64 0013AA64 22006010 */  beqz       $3, .L0013AAF0
/* 3AB68 0013AA68 00000000 */   nop
/* 3AB6C 0013AA6C 0000838C */  lw         $3, 0x0($4)
/* 3AB70 0013AA70 0000718C */  lw         $17, 0x0($3)
/* 3AB74 0013AA74 04002006 */  bltz       $17, .L0013AA88
/* 3AB78 0013AA78 00000000 */   nop
/* 3AB7C 0013AA7C 0400232A */  slti       $3, $17, 0x4
/* 3AB80 0013AA80 03006014 */  bnez       $3, .L0013AA90
/* 3AB84 0013AA84 00000000 */   nop
.L0013AA88:
/* 3AB88 0013AA88 19000010 */  b          .L0013AAF0
/* 3AB8C 0013AA8C 00000000 */   nop
.L0013AA90:
/* 3AB90 0013AA90 0400858C */  lw         $5, 0x4($4)
/* 3AB94 0013AA94 B08C848F */  lw         $4, -0x7350($gp)
/* 3AB98 0013AA98 3C00A627 */  addiu      $6, $sp, 0x3C
/* 3AB9C 0013AA9C C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 3ABA0 0013AAA0 00000000 */   nop
/* 3ABA4 0013AAA4 28864070 */  paddub     $16, $2, $0
/* 3ABA8 0013AAA8 11000012 */  beqz       $16, .L0013AAF0
/* 3ABAC 0013AAAC 00000000 */   nop
/* 3ABB0 0013AAB0 3C00A28F */  lw         $2, 0x3C($sp)
/* 3ABB4 0013AAB4 03110200 */  sra        $2, $2, 4
/* 3ABB8 0013AAB8 01004524 */  addiu      $5, $2, 0x1
/* 3ABBC 0013AABC 988C848F */  lw         $4, -0x7368($gp)
/* 3ABC0 0013AAC0 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 3ABC4 0013AAC4 00000000 */   nop
/* 3ABC8 0013AAC8 80201100 */  sll        $4, $17, 2
/* 3ABCC 0013AACC C801033C */  lui        $3, %hi(load_img)
/* 3ABD0 0013AAD0 B0B06324 */  addiu      $3, $3, %lo(load_img)
/* 3ABD4 0013AAD4 21186400 */  addu       $3, $3, $4
/* 3ABD8 0013AAD8 000062AC */  sw         $2, 0x0($3)
/* 3ABDC 0013AADC 3C00A68F */  lw         $6, 0x3C($sp)
/* 3ABE0 0013AAE0 0000648C */  lw         $4, 0x0($3)
/* 3ABE4 0013AAE4 282E0072 */  paddub     $5, $16, $0
/* 3ABE8 0013AAE8 EC0C040C */  jal        memcpy
/* 3ABEC 0013AAEC 00000000 */   nop
.L0013AAF0:
/* 3ABF0 0013AAF0 2000BF7B */  lq         $31, 0x20($sp)
/* 3ABF4 0013AAF4 1000B17B */  lq         $17, 0x10($sp)
/* 3ABF8 0013AAF8 0000B07B */  lq         $16, 0x0($sp)
/* 3ABFC 0013AAFC 4000BD27 */  addiu      $sp, $sp, 0x40
/* 3AC00 0013AB00 0800E003 */  jr         $31
/* 3AC04 0013AB04 00000000 */   nop
/* 3AC08 0013AB08 00000000 */  nop
/* 3AC0C 0013AB0C 00000000 */  nop
