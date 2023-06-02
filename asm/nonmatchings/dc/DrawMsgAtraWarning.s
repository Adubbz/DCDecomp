.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMsgAtraWarning__FP6ClsMesii
/* 11A0C0 00219FC0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 11A0C4 00219FC4 3000BF7F */  sq         $31, 0x30($sp)
/* 11A0C8 00219FC8 2000B27F */  sq         $18, 0x20($sp)
/* 11A0CC 00219FCC 1000B17F */  sq         $17, 0x10($sp)
/* 11A0D0 00219FD0 0000B07F */  sq         $16, 0x0($sp)
/* 11A0D4 00219FD4 28968070 */  paddub     $18, $4, $0
/* 11A0D8 00219FD8 288EA070 */  paddub     $17, $5, $0
/* 11A0DC 00219FDC 2886C070 */  paddub     $16, $6, $0
/* 11A0E0 00219FE0 18004012 */  beqz       $18, .L0021A044
/* 11A0E4 00219FE4 00000000 */   nop
/* 11A0E8 00219FE8 BC16428E */  lw         $2, 0x16BC($18)
/* 11A0EC 00219FEC C8000524 */  addiu      $5, $0, 0xC8
/* 11A0F0 00219FF0 03004510 */  beq        $2, $5, .L0021A000
/* 11A0F4 00219FF4 00000000 */   nop
/* 11A0F8 00219FF8 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 11A0FC 00219FFC 00000000 */   nop
.L0021A000:
/* 11A100 0021A000 28264072 */  paddub     $4, $18, $0
/* 11A104 0021A004 C8000524 */  addiu      $5, $0, 0xC8
/* 11A108 0021A008 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 11A10C 0021A00C 00000000 */   nop
/* 11A110 0021A010 4C17448E */  lw         $4, 0x174C($18)
/* 11A114 0021A014 38B4080C */  jal        MenuTextureReload__Fi
/* 11A118 0021A018 00000000 */   nop
/* 11A11C 0021A01C 01000224 */  addiu      $2, $0, 0x1
/* 11A120 0021A020 980042AE */  sw         $2, 0x98($18)
/* 11A124 0021A024 000051AE */  sw         $17, 0x0($18)
/* 11A128 0021A028 040050AE */  sw         $16, 0x4($18)
/* 11A12C 0021A02C 28264072 */  paddub     $4, $18, $0
/* 11A130 0021A030 6437050C */  jal        Step__6ClsMesFv
/* 11A134 0021A034 00000000 */   nop
/* 11A138 0021A038 28264072 */  paddub     $4, $18, $0
/* 11A13C 0021A03C C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 11A140 0021A040 00000000 */   nop
.L0021A044:
/* 11A144 0021A044 3000BF7B */  lq         $31, 0x30($sp)
/* 11A148 0021A048 2000B27B */  lq         $18, 0x20($sp)
/* 11A14C 0021A04C 1000B17B */  lq         $17, 0x10($sp)
/* 11A150 0021A050 0000B07B */  lq         $16, 0x0($sp)
/* 11A154 0021A054 4000BD27 */  addiu      $sp, $sp, 0x40
/* 11A158 0021A058 0800E003 */  jr         $31
/* 11A15C 0021A05C 00000000 */   nop
