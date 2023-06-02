.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceGsSwapDBuff
/* 12FA0 00112EA0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 12FA4 00112EA4 1000B1FF */  sd         $17, 0x10($sp)
/* 12FA8 00112EA8 2D888000 */  daddu      $17, $4, $0
/* 12FAC 00112EAC 0000B0FF */  sd         $16, 0x0($sp)
/* 12FB0 00112EB0 0100B030 */  andi       $16, $5, 0x1
/* 12FB4 00112EB4 28000424 */  addiu      $4, $0, 0x28
/* 12FB8 00112EB8 18100402 */  mult       $2, $16, $4
/* 12FBC 00112EBC 2000BFFF */  sd         $31, 0x20($sp)
/* 12FC0 00112EC0 AA49040C */  jal        sceGsPutDispEnv
/* 12FC4 00112EC4 21205100 */   addu      $4, $2, $17
/* 12FC8 00112EC8 05000012 */  beqz       $16, .L00112EE0
/* 12FCC 00112ECC 00000000 */   nop
/* 12FD0 00112ED0 C84A040C */  jal        sceGsPutDrawEnv
/* 12FD4 00112ED4 40012426 */   addiu     $4, $17, 0x140
/* 12FD8 00112ED8 04000010 */  b          .L00112EEC
/* 12FDC 00112EDC 2000BFDF */   ld        $31, 0x20($sp)
.L00112EE0:
/* 12FE0 00112EE0 C84A040C */  jal        sceGsPutDrawEnv
/* 12FE4 00112EE4 50002426 */   addiu     $4, $17, 0x50
/* 12FE8 00112EE8 2000BFDF */  ld         $31, 0x20($sp)
.L00112EEC:
/* 12FEC 00112EEC 1000B1DF */  ld         $17, 0x10($sp)
/* 12FF0 00112EF0 0000B0DF */  ld         $16, 0x0($sp)
/* 12FF4 00112EF4 0800E003 */  jr         $31
/* 12FF8 00112EF8 3000BD27 */   addiu     $sp, $sp, 0x30
/* 12FFC 00112EFC 00000000 */  nop
