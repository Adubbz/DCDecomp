.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGClipVertex__FPf
/* 2EB40 0012EA40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2EB44 0012EA44 1000BF7F */  sq         $31, 0x10($sp)
/* 2EB48 0012EA48 0000B07F */  sq         $16, 0x0($sp)
/* 2EB4C 0012EA4C 28368070 */  paddub     $6, $4, $0
/* 2EB50 0012EA50 28860070 */  paddub     $16, $0, $0
/* 2EB54 0012EA54 2000A427 */  addiu      $4, $sp, 0x20
/* 2EB58 0012EA58 C701023C */  lui        $2, %hi(D_1C755F0)
/* 2EB5C 0012EA5C F0554524 */  addiu      $5, $2, %lo(D_1C755F0)
/* 2EB60 0012EA60 6285040C */  jal        sceVu0ApplyMatrix
/* 2EB64 0012EA64 00000000 */   nop
/* 2EB68 0012EA68 00088044 */  mtc1       $0, $f1
/* 2EB6C 0012EA6C 2C00A327 */  addiu      $3, $sp, 0x2C
/* 2EB70 0012EA70 000060C4 */  lwc1       $f0, 0x0($3)
/* 2EB74 0012EA74 32080046 */  c.eq.s     $f1, $f0
/* 2EB78 0012EA78 00000000 */  nop
/* 2EB7C 0012EA7C 03000045 */  bc1f       .L0012EA8C
/* 2EB80 0012EA80 00000000 */   nop
/* 2EB84 0012EA84 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 2EB88 0012EA88 000062AC */  sw         $2, 0x0($3)
.L0012EA8C:
/* 2EB8C 0012EA8C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 2EB90 0012EA90 00088244 */  mtc1       $2, $f1
/* 2EB94 0012EA94 000060C4 */  lwc1       $f0, 0x0($3)
/* 2EB98 0012EA98 43080046 */  div.s      $f1, $f1, $f0
/* 2EB9C 0012EA9C 2000A0C7 */  lwc1       $f0, 0x20($sp)
/* 2EBA0 0012EAA0 02000146 */  mul.s      $f0, $f0, $f1
/* 2EBA4 0012EAA4 2000A0E7 */  swc1       $f0, 0x20($sp)
/* 2EBA8 0012EAA8 2400A227 */  addiu      $2, $sp, 0x24
/* 2EBAC 0012EAAC 000040C4 */  lwc1       $f0, 0x0($2)
/* 2EBB0 0012EAB0 02000146 */  mul.s      $f0, $f0, $f1
/* 2EBB4 0012EAB4 000040E4 */  swc1       $f0, 0x0($2)
/* 2EBB8 0012EAB8 000061C4 */  lwc1       $f1, 0x0($3)
/* 2EBBC 0012EABC C701013C */  lui        $at, (0x1C756E8 >> 16)
/* 2EBC0 0012EAC0 E85620C4 */  lwc1       $f0, (0x1C756E8 & 0xFFFF)($at)
/* 2EBC4 0012EAC4 34080046 */  c.lt.s     $f1, $f0
/* 2EBC8 0012EAC8 00000000 */  nop
/* 2EBCC 0012EACC 02000045 */  bc1f       .L0012EAD8
/* 2EBD0 0012EAD0 00000000 */   nop
/* 2EBD4 0012EAD4 20001036 */  ori        $16, $16, 0x20
.L0012EAD8:
/* 2EBD8 0012EAD8 C701013C */  lui        $at, (0x1C756F8 >> 16)
/* 2EBDC 0012EADC F85620C4 */  lwc1       $f0, (0x1C756F8 & 0xFFFF)($at)
/* 2EBE0 0012EAE0 36080046 */  c.le.s     $f1, $f0
/* 2EBE4 0012EAE4 00000000 */  nop
/* 2EBE8 0012EAE8 02000145 */  bc1t       .L0012EAF4
/* 2EBEC 0012EAEC 00000000 */   nop
/* 2EBF0 0012EAF0 10001036 */  ori        $16, $16, 0x10
.L0012EAF4:
/* 2EBF4 0012EAF4 00008044 */  mtc1       $0, $f0
/* 2EBF8 0012EAF8 00000000 */  nop
/* 2EBFC 0012EAFC 36080046 */  c.le.s     $f1, $f0
/* 2EC00 0012EB00 00000000 */  nop
/* 2EC04 0012EB04 2D000145 */  bc1t       .L0012EBBC
/* 2EC08 0012EB08 00000000 */   nop
/* 2EC0C 0012EB0C 000041C4 */  lwc1       $f1, 0x0($2)
/* 2EC10 0012EB10 C701013C */  lui        $at, (0x1C756D4 >> 16)
/* 2EC14 0012EB14 D45620C4 */  lwc1       $f0, (0x1C756D4 & 0xFFFF)($at)
/* 2EC18 0012EB18 41080046 */  sub.s      $f1, $f1, $f0
/* 2EC1C 0012EB1C E042023C */  lui        $2, (0x42E00000 >> 16)
/* 2EC20 0012EB20 00008244 */  mtc1       $2, $f0
/* 2EC24 0012EB24 00000000 */  nop
/* 2EC28 0012EB28 07000046 */  neg.s      $f0, $f0
/* 2EC2C 0012EB2C 34080046 */  c.lt.s     $f1, $f0
/* 2EC30 0012EB30 00000000 */  nop
/* 2EC34 0012EB34 02000045 */  bc1f       .L0012EB40
/* 2EC38 0012EB38 00000000 */   nop
/* 2EC3C 0012EB3C 08001036 */  ori        $16, $16, 0x8
.L0012EB40:
/* 2EC40 0012EB40 E042023C */  lui        $2, (0x42E00000 >> 16)
/* 2EC44 0012EB44 00008244 */  mtc1       $2, $f0
/* 2EC48 0012EB48 00000000 */  nop
/* 2EC4C 0012EB4C 36080046 */  c.le.s     $f1, $f0
/* 2EC50 0012EB50 00000000 */  nop
/* 2EC54 0012EB54 02000145 */  bc1t       .L0012EB60
/* 2EC58 0012EB58 00000000 */   nop
/* 2EC5C 0012EB5C 04001036 */  ori        $16, $16, 0x4
.L0012EB60:
/* 2EC60 0012EB60 2000A1C7 */  lwc1       $f1, 0x20($sp)
/* 2EC64 0012EB64 C701013C */  lui        $at, (0x1C756D0 >> 16)
/* 2EC68 0012EB68 D05620C4 */  lwc1       $f0, (0x1C756D0 & 0xFFFF)($at)
/* 2EC6C 0012EB6C 41080046 */  sub.s      $f1, $f1, $f0
/* 2EC70 0012EB70 A043023C */  lui        $2, (0x43A00000 >> 16)
/* 2EC74 0012EB74 00008244 */  mtc1       $2, $f0
/* 2EC78 0012EB78 00000000 */  nop
/* 2EC7C 0012EB7C 07000046 */  neg.s      $f0, $f0
/* 2EC80 0012EB80 34080046 */  c.lt.s     $f1, $f0
/* 2EC84 0012EB84 00000000 */  nop
/* 2EC88 0012EB88 02000045 */  bc1f       .L0012EB94
/* 2EC8C 0012EB8C 00000000 */   nop
/* 2EC90 0012EB90 02001036 */  ori        $16, $16, 0x2
.L0012EB94:
/* 2EC94 0012EB94 A043023C */  lui        $2, (0x43A00000 >> 16)
/* 2EC98 0012EB98 00008244 */  mtc1       $2, $f0
/* 2EC9C 0012EB9C 00000000 */  nop
/* 2ECA0 0012EBA0 36080046 */  c.le.s     $f1, $f0
/* 2ECA4 0012EBA4 00000000 */  nop
/* 2ECA8 0012EBA8 2E000145 */  bc1t       .L0012EC64
/* 2ECAC 0012EBAC 00000000 */   nop
/* 2ECB0 0012EBB0 01001036 */  ori        $16, $16, 0x1
/* 2ECB4 0012EBB4 2B000010 */  b          .L0012EC64
/* 2ECB8 0012EBB8 00000000 */   nop
.L0012EBBC:
/* 2ECBC 0012EBBC 000041C4 */  lwc1       $f1, 0x0($2)
/* 2ECC0 0012EBC0 C701013C */  lui        $at, (0x1C756D4 >> 16)
/* 2ECC4 0012EBC4 D45620C4 */  lwc1       $f0, (0x1C756D4 & 0xFFFF)($at)
/* 2ECC8 0012EBC8 41080046 */  sub.s      $f1, $f1, $f0
/* 2ECCC 0012EBCC E042023C */  lui        $2, (0x42E00000 >> 16)
/* 2ECD0 0012EBD0 00008244 */  mtc1       $2, $f0
/* 2ECD4 0012EBD4 00000000 */  nop
/* 2ECD8 0012EBD8 07000046 */  neg.s      $f0, $f0
/* 2ECDC 0012EBDC 36080046 */  c.le.s     $f1, $f0
/* 2ECE0 0012EBE0 00000000 */  nop
/* 2ECE4 0012EBE4 02000145 */  bc1t       .L0012EBF0
/* 2ECE8 0012EBE8 00000000 */   nop
/* 2ECEC 0012EBEC 08001036 */  ori        $16, $16, 0x8
.L0012EBF0:
/* 2ECF0 0012EBF0 E042023C */  lui        $2, (0x42E00000 >> 16)
/* 2ECF4 0012EBF4 00008244 */  mtc1       $2, $f0
/* 2ECF8 0012EBF8 00000000 */  nop
/* 2ECFC 0012EBFC 34080046 */  c.lt.s     $f1, $f0
/* 2ED00 0012EC00 00000000 */  nop
/* 2ED04 0012EC04 02000045 */  bc1f       .L0012EC10
/* 2ED08 0012EC08 00000000 */   nop
/* 2ED0C 0012EC0C 04001036 */  ori        $16, $16, 0x4
.L0012EC10:
/* 2ED10 0012EC10 2000A1C7 */  lwc1       $f1, 0x20($sp)
/* 2ED14 0012EC14 C701013C */  lui        $at, (0x1C756D0 >> 16)
/* 2ED18 0012EC18 D05620C4 */  lwc1       $f0, (0x1C756D0 & 0xFFFF)($at)
/* 2ED1C 0012EC1C 41080046 */  sub.s      $f1, $f1, $f0
/* 2ED20 0012EC20 A043023C */  lui        $2, (0x43A00000 >> 16)
/* 2ED24 0012EC24 00008244 */  mtc1       $2, $f0
/* 2ED28 0012EC28 00000000 */  nop
/* 2ED2C 0012EC2C 07000046 */  neg.s      $f0, $f0
/* 2ED30 0012EC30 36080046 */  c.le.s     $f1, $f0
/* 2ED34 0012EC34 00000000 */  nop
/* 2ED38 0012EC38 02000145 */  bc1t       .L0012EC44
/* 2ED3C 0012EC3C 00000000 */   nop
/* 2ED40 0012EC40 02001036 */  ori        $16, $16, 0x2
.L0012EC44:
/* 2ED44 0012EC44 A043023C */  lui        $2, (0x43A00000 >> 16)
/* 2ED48 0012EC48 00008244 */  mtc1       $2, $f0
/* 2ED4C 0012EC4C 00000000 */  nop
/* 2ED50 0012EC50 34080046 */  c.lt.s     $f1, $f0
/* 2ED54 0012EC54 00000000 */  nop
/* 2ED58 0012EC58 02000045 */  bc1f       .L0012EC64
/* 2ED5C 0012EC5C 00000000 */   nop
/* 2ED60 0012EC60 01001036 */  ori        $16, $16, 0x1
.L0012EC64:
/* 2ED64 0012EC64 28160072 */  paddub     $2, $16, $0
/* 2ED68 0012EC68 1000BF7B */  lq         $31, 0x10($sp)
/* 2ED6C 0012EC6C 0000B07B */  lq         $16, 0x0($sp)
/* 2ED70 0012EC70 3000BD27 */  addiu      $sp, $sp, 0x30
/* 2ED74 0012EC74 0800E003 */  jr         $31
/* 2ED78 0012EC78 00000000 */   nop
/* 2ED7C 0012EC7C 00000000 */  nop
