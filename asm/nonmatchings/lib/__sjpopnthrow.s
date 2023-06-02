.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __sjpopnthrow
/* D9C8 0010D8C8 2500033C */  lui        $3, (0x250384 >> 16)
/* D9CC 0010D8CC B0F8BD27 */  addiu      $sp, $sp, -0x750
/* D9D0 0010D8D0 8403628C */  lw         $2, (0x250384 & 0xFFFF)($3)
/* D9D4 0010D8D4 E006BFFF */  sd         $31, 0x6E0($sp)
/* D9D8 0010D8D8 D006BEFF */  sd         $fp, 0x6D0($sp)
/* D9DC 0010D8DC C006B7FF */  sd         $23, 0x6C0($sp)
/* D9E0 0010D8E0 B006B6FF */  sd         $22, 0x6B0($sp)
/* D9E4 0010D8E4 A006B5FF */  sd         $21, 0x6A0($sp)
/* D9E8 0010D8E8 9006B4FF */  sd         $20, 0x690($sp)
/* D9EC 0010D8EC 8006B3FF */  sd         $19, 0x680($sp)
/* D9F0 0010D8F0 7006B2FF */  sd         $18, 0x670($sp)
/* D9F4 0010D8F4 6006B1FF */  sd         $17, 0x660($sp)
/* D9F8 0010D8F8 5006B0FF */  sd         $16, 0x650($sp)
/* D9FC 0010D8FC 4807BFE7 */  swc1       $f31, 0x748($sp)
/* DA00 0010D900 4007BEE7 */  swc1       $f30, 0x740($sp)
/* DA04 0010D904 3807BDE7 */  swc1       $f29, 0x738($sp)
/* DA08 0010D908 3007BCE7 */  swc1       $f28, 0x730($sp)
/* DA0C 0010D90C 2807BBE7 */  swc1       $f27, 0x728($sp)
/* DA10 0010D910 2007BAE7 */  swc1       $f26, 0x720($sp)
/* DA14 0010D914 1807B9E7 */  swc1       $f25, 0x718($sp)
/* DA18 0010D918 1007B8E7 */  swc1       $f24, 0x710($sp)
/* DA1C 0010D91C 0807B7E7 */  swc1       $f23, 0x708($sp)
/* DA20 0010D920 0007B6E7 */  swc1       $f22, 0x700($sp)
/* DA24 0010D924 F806B5E7 */  swc1       $f21, 0x6F8($sp)
/* DA28 0010D928 09F84000 */  jalr       $2
/* DA2C 0010D92C F006B4E7 */   swc1      $f20, 0x6F0($sp)
/* DA30 0010D930 0400438C */  lw         $3, 0x4($2)
/* DA34 0010D934 04004224 */  addiu      $2, $2, 0x4
/* DA38 0010D938 4006A2AF */  sw         $2, 0x640($sp)
/* DA3C 0010D93C 04006224 */  addiu      $2, $3, 0x4
/* DA40 0010D940 4406A2AF */  sw         $2, 0x644($sp)
/* DA44 0010D944 0400628C */  lw         $2, 0x4($3)
/* DA48 0010D948 20004010 */  beqz       $2, .L0010D9CC
/* DA4C 0010D94C 1100023C */   lui       $2, %hi(__sjpopnthrow + 0xA8)
/* DA50 0010D950 0000A3AF */  sw         $3, 0x0($sp)
/* DA54 0010D954 0400A0AF */  sw         $0, 0x4($sp)
/* DA58 0010D958 0800A327 */  addiu      $3, $sp, 0x8
/* DA5C 0010D95C 0800BDAF */  sw         $sp, 0x8($sp)
/* DA60 0010D960 70D94224 */  addiu      $2, $2, %lo(__sjpopnthrow + 0xA8)
/* DA64 0010D964 040062AC */  sw         $2, 0x4($3)
/* DA68 0010D968 4806BDAF */  sw         $sp, 0x648($sp)
/* DA6C 0010D96C 08007DAC */  sw         $sp, 0x8($3)
/* DA70 0010D970 4006A38F */  lw         $3, 0x640($sp)
/* DA74 0010D974 4806A68F */  lw         $6, 0x648($sp)
/* DA78 0010D978 000066AC */  sw         $6, 0x0($3)
/* DA7C 0010D97C 4406A28F */  lw         $2, 0x644($sp)
/* DA80 0010D980 0000438C */  lw         $3, 0x0($2)
/* DA84 0010D984 0E006010 */  beqz       $3, .L0010D9C0
/* DA88 0010D988 4806A68F */   lw        $6, 0x648($sp)
/* DA8C 0010D98C 00000000 */  nop
.L0010D990:
/* DA90 0010D990 0000628C */  lw         $2, 0x0($3)
/* DA94 0010D994 02000524 */  addiu      $5, $0, 0x2
/* DA98 0010D998 0800648C */  lw         $4, 0x8($3)
/* DA9C 0010D99C 4406A68F */  lw         $6, 0x644($sp)
/* DAA0 0010D9A0 0400638C */  lw         $3, 0x4($3)
/* DAA4 0010D9A4 09F86000 */  jalr       $3
/* DAA8 0010D9A8 0000C2AC */   sw        $2, 0x0($6)
/* DAAC 0010D9AC 4406A38F */  lw         $3, 0x644($sp)
/* DAB0 0010D9B0 0000628C */  lw         $2, 0x0($3)
/* DAB4 0010D9B4 F6FF4014 */  bnez       $2, .L0010D990
/* DAB8 0010D9B8 2D184000 */   daddu     $3, $2, $0
/* DABC 0010D9BC 4806A68F */  lw         $6, 0x648($sp)
.L0010D9C0:
/* DAC0 0010D9C0 4006A38F */  lw         $3, 0x640($sp)
/* DAC4 0010D9C4 0000C28C */  lw         $2, 0x0($6)
/* DAC8 0010D9C8 000062AC */  sw         $2, 0x0($3)
.L0010D9CC:
/* DACC 0010D9CC 4006A68F */  lw         $6, 0x640($sp)
/* DAD0 0010D9D0 0000C28C */  lw         $2, 0x0($6)
/* DAD4 0010D9D4 0000438C */  lw         $3, 0x0($2)
/* DAD8 0010D9D8 D435040C */  jal        __sjthrow
/* DADC 0010D9DC 0000C3AC */   sw        $3, 0x0($6)
