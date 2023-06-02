.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceCdRM
/* B968 0010B868 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* B96C 0010B86C 2000B1FF */  sd         $17, 0x20($sp)
/* B970 0010B870 3000B2FF */  sd         $18, 0x30($sp)
/* B974 0010B874 2D888000 */  daddu      $17, $4, $0
/* B978 0010B878 4000BFFF */  sd         $31, 0x40($sp)
/* B97C 0010B87C 2D90A000 */  daddu      $18, $5, $0
/* B980 0010B880 1000B0FF */  sd         $16, 0x10($sp)
/* B984 0010B884 A82B040C */  jal        scmd_prechk
/* B988 0010B888 05000424 */   addiu     $4, $0, 0x5
/* B98C 0010B88C 03004014 */  bnez       $2, .L0010B89C
/* B990 0010B890 2A00023C */   lui       $2, %hi(D_002A4940)
/* B994 0010B894 28000010 */  b          .L0010B938
/* B998 0010B898 2D100000 */   daddu     $2, $0, $0
.L0010B89C:
/* B99C 0010B89C 2A00043C */  lui        $4, %hi(D_002A4D60)
/* B9A0 0010B8A0 40495024 */  addiu      $16, $2, %lo(D_002A4940)
/* B9A4 0010B8A4 604D8424 */  addiu      $4, $4, %lo(D_002A4D60)
/* B9A8 0010B8A8 0000A0AF */  sw         $0, 0x0($sp)
/* B9AC 0010B8AC 1A000524 */  addiu      $5, $0, 0x1A
/* B9B0 0010B8B0 2D300000 */  daddu      $6, $0, $0
/* B9B4 0010B8B4 2D380000 */  daddu      $7, $0, $0
/* B9B8 0010B8B8 2D400000 */  daddu      $8, $0, $0
/* B9BC 0010B8BC 2D480002 */  daddu      $9, $16, $0
/* B9C0 0010B8C0 18000A24 */  addiu      $10, $0, 0x18
/* B9C4 0010B8C4 2A5D040C */  jal        sceSifCallRpc
/* B9C8 0010B8C8 2D580000 */   daddu     $11, $0, $0
/* B9CC 0010B8CC 06004104 */  bgez       $2, .L0010B8E8
/* B9D0 0010B8D0 0020053C */   lui       $5, (0x20000000 >> 16)
/* B9D4 0010B8D4 2500023C */  lui        $2, (0x250284 >> 16)
/* B9D8 0010B8D8 D050040C */  jal        SignalSema
/* B9DC 0010B8DC 8402448C */   lw        $4, (0x250284 & 0xFFFF)($2)
/* B9E0 0010B8E0 15000010 */  b          .L0010B938
/* B9E4 0010B8E4 2D100000 */   daddu     $2, $0, $0
.L0010B8E8:
/* B9E8 0010B8E8 08000226 */  addiu      $2, $16, 0x8
/* B9EC 0010B8EC 25104500 */  or         $2, $2, $5
/* B9F0 0010B8F0 04000326 */  addiu      $3, $16, 0x4
/* B9F4 0010B8F4 07004468 */  ldl        $4, (0x20000007 & 0xFFFF)($2)
/* B9F8 0010B8F8 0000446C */  ldr        $4, (0x20000000 & 0xFFFF)($2)
/* B9FC 0010B8FC 0F004668 */  ldl        $6, (0x2000000F & 0xFFFF)($2)
/* BA00 0010B900 0800466C */  ldr        $6, (0x20000008 & 0xFFFF)($2)
/* BA04 0010B904 070024B2 */  sdl        $4, 0x7($17)
/* BA08 0010B908 000024B6 */  sdr        $4, 0x0($17)
/* BA0C 0010B90C 0F0026B2 */  sdl        $6, 0xF($17)
/* BA10 0010B910 25186500 */  or         $3, $3, $5
/* BA14 0010B914 080026B6 */  sdr        $6, 0x8($17)
/* BA18 0010B918 25280502 */  or         $5, $16, $5
/* BA1C 0010B91C 0000628C */  lw         $2, (0x20000000 & 0xFFFF)($3)
/* BA20 0010B920 2500063C */  lui        $6, (0x250284 >> 16)
/* BA24 0010B924 000042AE */  sw         $2, 0x0($18)
/* BA28 0010B928 8402C48C */  lw         $4, (0x250284 & 0xFFFF)($6)
/* BA2C 0010B92C D050040C */  jal        SignalSema
/* BA30 0010B930 0000B08C */   lw        $16, (0x20000000 & 0xFFFF)($5)
/* BA34 0010B934 2D100002 */  daddu      $2, $16, $0
.L0010B938:
/* BA38 0010B938 4000BFDF */  ld         $31, 0x40($sp)
/* BA3C 0010B93C 3000B2DF */  ld         $18, 0x30($sp)
/* BA40 0010B940 2000B1DF */  ld         $17, 0x20($sp)
/* BA44 0010B944 1000B0DF */  ld         $16, 0x10($sp)
/* BA48 0010B948 0800E003 */  jr         $31
/* BA4C 0010B94C 5000BD27 */   addiu     $sp, $sp, 0x50
