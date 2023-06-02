.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _signal_r
/* 4D90 00104C90 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 4D94 00104C94 1000B1FF */  sd         $17, 0x10($sp)
/* 4D98 00104C98 2000B2FF */  sd         $18, 0x20($sp)
/* 4D9C 00104C9C 2D88A000 */  daddu      $17, $5, $0
/* 4DA0 00104CA0 0000B0FF */  sd         $16, 0x0($sp)
/* 4DA4 00104CA4 2D90C000 */  daddu      $18, $6, $0
/* 4DA8 00104CA8 3000BFFF */  sd         $31, 0x30($sp)
/* 4DAC 00104CAC 2000222E */  sltiu      $2, $17, 0x20
/* 4DB0 00104CB0 06004014 */  bnez       $2, .L00104CCC
/* 4DB4 00104CB4 2D808000 */   daddu     $16, $4, $0
/* 4DB8 00104CB8 16000324 */  addiu      $3, $0, 0x16
/* 4DBC 00104CBC FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* 4DC0 00104CC0 000003AE */  sw         $3, 0x0($16)
/* 4DC4 00104CC4 0F000010 */  b          .L00104D04
/* 4DC8 00104CC8 FFFF4234 */   ori       $2, $2, (0xFFFFFFFF & 0xFFFF)
.L00104CCC:
/* 4DCC 00104CCC D401028E */  lw         $2, 0x1D4($16)
/* 4DD0 00104CD0 09004014 */  bnez       $2, .L00104CF8
/* 4DD4 00104CD4 80181100 */   sll       $3, $17, 2
/* 4DD8 00104CD8 0813040C */  jal        _init_signal_r
/* 4DDC 00104CDC 2D200002 */   daddu     $4, $16, $0
/* 4DE0 00104CE0 04004050 */  beql       $2, $0, .L00104CF4
/* 4DE4 00104CE4 D401028E */   lw        $2, 0x1D4($16)
/* 4DE8 00104CE8 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* 4DEC 00104CEC 05000010 */  b          .L00104D04
/* 4DF0 00104CF0 FFFF4234 */   ori       $2, $2, (0xFFFFFFFF & 0xFFFF)
.L00104CF4:
/* 4DF4 00104CF4 80181100 */  sll        $3, $17, 2
.L00104CF8:
/* 4DF8 00104CF8 21186200 */  addu       $3, $3, $2
/* 4DFC 00104CFC 0000628C */  lw         $2, 0x0($3)
/* 4E00 00104D00 000072AC */  sw         $18, 0x0($3)
.L00104D04:
/* 4E04 00104D04 3000BFDF */  ld         $31, 0x30($sp)
/* 4E08 00104D08 2000B2DF */  ld         $18, 0x20($sp)
/* 4E0C 00104D0C 1000B1DF */  ld         $17, 0x10($sp)
/* 4E10 00104D10 0000B0DF */  ld         $16, 0x0($sp)
/* 4E14 00104D14 0800E003 */  jr         $31
/* 4E18 00104D18 4000BD27 */   addiu     $sp, $sp, 0x40
/* 4E1C 00104D1C 00000000 */  nop
