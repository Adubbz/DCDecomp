.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMcChdir
/* 1EBE8 0011EAE8 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 1EBEC 0011EAEC 2D40A000 */  daddu      $8, $5, $0
/* 1EBF0 0011EAF0 5000B4FF */  sd         $20, 0x50($sp)
/* 1EBF4 0011EAF4 2D28C000 */  daddu      $5, $6, $0
/* 1EBF8 0011EAF8 2500143C */  lui        $20, (0x250A38 >> 16)
/* 1EBFC 0011EAFC 3000B2FF */  sd         $18, 0x30($sp)
/* 1EC00 0011EB00 380A828E */  lw         $2, (0x250A38 & 0xFFFF)($20)
/* 1EC04 0011EB04 2D90E000 */  daddu      $18, $7, $0
/* 1EC08 0011EB08 6000BFFF */  sd         $31, 0x60($sp)
/* 1EC0C 0011EB0C 4000B3FF */  sd         $19, 0x40($sp)
/* 1EC10 0011EB10 2000B1FF */  sd         $17, 0x20($sp)
/* 1EC14 0011EB14 26004014 */  bnez       $2, .L0011EBB0
/* 1EC18 0011EB18 1000B0FF */   sd        $16, 0x10($sp)
/* 1EC1C 0011EB1C 2B00023C */  lui        $2, %hi(D_002A8640)
/* 1EC20 0011EB20 40865324 */  addiu      $19, $2, %lo(D_002A8640)
/* 1EC24 0011EB24 2400638E */  lw         $3, 0x24($19)
/* 1EC28 0011EB28 21006010 */  beqz       $3, .L0011EBB0
/* 1EC2C 0011EB2C 9CFF0224 */   addiu     $2, $0, -0x64
/* 1EC30 0011EB30 2B00023C */  lui        $2, %hi(D_002A86F0)
/* 1EC34 0011EB34 2B00103C */  lui        $16, %hi(D_002A8C00)
/* 1EC38 0011EB38 F0865124 */  addiu      $17, $2, %lo(D_002A86F0)
/* 1EC3C 0011EB3C 008C1026 */  addiu      $16, $16, %lo(D_002A8C00)
/* 1EC40 0011EB40 F08644AC */  sw         $4, -0x7910($2)
/* 1EC44 0011EB44 FF030624 */  addiu      $6, $0, 0x3FF
/* 1EC48 0011EB48 040028AE */  sw         $8, 0x4($17)
/* 1EC4C 0011EB4C 14002426 */  addiu      $4, $17, 0x14
/* 1EC50 0011EB50 5C16040C */  jal        strncpy
/* 1EC54 0011EB54 100030AE */   sw        $16, 0x10($17)
/* 1EC58 0011EB58 2D200002 */  daddu      $4, $16, $0
/* 1EC5C 0011EB5C 130420A2 */  sb         $0, 0x413($17)
/* 1EC60 0011EB60 E65A040C */  jal        sceSifWriteBackDCache
/* 1EC64 0011EB64 00040524 */   addiu     $5, $0, 0x400
/* 1EC68 0011EB68 2B00093C */  lui        $9, %hi(D_002A9C00)
/* 1EC6C 0011EB6C 12000B3C */  lui        $11, %hi(mceStorePwd)
/* 1EC70 0011EB70 0000B2AF */  sw         $18, 0x0($sp)
/* 1EC74 0011EB74 2D206002 */  daddu      $4, $19, $0
/* 1EC78 0011EB78 2D382002 */  daddu      $7, $17, $0
/* 1EC7C 0011EB7C 009C2925 */  addiu      $9, $9, %lo(D_002A9C00)
/* 1EC80 0011EB80 60EA6B25 */  addiu      $11, $11, %lo(mceStorePwd)
/* 1EC84 0011EB84 0C000524 */  addiu      $5, $0, 0xC
/* 1EC88 0011EB88 01000624 */  addiu      $6, $0, 0x1
/* 1EC8C 0011EB8C 14040824 */  addiu      $8, $0, 0x414
/* 1EC90 0011EB90 2A5D040C */  jal        sceSifCallRpc
/* 1EC94 0011EB94 04000A24 */   addiu     $10, $0, 0x4
/* 1EC98 0011EB98 2D184000 */  daddu      $3, $2, $0
/* 1EC9C 0011EB9C 04006014 */  bnez       $3, .L0011EBB0
/* 1ECA0 0011EBA0 2D106000 */   daddu     $2, $3, $0
/* 1ECA4 0011EBA4 0C000224 */  addiu      $2, $0, 0xC
/* 1ECA8 0011EBA8 380A82AE */  sw         $2, (0x250A38 & 0xFFFF)($20)
/* 1ECAC 0011EBAC 2D106000 */  daddu      $2, $3, $0
.L0011EBB0:
/* 1ECB0 0011EBB0 6000BFDF */  ld         $31, 0x60($sp)
/* 1ECB4 0011EBB4 5000B4DF */  ld         $20, 0x50($sp)
/* 1ECB8 0011EBB8 4000B3DF */  ld         $19, 0x40($sp)
/* 1ECBC 0011EBBC 3000B2DF */  ld         $18, 0x30($sp)
/* 1ECC0 0011EBC0 2000B1DF */  ld         $17, 0x20($sp)
/* 1ECC4 0011EBC4 1000B0DF */  ld         $16, 0x10($sp)
/* 1ECC8 0011EBC8 0800E003 */  jr         $31
/* 1ECCC 0011EBCC 7000BD27 */   addiu     $sp, $sp, 0x70
