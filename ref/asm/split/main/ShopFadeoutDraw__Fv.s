.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ShopFadeoutDraw__Fv
/* 0E7FA0 001E7EA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E7FA4 001E7EA4 0000BF7F */  sq          $31, 0x0($29)
/* 0E7FA8 001E7EA8 282E0070 */  paddub      $5, $0, $0
/* 0E7FAC 001E7EAC D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E7FB0 001E7EB0 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0E7FB4 001E7EB4 02000224 */  addiu       $2, $0, 0x2
/* 0E7FB8 001E7EB8 0E006210 */  beq         $3, $2, .L001E7EF4
/* 0E7FBC 001E7EBC 00000000 */   nop
/* 0E7FC0 001E7EC0 01000224 */  addiu       $2, $0, 0x1
/* 0E7FC4 001E7EC4 03006210 */  beq         $3, $2, .L001E7ED4
/* 0E7FC8 001E7EC8 00000000 */   nop
/* 0E7FCC 001E7ECC 0E000010 */  b           .L001E7F08
/* 0E7FD0 001E7ED0 00000000 */   nop
.L001E7ED4:
/* 0E7FD4 001E7ED4 80000424 */  addiu       $4, $0, 0x80
/* 0E7FD8 001E7ED8 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0E7FDC 001E7EDC 5402238C */  lw          $3, %lo(ShopMenu + 0x184)($1)
/* 0E7FE0 001E7EE0 40100300 */  sll         $2, $3, 1
/* 0E7FE4 001E7EE4 21104300 */  addu        $2, $2, $3
/* 0E7FE8 001E7EE8 23288200 */  subu        $5, $4, $2
/* 0E7FEC 001E7EEC 06000010 */  b           .L001E7F08
/* 0E7FF0 001E7EF0 00000000 */   nop
.L001E7EF4:
/* 0E7FF4 001E7EF4 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0E7FF8 001E7EF8 5402238C */  lw          $3, %lo(ShopMenu + 0x184)($1)
/* 0E7FFC 001E7EFC 40100300 */  sll         $2, $3, 1
/* 0E8000 001E7F00 21104300 */  addu        $2, $2, $3
/* 0E8004 001E7F04 40004524 */  addiu       $5, $2, 0x40
.L001E7F08:
/* 0E8008 001E7F08 0200A104 */  bgez        $5, .L001E7F14
/* 0E800C 001E7F0C 00000000 */   nop
/* 0E8010 001E7F10 282E0070 */  paddub      $5, $0, $0
.L001E7F14:
/* 0E8014 001E7F14 8100A128 */  slti        $1, $5, 0x81
/* 0E8018 001E7F18 02002014 */  bnez        $1, .L001E7F24
/* 0E801C 001E7F1C 00000000 */   nop
/* 0E8020 001E7F20 80000524 */  addiu       $5, $0, 0x80
.L001E7F24:
/* 0E8024 001E7F24 40000424 */  addiu       $4, $0, 0x40
/* 0E8028 001E7F28 ACB4080C */  jal         FrameImageDraw__Fii
/* 0E802C 001E7F2C 00000000 */   nop
/* 0E8030 001E7F30 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E8034 001E7F34 50022484 */  lh          $4, %lo(ShopMenu + 0x180)($1)
/* 0E8038 001E7F38 19000324 */  addiu       $3, $0, 0x19
/* 0E803C 001E7F3C 05008310 */  beq         $4, $3, .L001E7F54
/* 0E8040 001E7F40 00000000 */   nop
/* 0E8044 001E7F44 03008010 */  beqz        $4, .L001E7F54
/* 0E8048 001E7F48 00000000 */   nop
/* 0E804C 001E7F4C 05000010 */  b           .L001E7F64
/* 0E8050 001E7F50 00000000 */   nop
.L001E7F54:
/* 0E8054 001E7F54 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0E8058 001E7F58 540220AC */  sw          $0, %lo(ShopMenu + 0x184)($1)
/* 0E805C 001E7F5C 0A000010 */  b           .L001E7F88
/* 0E8060 001E7F60 00000000 */   nop
.L001E7F64:
/* 0E8064 001E7F64 D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0E8068 001E7F68 58022384 */  lh          $3, %lo(ShopMenu + 0x188)($1)
/* 0E806C 001E7F6C 06006010 */  beqz        $3, .L001E7F88
/* 0E8070 001E7F70 00000000 */   nop
/* 0E8074 001E7F74 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0E8078 001E7F78 5402238C */  lw          $3, %lo(ShopMenu + 0x184)($1)
/* 0E807C 001E7F7C 01006324 */  addiu       $3, $3, 0x1
/* 0E8080 001E7F80 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0E8084 001E7F84 540223AC */  sw          $3, %lo(ShopMenu + 0x184)($1)
.L001E7F88:
/* 0E8088 001E7F88 0000BF7B */  lq          $31, 0x0($29)
/* 0E808C 001E7F8C 1000BD27 */  addiu       $29, $29, 0x10
/* 0E8090 001E7F90 0800E003 */  jr          $31
/* 0E8094 001E7F94 00000000 */   nop
/* 0E8098 001E7F98 00000000 */  nop
/* 0E809C 001E7F9C 00000000 */  nop
