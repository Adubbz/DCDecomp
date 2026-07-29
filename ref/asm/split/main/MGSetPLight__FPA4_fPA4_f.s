.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetPLight__FPA4_fPA4_f
/* 02DD20 0012DC20 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02DD24 0012DC24 1000BF7F */  sq          $31, 0x10($29)
/* 02DD28 0012DC28 0000B07F */  sq          $16, 0x0($29)
/* 02DD2C 0012DC2C 281E8070 */  paddub      $3, $4, $0
/* 02DD30 0012DC30 2886A070 */  paddub      $16, $5, $0
/* 02DD34 0012DC34 C701023C */  lui         $2, %hi(mgRenderInfo + 0x110)
/* 02DD38 0012DC38 30564424 */  addiu       $4, $2, %lo(mgRenderInfo + 0x110)
/* 02DD3C 0012DC3C 282E6070 */  paddub      $5, $3, $0
/* 02DD40 0012DC40 1086040C */  jal         sceVu0CopyMatrix
/* 02DD44 0012DC44 00000000 */   nop
/* 02DD48 0012DC48 C701023C */  lui         $2, %hi(mgRenderInfo + 0x150)
/* 02DD4C 0012DC4C 70564424 */  addiu       $4, $2, %lo(mgRenderInfo + 0x150)
/* 02DD50 0012DC50 282E0072 */  paddub      $5, $16, $0
/* 02DD54 0012DC54 1086040C */  jal         sceVu0CopyMatrix
/* 02DD58 0012DC58 00000000 */   nop
/* 02DD5C 0012DC5C C701013C */  lui         $1, %hi(mgRenderInfo + 0x15C)
/* 02DD60 0012DC60 7C5620AC */  sw          $0, %lo(mgRenderInfo + 0x15C)($1)
/* 02DD64 0012DC64 C701013C */  lui         $1, %hi(mgRenderInfo + 0x16C)
/* 02DD68 0012DC68 8C5620AC */  sw          $0, %lo(mgRenderInfo + 0x16C)($1)
/* 02DD6C 0012DC6C C701013C */  lui         $1, %hi(mgRenderInfo + 0x17C)
/* 02DD70 0012DC70 9C5620AC */  sw          $0, %lo(mgRenderInfo + 0x17C)($1)
/* 02DD74 0012DC74 C701013C */  lui         $1, %hi(mgRenderInfo + 0x18C)
/* 02DD78 0012DC78 AC5620AC */  sw          $0, %lo(mgRenderInfo + 0x18C)($1)
/* 02DD7C 0012DC7C C701013C */  lui         $1, %hi(mgRenderInfo + 0x140)
/* 02DD80 0012DC80 605620AC */  sw          $0, %lo(mgRenderInfo + 0x140)($1)
/* 02DD84 0012DC84 C701013C */  lui         $1, %hi(mgRenderInfo + 0x144)
/* 02DD88 0012DC88 645620AC */  sw          $0, %lo(mgRenderInfo + 0x144)($1)
/* 02DD8C 0012DC8C C701013C */  lui         $1, %hi(mgRenderInfo + 0x148)
/* 02DD90 0012DC90 685620AC */  sw          $0, %lo(mgRenderInfo + 0x148)($1)
/* 02DD94 0012DC94 C701013C */  lui         $1, %hi(mgRenderInfo + 0x14C)
/* 02DD98 0012DC98 6C5620AC */  sw          $0, %lo(mgRenderInfo + 0x14C)($1)
/* 02DD9C 0012DC9C 1000BF7B */  lq          $31, 0x10($29)
/* 02DDA0 0012DCA0 0000B07B */  lq          $16, 0x0($29)
/* 02DDA4 0012DCA4 2000BD27 */  addiu       $29, $29, 0x20
/* 02DDA8 0012DCA8 0800E003 */  jr          $31
/* 02DDAC 0012DCAC 00000000 */   nop
