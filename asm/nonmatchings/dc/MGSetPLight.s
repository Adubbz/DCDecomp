.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetPLight__FPA4_fPA4_f
/* 2DD20 0012DC20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2DD24 0012DC24 1000BF7F */  sq         $31, 0x10($sp)
/* 2DD28 0012DC28 0000B07F */  sq         $16, 0x0($sp)
/* 2DD2C 0012DC2C 281E8070 */  paddub     $3, $4, $0
/* 2DD30 0012DC30 2886A070 */  paddub     $16, $5, $0
/* 2DD34 0012DC34 C701023C */  lui        $2, %hi(D_1C75630)
/* 2DD38 0012DC38 30564424 */  addiu      $4, $2, %lo(D_1C75630)
/* 2DD3C 0012DC3C 282E6070 */  paddub     $5, $3, $0
/* 2DD40 0012DC40 1086040C */  jal        sceVu0CopyMatrix
/* 2DD44 0012DC44 00000000 */   nop
/* 2DD48 0012DC48 C701023C */  lui        $2, %hi(D_1C75670)
/* 2DD4C 0012DC4C 70564424 */  addiu      $4, $2, %lo(D_1C75670)
/* 2DD50 0012DC50 282E0072 */  paddub     $5, $16, $0
/* 2DD54 0012DC54 1086040C */  jal        sceVu0CopyMatrix
/* 2DD58 0012DC58 00000000 */   nop
/* 2DD5C 0012DC5C C701013C */  lui        $at, (0x1C7567C >> 16)
/* 2DD60 0012DC60 7C5620AC */  sw         $0, (0x1C7567C & 0xFFFF)($at)
/* 2DD64 0012DC64 C701013C */  lui        $at, (0x1C7568C >> 16)
/* 2DD68 0012DC68 8C5620AC */  sw         $0, (0x1C7568C & 0xFFFF)($at)
/* 2DD6C 0012DC6C C701013C */  lui        $at, (0x1C7569C >> 16)
/* 2DD70 0012DC70 9C5620AC */  sw         $0, (0x1C7569C & 0xFFFF)($at)
/* 2DD74 0012DC74 C701013C */  lui        $at, (0x1C756AC >> 16)
/* 2DD78 0012DC78 AC5620AC */  sw         $0, (0x1C756AC & 0xFFFF)($at)
/* 2DD7C 0012DC7C C701013C */  lui        $at, (0x1C75660 >> 16)
/* 2DD80 0012DC80 605620AC */  sw         $0, (0x1C75660 & 0xFFFF)($at)
/* 2DD84 0012DC84 C701013C */  lui        $at, (0x1C75664 >> 16)
/* 2DD88 0012DC88 645620AC */  sw         $0, (0x1C75664 & 0xFFFF)($at)
/* 2DD8C 0012DC8C C701013C */  lui        $at, (0x1C75668 >> 16)
/* 2DD90 0012DC90 685620AC */  sw         $0, (0x1C75668 & 0xFFFF)($at)
/* 2DD94 0012DC94 C701013C */  lui        $at, (0x1C7566C >> 16)
/* 2DD98 0012DC98 6C5620AC */  sw         $0, (0x1C7566C & 0xFFFF)($at)
/* 2DD9C 0012DC9C 1000BF7B */  lq         $31, 0x10($sp)
/* 2DDA0 0012DCA0 0000B07B */  lq         $16, 0x0($sp)
/* 2DDA4 0012DCA4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2DDA8 0012DCA8 0800E003 */  jr         $31
/* 2DDAC 0012DCAC 00000000 */   nop
